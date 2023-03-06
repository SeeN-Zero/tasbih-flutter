import 'package:auto_size_text/auto_size_text.dart';
import 'package:counter/controllers/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewApp extends GetView<ListController> {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(208, 201, 192, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(239, 234, 216, 1),
        title: const Text('List Tasbih'),
        leading: TextButton(
          onPressed: () => Get.offNamed('/main', arguments: Get.arguments),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        elevation: 10,
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        toolbarHeight: 90,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.totalItem.value,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8),
              elevation: 10,
              color: const Color.fromRGBO(239, 234, 216, 1),
              child: InkWell(
                onTap: () => {
                  Get.offNamed('/main',
                      arguments: controller.counterList[index].id)
                },
                child: SizedBox(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, right: 5),
                                        child: AutoSizeText(
                                            controller.counterList[index].name,
                                            //'1234567890',
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 27,
                                                color: Colors.black54))),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 15, left: 5),
                                      child: AutoSizeText(
                                          '${controller.counterList[index].counter}/${controller.counterList[index].goal}',
                                          //'10000/10000',
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black54)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //Text(controller.counterList[index].name)),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                margin: const EdgeInsets.only(
                                    left: 10, right: 4, bottom: 4, top: 4),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: LinearProgressIndicator(
                                    backgroundColor:
                                        const Color.fromRGBO(208, 201, 192, 1),
                                    valueColor: const AlwaysStoppedAnimation(
                                        Color.fromRGBO(95, 113, 97, 1)),
                                    value: controller.percentage[index],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                          width: 10,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                shape: const CircleBorder(
                                    side: BorderSide(
                                        color: Colors.red, width: 3)),
                                backgroundColor:
                                    const Color.fromRGBO(255, 100, 100, 1)),
                            onPressed: () => Get.defaultDialog(
                                onConfirm: () {
                                  controller.deleteList(id: index);
                                  Get.back();
                                },
                                buttonColor: Colors.black,
                                cancelTextColor: Colors.black45,
                                confirmTextColor:
                                    const Color.fromRGBO(255, 100, 100, 1),
                                title: 'Konfirmasi',
                                textConfirm: 'Ya',
                                textCancel: 'Tidak',
                                middleText: 'Item akan terhapus selamanya'),
                            child: const Icon(Icons.delete),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          padding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
