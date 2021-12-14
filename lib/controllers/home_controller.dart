import 'package:get/get.dart';

import '../domain/entities/entities.dart';
import '../domain/services/services.dart';
import '../ui/screens/screens.dart';

class HomeController extends GetxController implements IHomeController {
  final IFetchAnimesService fetchAnimesService;

  HomeController({
    required this.fetchAnimesService,
  });

  RxList<Anime> animes = <Anime>[].obs;

  @override
  void onInit() async {
    super.onInit();

    await fetchAllAnimes();
  }

  @override
  Future<void> fetchAllAnimes() async {
    if(animes.isNotEmpty) return;

    animes.addAll(
      await fetchAnimesService.fetchAllAnimes()
    );

    update();
  }
}
