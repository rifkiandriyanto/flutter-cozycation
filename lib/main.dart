import 'package:flutter/material.dart';
import 'package:cozycation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:cozycation/services/space_service.dart';

// void main() => runApp(MyApp());
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceService(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
