// ignore_for_file: use_build_context_synchronously, constant_identifier_names
import 'package:flutter/material.dart';

SizedBox kHight(double height) {
  return SizedBox(height: height);
}

SizedBox kWidth(double width) {
  return SizedBox(width: width);
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double titleText = 24;
double normalText = 15;
double midTitle = 18;
double borderRadius = 14;

const appBrSize = 70.0;
const version = "v1.0.2";
