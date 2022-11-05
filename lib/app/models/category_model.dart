
import 'package:flutter/material.dart';

class CategoryData{
  Color? color;
  String? title;
  CategoryData({
    this.color,
    this.title
  });
  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      color: json["color"],
      title: json["title"],
    );
  }
}