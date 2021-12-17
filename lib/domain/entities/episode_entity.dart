class EpisodeEntity {
  final int number;
  final String date;
  final String previewUrl;
  final Map<String, dynamic>? players;

  EpisodeEntity({
    required this.number,
    required this.date,
    required this.previewUrl,
    required this.players,
  });
}
