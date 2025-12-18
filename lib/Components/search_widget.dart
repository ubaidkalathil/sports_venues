import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_venues/Core/colors.dart';

class CustomSearchWidget extends StatefulWidget {
  Function(String value)? onChage;
  bool autofocus;
  bool enable;

  CustomSearchWidget({
    super.key,
    this.onChage,
    this.enable = true,
    this.autofocus = false,
  });

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: CupertinoSearchTextField(
        backgroundColor: Colors.transparent,
        autofocus: widget.autofocus,
        enabled: widget.enable,
        onChanged: (value) => widget.onChage!(value),
      ),
    );
  }
}
