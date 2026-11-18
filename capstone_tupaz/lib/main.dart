import 'package:flutter/material.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Feedback',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: const Text('Student Feedback')),
        body: ListView.builder(
          itemCount: dummyTargets.length,
          itemBuilder: (context, index) {
            final target = dummyTargets[index];
            return ListTile(
              title: Text(target.name),
              subtitle: Text('${target.typeLabel} • ${target.subtitle}'),
            );
          },
        ),
      ),
    );
  }
}