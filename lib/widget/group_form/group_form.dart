import 'package:flutter/material.dart';
import 'package:todo_hive/widget/group_form/group_form_form.dart';

class GroupsFormWidget extends StatefulWidget {
  const GroupsFormWidget({super.key});

  @override
  State<GroupsFormWidget> createState() => _GroupsFormWidgetState();
}

class _GroupsFormWidgetState extends State<GroupsFormWidget> {
  final _model = GroupsFormWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupsFormWidgetModelProvider(_model,
        child: const _GroupFormWidgetBody());
  }
}

class _GroupFormWidgetBody extends StatelessWidget {
  const _GroupFormWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создание новой группы'),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: const _GroupNameWidget(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            GroupsFormWidgetModelProvider.read(context)?.model.saveGroup(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = GroupsFormWidgetModelProvider.read(context)?.model;
    return TextField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Имя группы'),
      onEditingComplete: () => model?.saveGroup(context),
      onChanged: (value) => model?.groupName = value,
    );
  }
}
