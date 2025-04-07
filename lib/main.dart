import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/firebase_options.dart';
import 'package:project_laundry_flutter/src/app.dart';
import 'package:project_laundry_flutter/src/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initDependencies();
  runApp(const MyApp());
}
