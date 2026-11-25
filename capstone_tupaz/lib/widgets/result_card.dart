import 'package:capstone_tupaz/models/review.dart';
import 'package:capstone_tupaz/models/target.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final Target target;
  final List<Review> reviews;

  const ResultCard({
    super.key,
    required this.target,
    required this.reviews,
  });

  Widget starBar(int stars, List<Review> reviews) {
    final count = reviews.where((r) => r.rating == stars).length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 28,child: Text('$stars★')),
          Expanded(
            child: LinearProgressIndicator(
              value: reviews.isEmpty ? 0 : count / reviews.length,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(width: 28, child: Text('$count', textAlign: TextAlign.end)),
        ],
      ),
    );
  }

   @override
  Widget build(BuildContext context) {
    final count = reviews.length;
    final total = reviews.fold<int>(0, (sum, r) => sum + r.rating);
    final average = count == 0 ? 0.0 : total / count;
    final filled = average.round();
    final comments = reviews.where((r) => r.comment.isNotEmpty).toList();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  count == 0 ? '–' : average.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${target.name} (${target.typeLabel})',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '★' * filled + '☆' * (5 - filled),
                        style: TextStyle(
                          color: Colors.amber.shade700,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${target.subtitle} · $count rating${count == 1 ? '' : 's'}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (int stars = 5; stars >= 1; stars--) starBar(stars, reviews),
            if (comments.isNotEmpty)
              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text('Comments (${comments.length})'),
                children: [
                  for (final r in comments)
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(r.comment),
                      subtitle: Text('★' * r.rating),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}