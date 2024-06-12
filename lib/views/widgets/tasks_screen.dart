import 'package:flutter/material.dart';
import 'package:todo_and_reminder_app/controller/task_controller.dart';
import 'package:todo_and_reminder_app/models/task.dart';
import 'package:todo_and_reminder_app/views/widgets/custom_drawer.dart';
import 'package:todo_and_reminder_app/views/widgets/listItem.dart';
import 'package:todo_and_reminder_app/views/widgets/list_add.dart';
import 'package:todo_and_reminder_app/views/widgets/task_edit.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final ContactsController contactsController = ContactsController();

  void onDelete(int index) {
    contactsController.delete(index);
    setState(() {});
  }

  Future<void> onEdit(Contact contact, int index) async {
    final data = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => ContactEditDialog(contact: contact),
    );

    if (data != null && data['name'] != null && data['task'] != null) {
      contactsController.edit(
        index: index,
        name: data['name'],
        task: data['task'],
      );
      setState(() {});
    }
  }

  Future<void> onAdd() async {
    final data = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => ContactAddDialog(),
    );

    if (data != null && data['name'] != null && data['task'] != null) {
      contactsController.add(data['name'], data['task']);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAdd,
          ),
        ],
      ),
      drawer: CustomDrawer(
        onThemeModeChanged: (bool value) {},
      ),
      body: ListView.builder(
        itemCount: contactsController.list.length,
        itemBuilder: (ctx, index) {
          final contact = contactsController.list[index];
          return ContactItem(
            contact: contact,
            onDelete: () => onDelete(index),
            onEdit: () => onEdit(contact, index),
          );
        },
      ),
    );
  }
}
