// lib/views/names_view.dart
import 'package:flutter/material.dart';
import '../models/name_model.dart';
import '../controllers/names_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class NamesView extends StatefulWidget {
  const NamesView({super.key});

  @override
  State<NamesView> createState() => _NamesViewState();
}

class _NamesViewState extends State<NamesView> {
  final NamesController _controller = NamesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listahan ng Ipapakulam',
          style: GoogleFonts.pacifico(
            // Using Google Font for Barbie-style
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 30, // Adjust size as needed
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 224, 17, 148),
        centerTitle: true,
      ),
      body: StreamBuilder<List<NameModel>>(
        stream: _controller.getNamesStream(),
        builder: (context, snapshot) {
          // Loading state
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check if there is no data
          if (snapshot.data!.isEmpty) {
            return const Center(child: Text('Ilista mo na teh.'));
          }

          // Loaded state with data
          final names = snapshot.data!;
          return ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              final name = names[index];
              return ListTile(
                title: Text(
                  name.name,
                  style: GoogleFonts.dancingScript(
                    // Applying Google Font
                    fontSize: 20, // Adjust the font size as needed
                    fontWeight: FontWeight.bold, // Optional: Make it bold
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _controller.showNameDialog(
                        context: context,
                        id: name.id,
                        currentName: name.name,
                        onSave: (newName) =>
                            _controller.updateName(name.id, newName),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _controller.showDeleteConfirmDialog(
                        context: context,
                        id: name.id,
                        onConfirm: () => _controller.deleteName(name.id),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.showNameDialog(
          context: context,
          onSave: (name) => _controller.createName(name),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
