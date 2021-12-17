import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/controller/auth/logout/logout_controller.dart';
import 'package:login_register/controller/auth/logout/logout_state.dart';
import 'package:login_register/ui/page/splash/splash_page.dart';
import 'package:login_register/ui/widget/build_progress_bar.dart';

class BuildScaffold extends ConsumerWidget {
  const BuildScaffold(this.title, this.widget, this.fab, {Key? key})
      : super(key: key);
  final String title;
  final Widget widget;
  final FloatingActionButton? fab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LogoutState>(provideLogoutController, (previous, next) {
      next.logout.when(
          data: (value) {            
            if (value) {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SplashPage()));
            }
          },
          error: (e, s) {},
          loading: () {}
      );
    });
    return Scaffold(
      appBar: buildAppBar(context, ref),
      body: SafeArea(child: widget),
      floatingActionButton: fab,
    );
  }

  AppBar buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        Theme(
          data: Theme.of(context).copyWith(
              dividerColor: Colors.redAccent,
              iconTheme: const IconThemeData(color: Colors.orange)),
          child: PopupMenuButton<int>(
            onSelected: (value) => onItemSelected(context, value, ref),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      color: Colors.grey,
                      size: 24.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('Setting')
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('SignOut')
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }

  onItemSelected(BuildContext context, int item, WidgetRef ref) {
    switch (item) {
      case 1:
        ref.read(provideLogoutController.notifier).logout();
        break;
      default:
    }
  }
}
