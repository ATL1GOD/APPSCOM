class NewsItem {
  final int id;
  final String title;
  final String imgAssets;
  final String category;
  final String author;
  final String time;
  final bool isFavorite;

  NewsItem({
    required this.id,
    required this.title,
    required this.imgAssets,
    required this.category,
    required this.author,
    this.isFavorite = false,
    this.time = '10 minutes ago',
  });

  NewsItem copyWith({
    int? id,
    String? title,
    String? imgAssets,
    String? category,
    String? author,
    String? time,
    bool? isFavorite,
  }) {
    return NewsItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imgAssets: imgAssets ?? this.imgAssets,
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
    imgAssets:
        'assets/png/fotografias/escuela1.png',
    category: 'Fotografias',
    author: 'Estudiantes',
  ),
  NewsItem(
    id: 2,
    title: 'Calendario Escolar ',
    imgAssets:
        'assets/png/fotografias/escuela8.png',
    category: 'Semestre 2025/1',
    author: 'ESCOM',
  ),
  NewsItem(
    id: 3,
    title: 'Becas Escolares',
    imgAssets:
        'assets/png/fotografias/escuela19.png',
    category: 'Becas',
    author: 'Departamento de Becas',
  ),
  NewsItem(
    id: 4,
    title: 'Visita nuestras redes sociales',
    imgAssets: 'assets/png/fotografias/escuela3.png',
    category: 'Redes Sociales',
    author: 'ESCOM',
  ),
];