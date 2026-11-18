class Review {
  const Review({
    required this.targetId,
    required this.rating,
    this.comment = '',
  });

  final String targetId;
  final int rating;
  final String comment;
}