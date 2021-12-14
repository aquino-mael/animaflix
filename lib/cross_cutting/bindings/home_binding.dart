import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../data/services/services.dart';
import '../../infra/http/http.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
        fetchAnimesService: FetchAnimesService(
          httpClient: HttpAdapter(
            client: Dio()
          ),
        ),
      );
    });
  }
}
