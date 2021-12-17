import 'package:get/get.dart';

import '../domain/entities/anime_entity.dart';
import '../domain/services/services.dart';
import '../ui/screens/screens.dart';

class DetailsController extends GetxController implements IDetailsController {
  final IFetchAnimesService fetchAnimesService;

  DetailsController({
    required this.fetchAnimesService,
  });

  final _anime = Rx<Anime?>(null);
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  Anime? get anime => _anime.value;
  set anime(Anime? value) => _anime.value = value;

  @override
  Future<void> fetchFullAnimeDetails(String animeId) async {
    isLoading = true;
    update();

    final responseAnime = await fetchAnimesService.fetchAnimeDetails(animeId);

    anime = responseAnime;
    isLoading = false;
    update();
  }
}
