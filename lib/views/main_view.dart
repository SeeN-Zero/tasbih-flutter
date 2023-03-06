import 'package:auto_size_text/auto_size_text.dart';
import 'package:counter/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalObjectKey<ExpandableFabState>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 234, 216, 1),
      body: Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                heightFactor: 0.3,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Obx(() => AutoSizeText(
                            controller.counter.value.name,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headlineLarge,
                          )),
                    )),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        padding:
                            const EdgeInsets.only(top: 20, right: 10, left: 10),
                        child: Obx(
                          () => LinearProgressIndicator(
                            backgroundColor:
                                const Color.fromRGBO(208, 201, 192, 1),
                            valueColor: const AlwaysStoppedAnimation(
                                Color.fromRGBO(95, 113, 97, 1)),
                            value: controller.percentage.value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  FractionallySizedBox(
                    heightFactor: 0.50,
                    child: SvgPicture.asset(
                      'assets/Counter.svg',
                      semanticsLabel: 'Counter',
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: 0.50,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 30, bottom: 5),
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              heightFactor: 0.40,
                              widthFactor: 0.40,
                              child: Container(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(
                                        width: 2, color: Colors.black45),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Obx(
                                  () => Text(
                                    '${controller.counter.value.counter}', //1000000
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              widthFactor: 0.40,
                              heightFactor: 0.60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            color:
                                                Color.fromRGBO(95, 113, 97, 1),
                                            width: 3)),
                                    backgroundColor:
                                        const Color.fromRGBO(255, 100, 100, 1)),
                                onPressed: () {
                                  if (controller.buttonState()) {
                                    null;
                                  } else {
                                    controller.incrementCounter();
                                  }
                                },
                                child: null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: 0.50,
                    child: Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 30,
                        child: FractionallySizedBox(
                          widthFactor: 0.40,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  shape: const CircleBorder(
                                      side: BorderSide(
                                          color: Color.fromRGBO(95, 113, 97, 1),
                                          width: 3)),
                                  backgroundColor:
                                      const Color.fromRGBO(255, 100, 100, 1)),
                              onPressed: () => Get.defaultDialog(
                                  onConfirm: () {
                                    controller.resetCounter();
                                    Get.back();
                                  },
                                  buttonColor: Colors.black,
                                  cancelTextColor: Colors.black45,
                                  confirmTextColor:
                                      const Color.fromRGBO(255, 100, 100, 1),
                                  title: 'Konfirmasi',
                                  textConfirm: 'Ya',
                                  textCancel: 'Tidak',
                                  middleText:
                                      'Penghitung akan tereset kembali menjadi 0'),
                              child: null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: key,
        child: const Icon(Icons.expand_less_rounded),
        backgroundColor: const Color.fromRGBO(28, 130, 173, 1),
        distance: 70,
        type: ExpandableFabType.up,
        overlayStyle: ExpandableFabOverlayStyle(blur: 10),
        closeButtonStyle: const ExpandableFabCloseButtonStyle(
            backgroundColor: Color.fromRGBO(255, 100, 100, 1)),
        children: [
          FloatingActionButton.extended(
            elevation: 10,
            label: const Text('Add'),
            icon: const Icon(Icons.add),
            onPressed: () =>
                Get.toNamed('/add', arguments: controller.counter.value.id),
            backgroundColor: const Color.fromRGBO(3, 201, 136, 1),
            heroTag: null,
          ),
          FloatingActionButton.extended(
            elevation: 10,
            label: const Text('List'),
            icon: const Icon(Icons.list),
            onPressed: () =>
                Get.toNamed('/list', arguments: controller.counter.value.id),
            backgroundColor: const Color.fromRGBO(95, 113, 97, 1),
            heroTag: null,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
