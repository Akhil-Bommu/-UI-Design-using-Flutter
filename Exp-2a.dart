// Experiment 2a: Basic Flutter widgets (Text, Image, Container, etc.)


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets Demo',
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const WidgetsPage(),
    );
  }
}

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- Text -----
            const Text(
              'This is a Text widget',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Text can be styled with size, colour, weight, etc.',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),

            // ----- Image (from the internet) -----
            // to use a local image: put it in assets/, add it in pubspec.yaml
            // and use Image.asset('assets/photo.png')
            const Text('Image widget:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/400/180',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Image could not be loaded (check internet)');
                },
              ),
            ),
            const SizedBox(height: 20),

            // ----- Container -----
            const Text('Container widget:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: const Text('I am inside a Container with padding, colour and border.'),
            ),
            const SizedBox(height: 20),

            // ----- Icon -----
            const Text('Icon widget:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.home, size: 36, color: Colors.blue),
                SizedBox(width: 12),
                Icon(Icons.favorite, size: 36, color: Colors.red),
                SizedBox(width: 12),
                Icon(Icons.star, size: 36, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 20),

            // ----- Button -----
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button was pressed!')),
                );
              },
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(height: 20),

            // ----- Card + ListTile -----
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Card with ListTile'),
                subtitle: Text('Subtitle goes here'),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
