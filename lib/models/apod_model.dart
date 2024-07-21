class Apod {
  final String title;
  final String date;
  final String url;
  final String explanation;

  Apod({
    required this.title,
    required this.date,
    required this.url,
    required this.explanation,
  });

  // Factory method to create an instance from a JSON object
  factory Apod.fromJson(Map<String, dynamic> json) {
    return Apod(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      url: json['url'] ?? '',
      explanation: json['explanation'] ?? '',
    );
  }

  // Convert the instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'url': url,
      'explanation': explanation,
    };
  }
}
