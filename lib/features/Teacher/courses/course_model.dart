class Courses {
  final String id;
  final String title;
  final String content;
  final String status;
  final List<dynamic> chapters;

  Courses({
    required this.id,
    required this.title,
    required this.content,
    required this.status,
    required this.chapters,
  });

  factory Courses.fromJson(Map<String, dynamic> json) {
    final chapters = json['chapters'] ?? [];
    String contentText = '';

    for (var chapter in chapters) {
      final chapterTitle = chapter['title'] ?? '';
      if (chapterTitle.isNotEmpty) {
        contentText += '\n$chapterTitle\n';
      }

      if (chapter['topics'] != null) {
        for (var topic in chapter['topics']) {
          final topicTitle = topic['title'] ?? '';
          final topicContent = topic['content'] ?? '';
          if (topicTitle.isNotEmpty) {
            contentText += '• $topicTitle\n';
          }
          if (topicContent.isNotEmpty) {
            contentText += '$topicContent\n\n';
          }
        }
      }
    }

    return Courses(
      id: json['id'].toString(),
      title: json['name'] ?? '',
      content: contentText.trim(),
      status: json['status'] ?? '',
      chapters: chapters,
    );
  }
}
