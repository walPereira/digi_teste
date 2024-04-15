import 'package:flutter/material.dart';

class ExpandedContentItemsWidget extends StatelessWidget {
  final String label;
  final String infoNamed;
  final IconData iconData;
  const ExpandedContentItemsWidget({
    super.key,
    required this.label,
    required this.infoNamed,
    required this.iconData
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData,size: 15),
        const SizedBox(width: 5),
        Text('$label: $infoNamed'),
      ],
    );
  }
}