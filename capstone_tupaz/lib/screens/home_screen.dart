import 'package:capstone_tupaz/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone_tupaz/screens/evaluate_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;

  Widget tabButton(String label, int index) {
    return Expanded(
      child: tab == index
          ? FilledButton(
              onPressed: () => setState(() => tab = index),
              child: Text(label),
            )
          : OutlinedButton(
              onPressed: () => setState(() => tab = index),
              child: Text(label),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Student Feedback Form',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Rate a teacher or event. Your response is anonymous.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    tabButton('Evaluate', 0),
                    const SizedBox(width: 8),
                    tabButton('Results', 1),
                  ],
                ),
                const SizedBox(height: 16),
                if (tab == 0)
                  EvaluateScreen(onSubmitted: () => setState(() => tab = 1))
                else
                  const ResultsScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}