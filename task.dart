class Task {
  String title;
  String description;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  @override
  String toString() {
    return '[${isCompleted ? 'X' : ' '}] $title: $description';
  }
}
