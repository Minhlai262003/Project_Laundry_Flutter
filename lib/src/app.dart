import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_screen.dart';
// import 'package:project_laundry_flutter/src/presentation/modules/main/main_screen.dart';
// import 'package:project_laundry_flutter/src/test_camera.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MainScreen(),
      // theme: ThemeData.light(),
      // theme: ThemeData.dark(),
// theme: ThemeData(
//         scaffoldBackgroundColor: Colors.pink, // Set the background color
//       ),
      // darkTheme: ThemeData.dark(),
    );
  }
}
