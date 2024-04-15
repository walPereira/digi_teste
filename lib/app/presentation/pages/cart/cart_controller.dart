import 'package:get/get.dart';
import '../../../domain/entity/cart_item/cart_item_entity.dart';

class CartController extends GetxController {
  
  RxList<CartItem> items = RxList.empty();
  RxInt count = RxInt(0);


  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments.containsKey('items')) {
      items = Get.arguments['items'];
    }
    super.onInit();
  }

  double get totalPrice {
    return items.fold(0, (total, current) => total + (double.parse(current.product.price) * current.quantity));
  }

   void removeItem(int index){
    items.removeAt(index);
  }

  void clearCart() {
   items.clear();
  }

  


}
