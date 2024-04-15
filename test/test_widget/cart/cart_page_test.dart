import 'package:digi/app/core/widgets/container/custom_rounded_image_widget.dart';
import 'package:digi/app/domain/entity/cart_item/cart_item_entity.dart';
import 'package:digi/app/domain/entity/product/product_entity.dart';
import 'package:digi/app/presentation/pages/cart/cart_controller.dart';
import 'package:digi/app/presentation/pages/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {

setUp(() {
    Get.lazyPut(()=>CartController());
});
 tearDownAll(() {
    Get.delete<CartController>();
  });
 testWidgets('CartPage should render without errors', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      home: CartPage(items: null),
    ));

    expect(find.text("Você ainda não possui itens em seu carrinho !"), findsOneWidget);
  });
  
  testWidgets('HomePage should render items when items list is not empty', (WidgetTester tester) async {

  final List<CartItem> mockItems = [
    CartItem(product: ProductEntity(name: 'Product 1', image: 'image1.jpg',detail: "Lorem ipsum dolor sit amet",price: "99"), quantity: 2),
    CartItem(product: ProductEntity(name: 'Product 2', image: 'image2.jpg',detail: "Lorem ipsum dolor sit amet",price: "99"), quantity: 1),
  ];

  
  await tester.pumpWidget(GetMaterialApp(
    home: CartPage(items: mockItems),
  ));

  expect(find.text("Minhas Compras"), findsOneWidget);
  expect(find.byType(ListTile), findsNWidgets(2)); 
  expect(find.byType(CustomRoundedImageWidget), findsNWidgets(2)); 
  expect(find.text('Product 1'), findsOneWidget);
  expect(find.text('Product 2'), findsOneWidget); 
  expect(find.text('quantidade: 2'), findsOneWidget);
  expect(find.text('quantidade: 1'), findsOneWidget); 
  expect(find.byIcon(Icons.delete), findsNWidgets(2)); 

});

}

