import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contact_screen.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController contactController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactController,
              decoration: const InputDecoration(
                labelText: "Contact",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final String name = nameController.text;
                  final String email = emailController.text;
                  final String contact = contactController.text;

                  final SharedPreferences prefs =
                  await SharedPreferences.getInstance();

                  // Retrieve existing data
                  List<String> contactList = prefs.getStringList("contacts") ?? [];

                  // Append new data
                  String newContact = jsonEncode({
                    "name": name,
                    "email": email,
                    "contact": contact,
                  });
                  contactList.add(newContact);

                  // Save the updated list
                  await prefs.setStringList("contacts", contactList);

                  // Navigate to ContactScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactScreen(),
                    ),
                  );
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
