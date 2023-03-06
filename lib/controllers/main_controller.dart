import 'package:counter/models/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/counter_repository.dart';

class MainController extends GetxController {
  final counter = Counter(id: 0, name: '', goal: 0, counter: 0).obs;
  final percentage = 0.0.obs;
  CounterRepository counterRepository = Get.put(CounterRepository());

  bool buttonState() {
    if (percentage.value == 1) {
      return true;
    }
    return false;
  }

  void incrementCounter() async {
    counter.update((counter) {
      counter?.counter++;
    });
    if (counter.value.id != 0) {
      await counterRepository.updateTasbih(
          counter: counter.value.counter, id: counter.value.id!);
      percentage.value = counter.value.counter / counter.value.goal;
      if (percentage.value == 1) {
        Get.defaultDialog(
            title: 'Goal!',
            middleText: 'Sudah Mencapai Target.',
            cancelTextColor: Colors.black45,
            textCancel: 'Ok');
      }
    }
  }

  void resetCounter() async {
    counter.update((counter) {
      counter?.counter = 0;
    });
    if (counter.value.id != 0) {
      await counterRepository.updateTasbih(counter: 0, id: counter.value.id!);
      percentage.value = counter.value.counter / counter.value.goal;
    }
  }

  void onPageCall() async {
    int? idl = Get.arguments;
    idl ??= 1;
    Counter? counterDb = (await counterRepository.getTasbih(id: idl));
    if (counterDb != null) {
      counter.value = counterDb;
      percentage.value = counter.value.counter / counter.value.goal;
    } else {
      counter.value = Counter(id: 0, name: '', goal: 0, counter: 0);
      percentage.value = 0;
    }
  }
}
