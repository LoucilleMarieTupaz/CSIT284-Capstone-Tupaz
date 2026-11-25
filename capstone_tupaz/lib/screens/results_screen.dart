import 'package:flutter/material.dart';
import 'package:capstone_tupaz/data/dummy_data.dart';
import 'package:capstone_tupaz/models/review.dart';
import 'package:capstone_tupaz/services/review_service.dart';
import 'package:capstone_tupaz/widgets/result_card.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late Future<List<Review>> reviewsFuture;

  @override
  void initState() {
    super.initState();
    reviewsFuture = ReviewService.getReviews();
  }

  void reload() {
    setState(() {
      reviewsFuture = ReviewService.getReviews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Review>>(
      future: reviewsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('Could not load results.'),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: reload,
                  child: const Text('Try again'),
                ),
              ],
            ),
          );
        }

        final reviews = snapshot.data ?? [];

        return Column(
          children: [
            for (final target in dummyTargets)
              ResultCard(
                target: target,
                reviews: reviews.where((r) => r.targetId == target.id).toList(),
              ),
          ],
        );
      },
    );
  }
}
