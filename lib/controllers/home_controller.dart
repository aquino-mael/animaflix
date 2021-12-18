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
  final _isLoading = false.obs;

  String get filter => _filter.value;
  set filter(String value) => _filter.value = value;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() async {
    super.onInit();

    await fetchAllAnimes();
  }

  @override
  Future<void> fetchAllAnimes() async {
    if(animes.isNotEmpty) return;
    isLoading = true;
    update();

    try {
      animes.addAll(
        await fetchAnimesService.fetchAllAnimes()
      );
    } finally {
      isLoading = false;
      update();
    }


  }
}
