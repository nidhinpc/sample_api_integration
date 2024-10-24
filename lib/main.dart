import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api_integration/controller/fact_screen_controller.dart';
import 'package:sample_api_integration/controller/global_controller.dart';
import 'package:sample_api_integration/view/global_screen/global_screen.dart';
import 'package:sample_api_integration/view/home_screen/home_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FactScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GlobalController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GlobalScreen(),
      ),
    );
  }
}
