import '../../domain/entities/entities.dart';
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
    final response = await httpClient.request(
      url: 'https://api-animaflix.herokuapp.com/animes',
      method: HttpMethod.GET,
    );

    return response['results'].map<Anime>((result) => AnimeModel.fromJson(result).toEntity()).toList();
  }

  @override
  Future<Anime> fetchAnimeDetails(String animeId) {
    // TODO: implement fetchAnimeDetails
    throw UnimplementedError();
  }
}
