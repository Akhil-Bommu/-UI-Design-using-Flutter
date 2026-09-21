// Experiment 3b: MediaQuery and breakpoints for responsiveness


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// our breakpoints (screen widths in logical pixels)
class Breakpoints {
  static const double mobile = 600; // below 600  -> mobile
  static const double tablet = 1024; // 600 - 1024 -> tablet, above -> desktop
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breakpoints Demo',
      home: const BreakpointPage(),
    );
  }
}

class BreakpointPage extends StatelessWidget {
  const BreakpointPage({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery gives us info about the screen
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final orientation = MediaQuery.of(context).orientation;

    String deviceType;
    int columns;
    double fontSize;
    MaterialColor color;

    if (width < Breakpoints.mobile) {
      deviceType = 'Mobile';
      columns = 1;
      fontSize = 16;
      color = Colors.green;
    } else if (width < Breakpoints.tablet) {
      deviceType = 'Tablet';
      columns = 2;
      fontSize = 20;
      color = Colors.orange;
    } else {
      deviceType = 'Desktop';
      columns = 4;
      fontSize = 24;
      color = Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$deviceType layout'),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // info box showing the values we read from MediaQuery
          Container(
            width: double.infinity,
            color: color.shade100,
            padding: const EdgeInsets.all(12),
            child: Text(
              'Width: ${width.toStringAsFixed(0)}  |  '
              'Height: ${height.toStringAsFixed(0)}\n'
              'Orientation: ${orientation.name}  |  Columns: $columns',
              style: TextStyle(fontSize: fontSize),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Card ${index + 1}',
                    style: TextStyle(color: Colors.white, fontSize: fontSize),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
