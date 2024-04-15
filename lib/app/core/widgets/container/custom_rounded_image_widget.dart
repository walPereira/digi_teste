import 'package:flutter/material.dart';

class CustomRoundedImageWidget extends StatelessWidget {
  final ImageProvider imageProvider;
  const  CustomRoundedImageWidget({
    super.key,
    required this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image:imageProvider,
          onError: (exception, stackTrace){
             const Placeholder(
              fallbackHeight: 60,
              fallbackWidth: 60,
            );
          }
        ),
      ),
    );
  }
}
