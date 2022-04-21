import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/pages/detailsPage/detail.dart';
import 'package:pokedex/pages/homePage/home.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(fontFamily: GoogleFonts.kumbhSans().fontFamily),
      initialRoute: Routes.homeRoute,
      routes:{
        Routes.homeRoute: (context) => const HomeScreen(),
      },
    );
  }
}


// class MyApp extends StatelessWidget {

//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pokedex',
//       theme: ThemeData(fontFamily: GoogleFonts.kumbhSans().fontFamily),
//       home: const Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(child: Text('New Text'),),
//       ),
//     );
//   }
// }
