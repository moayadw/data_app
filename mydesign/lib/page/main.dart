import 'dart:async';

import 'package:mydesign/page/post_data.dart';
import 'package:provider/provider.dart';
import 'package:mydesign/controller/provider_get.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderGet()),
      ],
      child:
    const MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()),
    ),
  );
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PostScreen()),
        );
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Image(
                image: AssetImage('images/pink.png'),
                fit: BoxFit.cover,
              ),
              right: 0,
              left: 0,
              top: 0,
            ),
            Positioned(
              bottom: 160,
              left: 24,
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 24,
              child: Text(
                'In our company the data is well secured and stored in packages.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Positioned(
              child: Row(
                children: [
                  Image.asset(
                    'images/data-analytics.png',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 30),
                  Image.asset('images/data-analyst.png', width: 60, height: 60),
                  SizedBox(width: 30),
                  Image.asset(
                    'images/data-analyst (1).png',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 30),
                  Image.asset(
                    'images/data-analyst (2).png',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 30),
                  Image.asset(
                    'images/data-analyst (3).png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              bottom: 50,
              left: 24,
            ),
          ],
        ),
      ),
    );
  }
}
