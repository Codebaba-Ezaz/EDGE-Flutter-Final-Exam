import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Map<String, String>> contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> contactList = prefs.getStringList("contacts") ?? [];

    setState(() {
      contacts = contactList
          .map((contact) => Map<String, String>.from(jsonDecode(contact)))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Screen"),
      ),
      body: contacts.isEmpty
          ? const Center(
        child: Text("No contacts available."),
      )
          : ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${contact['name']}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Email: ${contact['email']}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Contact: ${contact['contact']}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to FormScreen
                    },
                    child: const Text("Edit"),
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
