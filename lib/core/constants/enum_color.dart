import 'package:flutter/material.dart';

enum EnumColors {
  skyBlue(Color(0xFF14b6eb), 'Celeste'),
  plumb(Color(0xFF364954), 'Plomo'),
  silver(Color(0xFF99aebb), 'Silver'),
  pink(Color(0xFFdb91cd), 'Rosa'),
  darkPink(Color(0xFFa35d96), 'Palo_Rosa');

  final Color color;
  final String name;

  const EnumColors(this.color, this.name);
}
