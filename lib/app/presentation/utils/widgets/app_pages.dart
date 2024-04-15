import 'package:digi/app/core/core_export.dart';
import 'package:get/get.dart';

import '../../pages/cart/cart_bindings.dart';
import '../../pages/cart/cart_page.dart';
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
    GetPage(
      name: AppRouter.cartPage,
      page: (){
        final args = Get.arguments;
        return CartPage(
         items: args["items"],
        );
      },
      transition: Transition.fadeIn,
      binding: CartBindings(),
      preventDuplicates: true,
    ),
  ];
}
