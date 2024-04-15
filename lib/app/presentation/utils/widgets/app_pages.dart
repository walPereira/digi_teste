import 'package:digi/app/core/core_export.dart';
import 'package:get/get.dart';

import '../../pages/product/product_bindings.dart';
import '../../pages/product/product_page.dart';

abstract class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRouter.initialPage,
      page: () => ProductPage(),
      transition: Transition.fadeIn,
      binding: ProductBindings(),
      preventDuplicates: true,
    ),
  ];
}
