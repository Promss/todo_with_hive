import 'package:flutter/material.dart';
import 'package:todo_hive/widget/group_form/group_form.dart';
import 'package:todo_hive/widget/groups/group_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/groups': (context) => const GroupsWidget(),
        '/groups/form': (context) => const GroupsFormWidget()
      },
      initialRoute: '/groups',
    );
  }
}
