import '../../domain/entities/entities.dart';
import 'episode_model.dart';

class SeasonModel {
  final int seasonNumber;
  final List<EpisodeEntity> episodes;

  SeasonModel({
    required this.seasonNumber,
    required this.episodes,
  });

  factory SeasonModel.fromJson(Map seasonJson) {
    return SeasonModel(
      seasonNumber: int.parse(seasonJson['number']),
      episodes: seasonJson['episodes']
                .map<EpisodeEntity>((episodyJson) => EpisodeModel.fromJson(episodyJson).toEntity())
                .toList(),
    );
  }

  SeasonEntity toEntity() {
    return SeasonEntity(
      seasonNumber: seasonNumber,
      episodes: episodes,
    );
  }
}
