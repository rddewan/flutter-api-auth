import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BuildScaffold extends ConsumerWidget {
  const BuildScaffold(this.title, this.widget, this.fab, {Key? key}) : super(key: key);
  final String title;
  final Widget widget;
  final FloatingActionButton? fab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onSelected: (value) => onItemSelected(context, value,ref),
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
      break;
    default:
  }
}
}
