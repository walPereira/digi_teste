import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BadgeIconWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String count;
  final bool showBadge;
  const BadgeIconWidget({
    super.key,
    required this.onTap,
    required this.count,
    required this.showBadge
  });

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(count,style: const TextStyle(color: Colors.white)),
      badgeAnimation: const badges.BadgeAnimation.rotation(),
      position: badges.BadgePosition.topStart(),
      showBadge: showBadge,
      badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
