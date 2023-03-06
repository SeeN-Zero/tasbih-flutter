import 'package:counter/models/counter.dart';
import 'package:counter/repository/counter_repository.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  RxList<Counter> counterList = <Counter>[].obs;
  final totalItem = 0.obs;
  final percentage = <double>[].obs;
  CounterRepository counterRepository = Get.put(CounterRepository());

  double getPercentage({required int counter, required int goal}) {
    return counter / goal;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onPageCall();
  }

  void leavePage() {
    Get.delete<ListController>();
  }

  void onPageCall() async {
    percentage.clear();
    counterList.value = await counterRepository.getAllTasbih();
    totalItem.value = counterList.length;
    for (final counter in counterList) {
      percentage.add(counter.counter / counter.goal);
    }
    print(percentage);
    print(counterList);
    print(totalItem);
  }

  void deleteList({required int id}) async {
    int listId = counterList[id].id!;
    counterList.removeAt(id);
    totalItem.value = counterList.length;
    counterList.refresh();
    print(counterList);
    counterRepository.deleteTasbih(listId);
  }
}
