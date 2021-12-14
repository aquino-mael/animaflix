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
  final _filter = ''.obs;

  String get filter => _filter.value;
  set filter(String value) => _filter.value = value;

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
