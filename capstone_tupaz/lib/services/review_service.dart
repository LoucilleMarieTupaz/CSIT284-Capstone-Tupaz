
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:capstone_tupaz/models/review.dart';

class ReviewService {
  static const String host =
      'capstone-tupaz-default-rtdb.asia-southeast1.firebasedatabase.app';

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static final Set<String> myIds = {};

  static Uri url(String path) => Uri.https(host, path);

  static Future<void> addReview(Review review) async {
    final response = await http.post(
      url('reviews.json'),
      headers: headers,
      body: json.encode(review.toMap()),
    );
    if (response.statusCode >= 400) {
      throw Exception('Could not save review');
    }
    final newId = json.decode(response.body)['name'] as String;
    myIds.add(newId);
  }

  static Future<List<Review>> getReviews() async {
    final response = await http.get(url('reviews.json'));
    if (response.statusCode >= 400) {
      throw Exception('Could not load reviews');
    }
    if (response.body == 'null') {
      return [];
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final reviews = <Review>[];
    data.forEach((id, value) {
      reviews.add(Review.fromMap(id, value as Map<String, dynamic>));
    });
    return reviews;
  }

  static Future<void> updateReview(String id, int rating, String comment) async {
    final response = await http.patch(
      url('reviews/$id.json'),
      headers: headers,
      body: json.encode({'rating': rating, 'comment': comment}),
    );
    if (response.statusCode >= 400) {
      throw Exception('Could not update review');
    }
  }

  static Future<void> deleteReview(String id) async {
    final response = await http.delete(url('reviews/$id.json'));
    if (response.statusCode >= 400) {
      throw Exception('Could not delete review');
    }
    myIds.remove(id);
  }
}