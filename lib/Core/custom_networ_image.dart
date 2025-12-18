import 'package:flutter/material.dart';
import 'package:sports_venues/Components/Skelton/skelton.dart';

class CustomNetworImage extends StatefulWidget {
  final String imgUrl;
  final double? width, height;
  final BoxFit fit;

  const CustomNetworImage({
    super.key,
    required this.imgUrl,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
  });

  @override
  State<CustomNetworImage> createState() => _CustomNetworImageState();
}

class _CustomNetworImageState extends State<CustomNetworImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imgUrl,
      loadingBuilder:
          (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              // If loading is finished, return the image (child)
              return child;
            }
            return Center(child: Skelton());
          },
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(
          Icons.error,
        ); // Show error icon if image fails to load
      },
    );
  }
}
