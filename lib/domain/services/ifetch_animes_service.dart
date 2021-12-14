import '../entities/entities.dart';

abstract class IFetchAnimesService {
  Future<List<Anime>> fetchAllAnimes();
  Future<Anime> fetchAnimeDetails(String animeId);
}
