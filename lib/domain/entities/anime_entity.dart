class Anime {
  final String banner;
  final String? category;
  final String? description;
  final List<String> genres;
  final String id;
  final String name;
  final double note;
  final int year;

  Anime({
    required this.banner,
    required this.category,
    required this.description,
    required this.genres,
    required this.id,
    required this.name,
    required this.note,
    required this.year,
  });
}
