
import 'package:digi/app/domain/entity/product/product_entity.dart';

class CartItem {
  final ProductEntity product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
