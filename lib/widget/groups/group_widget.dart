import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({super.key});

  void showForm(BuildContext context) {
    Navigator.pushNamed(context, '/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Группы'),
      ),
      body: const _GroupsListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupsListWidget extends StatefulWidget {
  const _GroupsListWidget({super.key});

  @override
  State<_GroupsListWidget> createState() => _GroupsListWidgetState();
}

class _GroupsListWidgetState extends State<_GroupsListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return _GroupsListRowWidget(
            indexListRow: index,
          );
        },
        itemCount: 30);
  }
}

class _GroupsListRowWidget extends StatelessWidget {
  final int indexListRow;
  const _GroupsListRowWidget({super.key, required this.indexListRow});

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableBehindActionPane(),
      secondaryActions: [
        IconSlideAction(
          onTap: () {},
          color: Colors.red,
          caption: 'Delete',
          icon: Icons.delete,
        ),
      ],
      child: ColoredBox(
        color: Colors.white,
        child: ListTile(
          onTap: () {
            print('Hello');
          },
          title: const Text('Hello'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
