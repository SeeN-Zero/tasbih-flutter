import 'package:counter/controllers/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(208, 201, 192, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(239, 234, 216, 1),
        title: const Text('New Tasbih '),
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
      body: Center(
        child: Form(
            key: Get.find<AddController>().formKey,
            child: SizedBox(
              height: 300,
              child: Card(
                margin: const EdgeInsets.only(right: 20, left: 20),
                elevation: 700,
                color: const Color.fromRGBO(239, 234, 216, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          controller: controller.textNameController,
                          decoration: const InputDecoration(
                              labelText: 'Tasbih',
                              labelStyle: TextStyle(fontSize: 25),
                              border: OutlineInputBorder()),
                          textCapitalization: TextCapitalization.characters,
                          maxLength: 12,
                          validator: (value) =>
                              controller.addValidatorText(value!),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 25, right: 25),
                          child: TextFormField(
                            controller: controller.textGoalController,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) =>
                                controller.addValidatorNumber(value!),
                            decoration: const InputDecoration(
                                labelText: 'Target',
                                labelStyle: TextStyle(fontSize: 25),
                                border: OutlineInputBorder()),
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromRGBO(3, 201, 136, 1)),
                          onPressed: controller.addCounter,
                          child: SizedBox(
                            width: 130,
                            child: Row(
                              children: const [
                                Expanded(child: Icon(Icons.add)),
                                Expanded(child: Text('Tambah'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
