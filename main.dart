import 'package:flutter/material.dart';
import 'package:my_app/BMI.dart';
import 'package:my_app/alert.dart';
import 'package:my_app/calci.dart';
import 'package:my_app/d19UI.dart';
import 'package:my_app/dropdownlist.dart';
import 'package:my_app/geolocator.dart';
import 'package:my_app/imgpicker.dart';
import 'package:my_app/stack.dart';
import 'package:my_app/tabbar.dart';

import 'bottom_navigation.dart';
import 'forms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BMI(),
    );
  }
}
