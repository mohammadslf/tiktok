import 'package:flutter/material.dart';
import 'package:tik_tok_clone_dhuru/view/screens/add_video.dart';
import 'package:tik_tok_clone_dhuru/view/screens/display_screen.dart';

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageIndex = [
  DisplayVideo_screen(),
  Text("Search"),
  AddVideoScreen(),
  Text("Messages"),
  Text("Profile")
];
