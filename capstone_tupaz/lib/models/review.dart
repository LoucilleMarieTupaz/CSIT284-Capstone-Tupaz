class Review {
  const Review({
    this.id,
    required this.targetId,
    required this.rating,
    this.comment = '',
  });

  final String? id;
  final String targetId;
  final int rating;
  final String comment;

    Map<String, dynamic> toMap() {
    return {
      'targetId': targetId,
      'rating': rating,
      'comment': comment,
    };
  }

  factory Review.fromMap(String id, Map<String, dynamic> map) {
    return Review(
      id: id,
      targetId: map['targetId'] as String? ?? '',
      rating: (map['rating'] as num?)?.toInt() ?? 0,
      comment: map['comment'] as String? ?? '',
    );
  }
}