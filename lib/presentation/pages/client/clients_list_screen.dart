import 'package:flutter/material.dart';
import 'add_edit_client_screen.dart';

class ClientsListScreen extends StatelessWidget {
  const ClientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("قائمة العملاء")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddEditClientScreen()),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text("تجربة إضافة عميل جديد 👤"),
        ),
      ),
    );
  }
}
