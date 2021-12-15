import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../controllers/details_controller.dart';
import '../../data/services/fetch_animes_service.dart';
import '../../infra/http/http.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController(
      fetchAnimesService: FetchAnimesService(
        httpClient: HttpAdapter(
          client: Dio(),
        ),
      ),
    ));
  }
}
