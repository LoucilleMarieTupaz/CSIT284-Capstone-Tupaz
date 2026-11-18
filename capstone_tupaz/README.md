# Student Feedback / Evaluation Form

**Name:** Loucille Marie B. Tupaz
**Workstation Number:** 19

## Project Description
Student Feedback / Evaluation Form is a Flutter app that lets students
rate a teacher or an event. A student fills out a short form with a star rating
and a comment, submits it, and can then see the average rating for that teacher
or event.

## Core Features
- Fill out a rating form (stars + comments) for a teacher or event
- Submit the feedback
- View the average rating

## Cut for Scope
- One evaluation type only
- Anonymous only (no login, no names or IDs stored)
- No admin dashboard (the Results screen shows the raw averages)

## Screens
| Screen | What it does |
|---|---|
| Home | Lists the teachers and events with their current average |
| Evaluate | Star rating (1-5) and optional comment, then submit |
| Results | Shows the average rating and comments for each teacher or event |

## Tech Stack
- Flutter (Dart)
- Firebase / Cloud Firestore (planned for Week 2)

## How to Run
```
flutter pub get
flutter run
flutter test
```

## Project Structure
```
lib/
  main.dart
  models/     review.dart, target.dart
  data/       dummy_data.dart
  screens/    home_screen.dart, evaluate_screen.dart, results_screen.dart
  widgets/    star_rating.dart, result_card.dart
test/         widget_test.dart
```

## Progress
- [ ] Week 1: Setup, core screens, 10 dummy teachers and events
- [ ] Week 2: Firebase integration, full submit and view flow
- [ ] Week 3: UI polish, testing, bug fixes, demo video and documentation