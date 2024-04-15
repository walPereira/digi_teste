import 'package:digi/app/presentation/utils/widgets/product/expanded_content/expanded_content_items_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core_export.dart';

class ExpandedContentWidget extends StatelessWidget {
  final String price;
  final String hero;
  final String info;
  final String offer;
  final VoidCallback onTap;

  ExpandedContentWidget({
    required this.price,
    required this.hero,
    required this.offer,
    required this.info,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ExpandedContentItemsWidget(
              label: "price", infoNamed: price,iconData: Icons.monetization_on_outlined),
            ExpandedContentItemsWidget(label: "hero",infoNamed:hero,iconData: Icons.info_outline),
            ExpandedContentItemsWidget(label: "offer",infoNamed: offer,iconData: Icons.money),
            ExpandedContentItemsWidget(label: "info",infoNamed: info,iconData: Icons.info),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CustomButton(text: "Adicionar ao Carrinho", onPressed: onTap))
          ],
        ),
      ),
    );
  }
}