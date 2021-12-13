class AuthModel {
  AuthModel({
    required this.accessToken,
    required this.tokenId,
    required this.userId,
    required this.name,
    required this.email,
  });

  late final String accessToken;
  late final String tokenId;
  late final int userId;
  late final String name;
  late final String email;

  AuthModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenId = json['token_id'];
    userId = int.parse(json['user_id'].toString());
    name = json['name'];
    email = json['email'];
    
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['token_id'] = tokenId;
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['email'] = email;

    return _data;
  }
}
