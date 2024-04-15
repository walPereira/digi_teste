import 'package:digi/app/presentation/pages/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/core_export.dart';
import '../../../domain/entity/cart_item/cart_item_entity.dart';

class CartPage extends BasePage<CartController> {
  final List<CartItem>? items;

  CartPage({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const Text("Minhas Compras", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        minimum: const EdgeInsets.all(10),
        child: Obx(
          () {
            return controller.items.isNotEmpty ?  
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CustomRoundedImageWidget(imageProvider: NetworkImage( controller.items[index].product.image)),
                        title: Text(controller.items[index].product.name),
                        subtitle: Text('quantidade: ${controller.items[index].quantity}'),
                        trailing: IconButton(
                          icon:const Icon(Icons.delete),
                          onPressed: ()=> controller.removeItem(index),
                          ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'SubTotal: ${controller.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                CustomButton(
                    text: "Limpar Carrinho",
                    onPressed: ()=> controller.clearCart())
              ],
            ) : const Center(child: Text("Você ainda não possui itens em seu carrinho !"));
          },
        ),
      ),
    );
  }
}
