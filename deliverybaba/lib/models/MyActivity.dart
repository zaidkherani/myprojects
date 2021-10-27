import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:flutter/material.dart';

class ActivityInfo {
  final String? svgSrc, title;
  final int? numOfFiles, percentage;
  final Color? color;

  ActivityInfo({
    this.svgSrc,
    this.title,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyActivity = [
  ActivityInfo(
    title: "Total Drivers",
    numOfFiles: 28,
    svgSrc: "assets/icons/Documents.svg",
    color: primaryColor,
    percentage: 28,
  ),
  ActivityInfo(
    title: "Total Vehicles",
    numOfFiles: 13,
    svgSrc: "assets/icons/google_drive.svg",
    color: Color(0xFFFFA113),
    percentage: 13,
  ),
  ActivityInfo(
    title: "Completed\nOrders",
    numOfFiles: 50,
    svgSrc: "assets/icons/one_drive.svg",
    color: Color(0xFFA4CDFF),
    percentage: 50,
  ),
  ActivityInfo(
    title: "Track Orders",
    numOfFiles: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    color: Color(0xFF007EE5),
    percentage: 18,
  ),
];
