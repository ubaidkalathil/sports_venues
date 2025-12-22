import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sports_venues/Core/constants.dart';
import 'package:sports_venues/Core/custom_networ_image.dart';
import 'package:sports_venues/Domain/Server/api_end_points.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;

  const ImageCarousel({super.key, required this.images});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  ValueNotifier carousalDot = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.images.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomNetworImage(
                imgUrl: "${ApiEndpoints.kBaseUrl}/$url",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              carousalDot.value = index;
            },
            viewportFraction: 0.9,
            autoPlayInterval: const Duration(seconds: 3),
          ),
        ),
        kHight(12),
        // DOT INDICATOR
        ValueListenableBuilder(
          valueListenable: carousalDot,
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (index) {
              final isActive = value == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isActive ? 10 : 6,
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isActive ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
