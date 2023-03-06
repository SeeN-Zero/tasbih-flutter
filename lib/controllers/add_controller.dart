import 'package:counter/models/counter.dart';
import 'package:counter/repository/counter_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final textNameController = TextEditingController();
  final textGoalController = TextEditingController();
  CounterRepository counterRepository = Get.put(CounterRepository());

  void addCounter() async {
    if (formKey.currentState!.validate()) {
      await counterRepository.newTasbih(Counter(
          id: null,
          name: textNameController.text,
          goal: int.parse(textGoalController.text),
          counter: 0));
      final counterList = await counterRepository.getAllTasbih();
      Counter counterDb = counterList[counterList.length - 1];
      Get.offNamed('/main', arguments: counterDb.id);
    }
  }

  String? addValidatorText(String value) {
    if (value.isEmpty) {
      return 'Tidak boleh kosong';
    }
    return null;
  }

  String? addValidatorNumber(String value) {
    if (value.isEmpty || int.parse(value) == 0) {
      return 'Tidak boleh kosong';
    }
    return null;
  }
}
