import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/services/services.dart';
import '../http/http.dart';
import '../models/models.dart';

class FetchAnimesService implements IFetchAnimesService {
  final HttpClient httpClient;

  FetchAnimesService({
    required this.httpClient,
  });

  @override
  Future<List<Anime>> fetchAllAnimes() async {
    try {
      final response = await httpClient.request(
        url: 'https://api-animaflix.herokuapp.com/animes',
        method: HttpMethod.GET,
      );

      return response['results']
            .map<Anime>((result) => AnimeModel.fromJson(result).toEntity())
            .toList();
    } catch(e) {
      throw AppFailure('Error ao buscar lista de animes');
    }
  }

  @override
  Future<Anime> fetchAnimeDetails(String animeId) async {
    try {
      final response = await httpClient.request(
        url: 'https://api-animaflix.herokuapp.com/animes/$animeId',
        method: HttpMethod.GET,
      );

      return AnimeModel.fromJson(response).toEntity();
    } catch (e) {
      throw AppFailure('Erro ao buscar detalhes do anime!');
    }
  }
}
