enum TargetType { teacher, event }

class Target {
  const Target({
    required this.id,
    required this.name,
    required this.type,
    required this.subtitle,
  });

  final String id;
  final String name;
  final TargetType type;
  final String subtitle;

  String get typeLabel => type == TargetType.teacher ? 'Teacher' : 'Event';
}