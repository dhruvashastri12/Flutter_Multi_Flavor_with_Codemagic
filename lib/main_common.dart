import 'Environment.dart';
import 'app_widget.dart';
// import 'package:environments_with_codemagic_tutorial/app_widget.dart';
// import 'package:environments_with_codemagic_tutorial/config_reader.dart';
// import 'package:environments_with_codemagic_tutorial/environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ConfigReader.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory 
  await ConfigReader.initialize();

  Color primaryColor;
  switch (env) {
    case Environment.dev:
      primaryColor = Colors.blue;
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      break;
  }

  runApp(
    Provider.value(
      value: primaryColor,
      child: MyApp(),
    ),
  );
}