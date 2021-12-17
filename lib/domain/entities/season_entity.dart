import 'episode_entity.dart';

class SeasonEntity {
  final int seasonNumber;
  final List<EpisodeEntity> episodes;

  SeasonEntity({
    required this.seasonNumber,
    required this.episodes,
  });
}
