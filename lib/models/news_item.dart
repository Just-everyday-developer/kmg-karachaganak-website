class NewsItem {
  final String title;
  final String description;
  final String imageUrl;
  final DateTime date;

  NewsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}