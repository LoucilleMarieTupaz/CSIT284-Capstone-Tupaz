import '../models/review.dart';
import '../models/target.dart';

const dummyTargets = [
  Target(
    id: 't1',
    name: 'Prof. Maria Santos',
    type: TargetType.teacher,
    subtitle: 'Information Management',
  ),
  Target(
    id: 't2',
    name: 'Prof. Jose Reyes',
    type: TargetType.teacher,
    subtitle: 'Industry Elective',
  ),
  Target(
    id: 't3',
    name: 'Prof. Ana Cruz',
    type: TargetType.teacher,
    subtitle: 'App Development',
  ),
  Target(
    id: 't4',
    name: 'Prof. Carlo Dizon',
    type: TargetType.teacher,
    subtitle: 'Data Analytics',
  ),
  Target(
    id: 't5',
    name: 'Prof. Liza Gomez',
    type: TargetType.teacher,
    subtitle: 'Mobile App Development',
  ),
  Target(
    id: 't6',
    name: 'Prof. Mark Villanueva',
    type: TargetType.teacher,
    subtitle: 'Technopreneurship',
  ),
  Target(
    id: 't7',
    name: 'Prof. Grace Tan',
    type: TargetType.teacher,
    subtitle: 'Discrete Mathematics',
  ),
  Target(
    id: 'e1',
    name: 'Tech Fest 2026',
    type: TargetType.event,
    subtitle: 'Annual IT showcase',
  ),
  Target(
    id: 'e2',
    name: 'Freshman Orientation',
    type: TargetType.event,
    subtitle: 'Welcome week',
  ),
  Target(
    id: 'e3',
    name: 'Career Fair 2026',
    type: TargetType.event,
    subtitle: 'Industry partners booth day',
  ),
];

final List<Review> dummyReviews = [
  Review(
    targetId: 't1',
    rating: 5,
    comment: 'Explains clearly and is very approachable.',
  ),
  Review(
    targetId: 't1',
    rating: 4,
    comment: 'Great examples, but a bit fast.',
  ),
  Review(
    targetId: 't2',
    rating: 4,
    comment: 'Well organized and fair grading.',
  ),
  Review(
    targetId: 't2',
    rating: 3,
    comment: 'Could use more practice activities.',
  ),
  Review(
    targetId: 't3',
    rating: 5,
    comment: 'Fun and very helpful!',
  ),
  Review(
    targetId: 't3',
    rating: 5,
  ),
  Review(
    targetId: 't4',
    rating: 3,
    comment: 'Lessons are hard to follow sometimes.',
  ),
  Review(
    targetId: 't4',
    rating: 4,
  ),
  Review(
    targetId: 't5',
    rating: 5,
    comment: 'Great projects and clear instructions.',
  ),
  Review(
    targetId: 't5',
    rating: 4,
    comment: 'Good class overall.',
  ),
  Review(
    targetId: 't6',
    rating: 4,
    comment: 'Knows the topic very well.',
  ),
  Review(
    targetId: 't6',
    rating: 4,
  ),
  Review(
    targetId: 't7',
    rating: 3,
    comment: 'Needs more examples.',
  ),
  Review(
    targetId: 't7',
    rating: 4,
    comment: 'Patient with questions.',
  ),
  Review(
    targetId: 'e1',
    rating: 5,
    comment: 'Fun and well planned!',
  ),
  Review(
    targetId: 'e1',
    rating: 4,
    comment: 'Loved the project booths.',
  ),
  Review(
    targetId: 'e2',
    rating: 4,
    comment: 'Helpful for new students.',
  ),
  Review(
    targetId: 'e2',
    rating: 5,
  ),
  Review(
    targetId: 'e3',
    rating: 4,
    comment: 'Good companies, but it was crowded.',
  ),
  Review(
    targetId: 'e3',
    rating: 5,
    comment: 'Got a lot of useful info.',
  ),
];

List<Review> reviewsFor(String targetId) {
  return dummyReviews.where((r) => r.targetId == targetId).toList();
}

double averageFor(String targetId) {
  final reviews = reviewsFor(targetId);
  if (reviews.isEmpty) {
    return 0;
  }
  int total = 0;
  for (final r in reviews) {
    total = total + r.rating;
  }
  return total / reviews.length;
}