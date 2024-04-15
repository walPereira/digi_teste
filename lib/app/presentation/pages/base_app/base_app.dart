import 'package:digi/app/presentation/pages/base_app/initial_binding.dart';
import 'package:digi/app/presentation/utils/widgets/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core_export.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EngagementWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        getPages: [
          ...AppPages.pages,
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        initialRoute: AppRouter.initialPage,
        initialBinding: InitialBinding(),
        defaultTransition: Transition.rightToLeft,
      ),
    );
  }
}

