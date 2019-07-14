import 'package:flutter/material.dart';
class GameButton{
  Color bg;
  final id;
  bool enabled;

  String text;
  GameButton({this.id, this.bg=Colors.green, this.text="", this.enabled=true});
}