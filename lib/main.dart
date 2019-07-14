import 'package:flutter/material.dart';
import 'package:game_myself/home.dart';
void main(){
  runApp(MaterialApp(
    title: "game",
    theme: ThemeData(
brightness: Brightness.dark,

    ),
    color: Colors.lime,
    home: new Home(),
  ));
}