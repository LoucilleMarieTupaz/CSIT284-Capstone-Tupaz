import 'package:flutter/material.dart';
import 'package:capstone_tupaz/data/dummy_data.dart';
import 'package:capstone_tupaz/widgets/result_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final target in dummyTargets) ResultCard(target: target),
      ],
    );
  }
}