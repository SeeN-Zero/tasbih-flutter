import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainMiddleware extends GetMiddleware {
  final mainController = Get.find<MainController>();
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    // TODO: implement onPageBuildStart
    mainController.onPageCall();
    return super.onPageBuildStart(page);
  }
}
