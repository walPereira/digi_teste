import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_controller.dart';

import '../../../core/core_export.dart';
import '../../../domain/product/product_entity.dart';
import '../../utils/widgets/product/product_card_widget.dart';

class ProductPage extends BasePage<ProductController> {
  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Meus Produtos",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          Obx(() {
            return BadgeIconWidget(
              count: controller.productItens.length.toString(),
              showBadge: controller.itens.isNotEmpty ? true : false,
              onTap: ()=> controller.navigate()
              );
          })
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        bottom: true,
        top: true,
        child: Obx(
          () => ObservableState<List<ProductEntity>>(
            state: controller.carsStore.state.value,
            stateLoading: () {
              return const Center(child: CircularProgressIndicator());
            },
            stateError: (error) {
              return const SizedBox.shrink();
            },
            stateSuccess: (data) {
              return ListView.separated(
                itemCount: data!.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10,),
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: data[index].name,
                    detail: data[index].detail,
                    image: data[index].image,
                    hero: data[index].hero ?? "",
                    info: data[index].info ?? "",
                    offer: data[index].offer ?? "",
                    price: data[index].price,
                    onTap: () {
                      controller.addItem(data[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Adicionado o produto ${data[index].name} ao carrinho !')),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
