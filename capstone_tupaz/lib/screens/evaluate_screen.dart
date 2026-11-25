import 'package:flutter/material.dart';
import 'package:capstone_tupaz/data/dummy_data.dart';
import 'package:capstone_tupaz/models/review.dart';
import 'package:capstone_tupaz/models/target.dart';
import 'package:capstone_tupaz/services/review_service.dart';

class EvaluateScreen extends StatefulWidget {
  final VoidCallback onSubmitted;
  const EvaluateScreen({super.key, required this.onSubmitted});

  @override
  State<EvaluateScreen> createState() => _EvaluateScreenState();
}

class _EvaluateScreenState extends State<EvaluateScreen> {
  final List<String> words = [
    'Tap a star',
    'Poor',
    'Fair',
    'Good',
    'Very good',
    'Excellent',
  ];

  Target selected = dummyTargets.first;
  int rating = 0;
  bool isSubmitting = false;
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    setState(() {
      isSubmitting = true;
    });

    try {
      await ReviewService.addReview(
        Review(
          targetId: selected.id,
          rating: rating,
          comment: commentController.text.trim(),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() {
        isSubmitting = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not submit your feedback. Please try again.'),
        ),
      );
      return;
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thank you! Your anonymous feedback was submitted.'),
      ),
    );

    setState(() {
      rating = 0;
      isSubmitting = false;
      commentController.clear();
    });
    widget.onSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are you evaluating?',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<Target>(
              initialValue: selected,
              isExpanded: true,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: [
                for (final t in dummyTargets)
                  DropdownMenuItem(
                    value: t,
                    child: Text(
                      '${t.typeLabel}: ${t.name} – ${t.subtitle}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (value) {
                setState(() {
                  selected = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Your rating',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    iconSize: 44,
                    color: Colors.amber.shade700,
                    icon: Icon(i <= rating ? Icons.star : Icons.star_border),
                    onPressed: () {
                      setState(() {
                        rating = i;
                      });
                    },
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('1 = Poor', style: TextStyle(color: Colors.grey)),
                Text(words[rating], style: const TextStyle(color: Colors.grey)),
                const Text('5 = Excellent',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Comments (optional)',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: commentController,
              maxLength: 500,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'What went well? What could improve?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: (rating == 0 || isSubmitting) ? null : submit,
                child: Text(isSubmitting ? 'Submitting...' : 'Submit feedback'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}