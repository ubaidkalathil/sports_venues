import 'package:flutter/material.dart';
import 'package:sports_venues/Components/text_widget.dart';
import 'package:sports_venues/Core/colors.dart';
import 'package:sports_venues/Core/constants.dart';
import 'package:sports_venues/Core/custom_icons.dart';

class NetworkErrorWidget extends StatefulWidget {
  NetworkErrorWidget({super.key, this.padding, required this.onPressed});
  void Function()? onPressed;
  EdgeInsetsGeometry? padding;

  @override
  State<NetworkErrorWidget> createState() => _NetworkErrorWidgetState();
}

class _NetworkErrorWidgetState extends State<NetworkErrorWidget> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  void didChangeDependencies() {
    screenHeight = height(context);
    screenWidth = width(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    widget.padding ??= EdgeInsets.only(top: height(context) * .3);
    return Padding(
      padding: widget.padding!,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(CustomIcons.noInternet, width: screenWidth * .4),
            kHight(6),
            TextWidget(
              "Check your internet connection !!",
              textAlign: TextAlign.center,
              color: grey,
              fontWeight: FontWeight.w500,
            ),
            kHight(6),
            ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth * .3, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: TextWidget("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
