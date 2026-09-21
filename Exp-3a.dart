// Experiment 3a: Responsive UI that adapts to different screen sizes

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
      title: 'Responsive UI',
      home: const ResponsivePage(),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  // the menu part (sidebar on big screens)
  Widget menuPanel() {
    return Container(
      color: Colors.indigo.shade50,
      child: ListView(
        children: const [
          ListTile(leading: Icon(Icons.home), title: Text('Home')),
          ListTile(leading: Icon(Icons.person), title: Text('Profile')),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ListTile(leading: Icon(Icons.info), title: Text('About')),
        ],
      ),
    );
  }

  // the same menu but in one row (top bar on small screens)
  Widget menuBar() {
    return Container(
      height: 70,
      color: Colors.indigo.shade50,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home, size: 30),
          Icon(Icons.person, size: 30),
          Icon(Icons.settings, size: 30),
          Icon(Icons.info, size: 30),
        ],
      ),
    );
  }

  // grid of cards, number of columns is decided by the screen
  Widget cardGrid(int columns) {
    return GridView.count(
      crossAxisCount: columns,
      padding: const EdgeInsets.all(12),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: List.generate(8, (index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length].shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            'Item ${index + 1}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive UI (LayoutBuilder)')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // constraints.maxWidth = the width we are allowed to use
          if (constraints.maxWidth > 700) {
            // wide screen: sidebar on the left, 3 column grid on the right
            return Row(
              children: [
                SizedBox(width: 220, child: menuPanel()),
                Expanded(child: cardGrid(3)),
              ],
            );
          } else {
            // narrow screen: menu on top, 2 column grid below it
            return Column(
              children: [
                menuBar(),
                Expanded(child: cardGrid(2)),
              ],
            );
          }
        },
      ),
    );
  }
}
