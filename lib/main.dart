import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson/controllers/counter_controller.dart';
import 'package:getx_lesson/translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    translations: Messages(), // your translations
    locale: Get.deviceLocale, // translations will be displayed in that locale
    fallbackLocale: const Locale('en', 'UK'), // specify the fallback locale in case an invalid locale is selected.
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text(
            'hello'.tr,
            style: const TextStyle(fontSize: 32),
          ),
          Text(
            'button_text'.tr,
            style: const TextStyle(fontSize: 32),
          ),
          GetX<CounterController>(builder: (controller) => Text(controller.counter.toString(),style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold),))
        ],
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: (){
            _counterController.changeCounter(true);
          },child: const Icon(Icons.add),),
          FloatingActionButton(
            heroTag: "2",
            onPressed: (){
            _counterController.changeCounter(false);
          },child: const Icon(Icons.remove),),
          FloatingActionButton(
            heroTag: "3",
            onPressed: (){
            Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },child: const Icon(Icons.change_history_outlined),),
          FloatingActionButton(
            heroTag: "4",
            onPressed: (){
            Get.off(const SecondPage());
          },child: const Icon(Icons.navigate_next_outlined),),
          FloatingActionButton(
            heroTag: "4",
            onPressed: (){
              Get.updateLocale(
                Get.locale == const Locale('tr','TR') ? const Locale('en','US'): const Locale('tr','TR')
              );
          },child: const Icon(Icons.language_outlined),),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetX<CounterController>(builder: (controller) => Text(controller.counter.toString())),
          ElevatedButton(onPressed: (){
            Get.back();
          }, child: const Text("back home page"))
        ],
      ),),
    );
  }
}
