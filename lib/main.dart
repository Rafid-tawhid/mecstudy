
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mecstudygroup/SplashScreen.dart';
import 'dart:core';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await Firebase.initializeApp();
  //   print("Firebase initialized successfully!");
  // } catch (e) {
  //   print("Failed to initialize Firebase: $e");
  // }
  runApp(MySplashScreen());
}

class Headers {
  static var token;
  static var defaultheader = {
    'Content-Type': 'application/json',
    'device-type': 'web',
    'device-id': '1',
    'user-agents': 'postman',
    'user-host-address': '::::0',
    'user-language': 'english',
    'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
    'user-host-name': 'malik',
  };
}
