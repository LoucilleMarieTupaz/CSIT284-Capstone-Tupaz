import 'package:flutter/material.dart';
import 'package:capstone_tupaz/screens/evaluate_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Text(
                  'Student Feedback Form',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Rate a teacher or event. Your response is anonymous.',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 16),
                EvaluateScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}