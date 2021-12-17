import '../../domain/entities/entities.dart';
import 'models.dart';

class AnimeModel {
  final String banner;
  final String? category;
  final String? description;
  final List<String> genres;
  final List<SeasonEntity>? seasons;
  final String id;
  final String name;
  final double note;
  final int year;

  AnimeModel({
    required this.banner,
    required this.category,
    required this.description,
    required this.genres,
    required this.seasons,
    required this.id,
    required this.name,
    required this.note,
    required this.year,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['_id'],
      banner: json['banner'],
      category: json['category'],
      description: json['description'],
      genres: <String>[...json['genres']],
      name: json['name'],
      note: double.parse(json['note'].toString().isEmpty ? '0.0' : json['note']),
      year: int.parse(json['year']),
      seasons: json['seasons']
                ?.map<SeasonEntity>((seasonJson) => SeasonModel.fromJson(seasonJson).toEntity())
                ?.toList(),
    );
  }

  Anime toEntity() {
    return Anime(
      id: id,
      category: category,
      description: description,
      banner: banner,
      genres: genres,
      name: name,
      note: note,
      year: year,
      seasons: seasons,
    );
  }
}
