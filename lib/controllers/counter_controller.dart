import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController{
  final RxInt _counter = 0.obs;

  int get counter => _counter.value;

  void changeCounter(bool isIncrement){
    isIncrement ?  _counter.value++ : _counter.value--;
    Get.snackbar(isIncrement ? "Increment" :"Decrement", "Counter  changing completed",backgroundColor: isIncrement ?  Colors.blue  : Colors.red);
    Get.showSnackbar(const GetSnackBar(title: "ThisSnackbar",message: "This is a snackbar",isDismissible: true,dismissDirection: DismissDirection.horizontal,));
  }
}