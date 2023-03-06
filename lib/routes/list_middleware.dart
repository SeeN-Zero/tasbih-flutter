import 'package:get/get.dart';

import '../controllers/list_controller.dart';

class ListMiddleware extends GetMiddleware {
  final listController = Get.find<ListController>();

  @override
  void onPageDispose() {
    // TODO: implement onPageDispose
    Get.delete<ListController>();
    super.onPageDispose();
  }
}
