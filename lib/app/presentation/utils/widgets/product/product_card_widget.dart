import 'package:digi/app/presentation/utils/widgets/product/expanded_content/expanded_content_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/core_export.dart';


class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final String detail;
  final String price;
  final String hero;
  final String info;
  final String offer;
  final VoidCallback onTap;

  ProductCard(
      {required this.image,
      required this.name,
      required this.detail,
      required this.price,
      required this.hero,
      required this.info,
      required this.offer,
      required this.onTap
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      child: Column(
        children: [
          ListTile(
            leading: CustomRoundedImageWidget(imageProvider: NetworkImage(widget.image)),
            title: Text(widget.name),
            subtitle: Text(widget.detail),
            trailing: IconButton(
                icon: Icon(expanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                }),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: expanded ? 160.0 : 0.0,
            child: expanded
                ? ExpandedContentWidget(
                    price: widget.price,
                    offer: widget.offer,
                    hero: widget.hero,
                    info: widget.info,
                    onTap: widget.onTap,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}


