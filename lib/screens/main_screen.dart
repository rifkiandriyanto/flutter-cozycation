import 'package:flutter/material.dart';
import 'package:cozycation/helpers/theme.dart';
import 'package:cozycation/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/splash-image.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/logo.png', width: 50),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Find Cozy House\nto Stay Happy',
                      style: medium.copyWith(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Looking for an apartment?\nLet's find your dream apartment",
                      style: light.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 210,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Text('Explore Now'),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 11),
                            primary: purple,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            textStyle: medium.copyWith(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
