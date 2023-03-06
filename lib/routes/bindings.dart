import 'package:counter/controllers/add_controller.dart';
import 'package:counter/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../controllers/list_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent:true);
    //Get.lazyPut<MainController>(() => MainController());
  }
}

class AddBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(AddController());
    Get.lazyPut<AddController>(() => AddController());
  }
}

class ListBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(ListController());
    Get.lazyPut<ListController>(() => ListController());
  }
}
