class NewsItem {
  final int id;
  final String title;
  final String imgPath;
  final String category;
  final String author;
  final String time;
  final bool isFavorite;

  NewsItem({
    required this.id,
    required this.title,
    required this.imgPath,
    required this.category,
    required this.author,
    this.isFavorite = false,
    this.time = '10 minutes ago',
  });

  NewsItem copyWith({
    int? id,
    String? title,
    String? imgPath,
    String? category,
    String? author,
    String? time,
    bool? isFavorite,
  }) {
    return NewsItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imgPath: imgPath ?? this.imgPath,
      category: category ?? this.category,
      author: author ?? this.author,
      time: time ?? this.time,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

List<NewsItem> news = [
  NewsItem(
    id: 1,
    title: 'Fotografias de las instalaciones',
    imgPath:
        'assets/png/fotografias/escuela1.png',
    category: 'Fotografias',
    author: 'Estudiantes',
  ),
  NewsItem(
    id: 2,
    title: 'Calendario Escolar ',
    imgPath:
        'assets/png/fotografias/escuela8.png',
    category: 'Semestre 2025/1',
    author: 'ESCOM',
  ),
  NewsItem(
    id: 3,
    title: 'Donativos',
    imgPath:
        'assets/png/fotografias/escuela7.png',
    category: 'Semestre 2025/1',
    author: 'ESCOM',
  ),
  NewsItem(
    id: 4,
    title: 'Visita nuestras redes sociales',
    imgPath: 'assets/png/fotografias/escuela3.png',
    category: 'Social',
    author: 'ESCOM',
  ),
];