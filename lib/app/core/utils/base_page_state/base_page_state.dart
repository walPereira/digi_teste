import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BasePage<T extends GetxController> extends StatelessWidget {
  final T _controller = Get.find<T>();

  T get controller => _controller;

  BasePage({
    super.key,
  }){
    initBasePage();
  }
  initBasePage(){}
}