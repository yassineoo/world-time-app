import 'package:flutter/material.dart';
import 'package:secApp/pages/choose_location.dart';
import 'package:secApp/pages/home.dart';
import 'package:secApp/pages/loading.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLoction(),
  }));
}
