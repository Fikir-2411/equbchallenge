import 'package:equbchallenge/challenge/pages/screens/main_screen.dart';
import 'package:equbchallenge/challenge/provider/collected_money_provider.dart';
import 'package:equbchallenge/challenge/provider/due_payments_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => DuePaymentsPageProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => CollectedMoneysProvider(),
            )
          ],
          // child: const Charts()),
          child: const MainScreen()),
    );
  }
}
