import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_hive/widget/groups/group_widget_model.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({super.key});

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final _model = GroupsWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelProvider(model: _model, child: _GroupWidgetBody());
  }
}

class _GroupWidgetBody extends StatelessWidget {
  const _GroupWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Группы'),
      ),
      body: const _GroupsListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            GroupsWidgetModelProvider.read(context)?.model.showForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupsListWidget extends StatelessWidget {
  const _GroupsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsWidgetModelProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _GroupsListRowWidget(
            indexListRow: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
          );
        },
        itemCount: groupsCount);
  }
}

class _GroupsListRowWidget extends StatelessWidget {
  final int indexListRow;
  const _GroupsListRowWidget({super.key, required this.indexListRow});

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetModelProvider.read(context)!.model;
    final group = model.groups[indexListRow];
    return Slidable(
      actionPane: const SlidableBehindActionPane(),
      secondaryActions: [
        IconSlideAction(
          onTap: () => model.deleteGroup(indexListRow),
          color: Colors.red,
          caption: 'Delete',
          icon: Icons.delete,
        ),
      ],
      child: ColoredBox(
        color: Colors.white,
        child: ListTile(
          onTap: () {},
          title: Text(group.name),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
