class Task {
  final String? id;
  final String title;
  final String description;
  final String timestamp;
  final bool isDone;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.isDone,
  });

 // GET
  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      timestamp: map['timestamp'],
      isDone: map['isDone'],
    );
  }
  // POST
  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title, 
    'description': description,
    'timestamp': timestamp,
    'isDone': isDone,
  };
}
