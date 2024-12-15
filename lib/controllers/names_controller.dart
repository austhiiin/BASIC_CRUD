import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/name_model.dart';
import '../loadingscreen.dart';
import 'package:lottie/lottie.dart';
import '../dissolve.dart';

class NamesController {
  // Stream for retrieving names from Supabase
  Stream<List<NameModel>> getNamesStream() {
    return Supabase.instance.client
        .from('names')
        .stream(primaryKey: ['id']).map((List<Map<String, dynamic>> data) {
      return data.map((json) => NameModel.fromJson(json)).toList();
    });
  }

  // Create a new name entry
  Future<void> createName(String name) async {
    await Supabase.instance.client.from('names').insert({'name': name});
  }

  // Update an existing name entry
  Future<void> updateName(int id, String newName) async {
    await Supabase.instance.client
        .from('names')
        .update({'name': newName}).eq('id', id);
  }

  // Delete a name entry
  Future<void> deleteName(int id) async {
    await Supabase.instance.client.from('names').delete().eq('id', id);
  }

  // Show create/update dialog with LoadingScreen
  void showNameDialog({
    required BuildContext context,
    int? id,
    String currentName = '',
    required Future<void> Function(String) onSave,
  }) {
    final textController = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: id == null ? 'Enter Name' : 'Update Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                // Close the dialog
                Navigator.pop(context);

                // Navigate to the LoadingScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoadingScreen()),
                );

                // Wait for both the save operation and 5 seconds
                await Future.wait([
                  onSave(textController.text), // Perform save/update
                  Future.delayed(
                      const Duration(seconds: 5)), // Minimum wait time
                ]);

                // Pop the LoadingScreen after 5 seconds or when the operation completes
                Navigator.pop(context);
              },
              child: Text(id == null ? 'Save' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  // Show delete confirmation dialog
  void showDeleteConfirmDialog({
    required BuildContext context,
    required int id,
    required Function() onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to DeletingScreen
              Navigator.pop(context); // Close the confirmation dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeletingScreen()),
              );

              // Perform the delete operation after a delay
              Future.delayed(const Duration(seconds: 2), () {
                onConfirm(); // Perform the deletion
                Navigator.pop(
                    context); // Close the DeletingScreen after operation
              });
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }
}
