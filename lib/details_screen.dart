import 'package:flutter/material.dart';
import 'form_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://picsum.photos/400/200',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "I am Ezaz Ahmed Sayem",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormScreen(),
                ),
              );
            },
            child: const Text("Get Started"),
          ),
        ],
      ),
    );
  }
}
