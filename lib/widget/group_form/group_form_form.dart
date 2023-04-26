import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive/domain/entity/group.dart';

class GroupsFormWidgetModel {
  var groupName = '';
  void saveGroup(BuildContext context) async {
    if (groupName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final group = Group(name: groupName);
    await box.add(group);
    Navigator.of(context).pop();
  }
}

class GroupsFormWidgetModelProvider extends InheritedWidget {
  final GroupsFormWidgetModel model;
  const GroupsFormWidgetModelProvider(
    this.model, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static GroupsFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsFormWidgetModelProvider>();
  }

  static GroupsFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            GroupsFormWidgetModelProvider>()
        ?.widget;
    return widget is GroupsFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(GroupsFormWidgetModelProvider oldWidget) {
    return true;
  }
}
