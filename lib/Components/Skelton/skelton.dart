import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

class Skelton extends StatelessWidget {
  Skelton({
    super.key,
    this.width,
    this.height,
    this.circleSkelton = false,
    this.borderRadius = 12,
  });

  final double? width, height, borderRadius;
  bool circleSkelton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: circleSkelton
          ? BoxDecoration(
              color: const Color.fromARGB(255, 96, 92, 92).withOpacity(.1),
              shape: BoxShape.circle,
            )
          : BoxDecoration(
              color: const Color.fromARGB(255, 141, 141, 141).withOpacity(.1),
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
    );
  }
}
