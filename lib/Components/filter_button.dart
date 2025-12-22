import 'package:flutter/material.dart';
import 'package:sports_venues/Components/text_widget.dart';
import 'package:sports_venues/Core/colors.dart';
import 'package:sports_venues/Core/constants.dart';

class FilterButton extends StatefulWidget {
  VoidCallback ontTap;
  bool active;
  FilterButton({super.key, required this.ontTap, required this.active});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: widget.ontTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(
              width: .5,
              color: widget.active
                  ? green
                  : const Color.fromARGB(255, 170, 170, 170),
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Icon(Icons.filter_list, color: widget.active ? green : black),
              kWidth(6),
              TextWidget("Filter", color: widget.active ? green : black),
            ],
          ),
        ),
      ),
    );
  }
}
