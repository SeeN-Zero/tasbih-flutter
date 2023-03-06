import 'package:counter/controllers/add_controller.dart';
import 'package:counter/controllers/list_controller.dart';
import 'package:counter/controllers/main_controller.dart';
import 'package:counter/routes/bindings.dart';
import 'package:counter/routes/list_middleware.dart';
import 'package:counter/routes/main_middleware.dart';
import 'package:counter/views/add_view.dart';
import 'package:counter/views/list_view.dart';
import 'package:counter/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<AddController>(() => AddController());
    Get.lazyPut<ListController>(() => ListController());

    return GetMaterialApp(
      initialRoute: "/main",
      getPages: [
        GetPage(
            name: '/main',
            page: () => const MainView(),
            binding: MainBinding(),
            middlewares: [MainMiddleware()]),
        GetPage(
            name: '/add', page: () => const AddView(), binding: AddBinding()),
        GetPage(
            name: '/list',
            page: () => const ListViewApp(),
            binding: ListBinding(),
            middlewares: [ListMiddleware()])
      ],
      // home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
