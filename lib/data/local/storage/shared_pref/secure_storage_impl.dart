import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_register/data/local/model/auth/auth_model.dart';
import 'package:login_register/data/local/storage/provide_flutter_secure_storage.dart';
import 'package:login_register/data/local/storage/shared_pref/secure_stoarge.dart';
import 'package:login_register/util/failure.dart';

final provideSecureStoreage = Provider<SecureStorageImpl>((ref) {
  final _storage = ref.watch(provideFlutterSecureStirage);
  return SecureStorageImpl(_storage);
});

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorageImpl(this._storage);

  static const _keyAccessToken = 'access_token';
  static const _keyTokenId = 'token_id';
  static const _keyUserId = 'user_id';
  static const _keyName = 'name';
  static const _keyEmail = 'email';

  AuthModel? _cachedAuthModel;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Future<bool> clear() async {
    try {
      _cachedAuthModel = null;
      _storage.deleteAll();
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<AuthModel?> read() async {
    if (_cachedAuthModel != null) {
      return _cachedAuthModel;
    }

    final accessToken = await _storage.read(key: _keyAccessToken);

    if (accessToken == null) {
      return null;
    }

    final json = <String, dynamic>{};
    json['access_token'] = await _storage.read(key: _keyAccessToken);
    json['token_id'] = await _storage.read(key: _keyTokenId);
    json['user_id'] = await _storage.read(key: _keyUserId);
    json['name'] = await _storage.read(key: _keyName);
    json['email'] = await _storage.read(key: _keyEmail);    

    //cache the auth model after read else it will be null every time we read after 1st login
    _cachedAuthModel = AuthModel.fromJson(json);
    return _cachedAuthModel;
  }

  @override
  Future<bool> save(AuthModel authModel) async {
    try {
      _cachedAuthModel = authModel;
      _storage.write(key: _keyAccessToken, value: authModel.accessToken);
      _storage.write(key: _keyTokenId, value: authModel.tokenId);
      _storage.write(key: _keyUserId, value: authModel.userId.toString());
      _storage.write(key: _keyName, value: authModel.name);
      _storage.write(key: _keyEmail, value: authModel.email);

      return true;
    } on PlatformException catch (e) {
      throw Failure(message: e.details);
    }
  }
}
