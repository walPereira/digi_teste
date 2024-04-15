import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core_export.dart';

class EngagementWrapper extends StatefulWidget {
  final Widget child;

  const EngagementWrapper({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _EngagementWrapper();
}

class _EngagementWrapper extends State<EngagementWrapper> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    Get.lazyPut<IHttp>(
      () => DioImpl.instance.config(Dio()),
      fenix: true,
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
