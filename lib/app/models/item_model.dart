import 'package:flutter/material.dart';

class ItemData{

  Color? color;
  String? name;
  String? description;
  int? quantity;
  String? priceOld;
  String? price;
  String? location;
  bool? added;

  ItemData({
    this.color,
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.priceOld,
    this.location,
    this.added
  });
}