import '../../domain/entities/entities.dart';

class AnimeModel {
  final String id;
  final String banner;
  final List<String> genres;
  final String name;
  final double note;
  final int year;

  AnimeModel({
    required this.id,
    required this.banner,
    required this.genres,
    required this.name,
    required this.note,
    required this.year,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['_id'],
      banner: json['banner'],
      genres: <String>[...json['genres']],
      name: json['name'],
      note: double.parse(json['note'].toString().isEmpty ? '0.0' : json['note']),
      year: int.parse(json['year']),
    );
  }

  Anime toEntity() {
    return Anime(
      id: id,
      banner: banner,
      genres: genres,
      name: name,
      note: note,
      year: year,
    );
  }
}
