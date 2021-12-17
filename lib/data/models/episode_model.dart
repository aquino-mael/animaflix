import '../../domain/entities/entities.dart';

class EpisodeModel {
  final int number;
  final String date;
  final String previewUrl;
  final Map<String, dynamic>? players;

  EpisodeModel({
    required this.number,
    required this.date,
    required this.previewUrl,
    required this.players,
  });

  factory EpisodeModel.fromJson(Map episodyJson) {
    return EpisodeModel(
      number: int.parse(episodyJson['number']),
      date: episodyJson['date'],
      previewUrl: episodyJson['preview'],
      players: episodyJson['players'],
    );
  }

  EpisodeEntity toEntity() {
    return EpisodeEntity(
      number: number,
      date: date,
      previewUrl: previewUrl,
      players: players
    );
  }
}
