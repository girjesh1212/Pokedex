import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _loadSplash() async{
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }

    @override
  void initState() {
    super.initState();
    _loadSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/pokeball.png', scale: 4.0,),
      ),
    );
  }
}
