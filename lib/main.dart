import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bee_flutter/Pages/LoginScreen/LoginScreen.dart';

bool isMobile = false;
double? widthScreen;
double? heightScreen;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.sizeOf(context).width;
    heightScreen = MediaQuery.sizeOf(context).height;
    if(widthScreen! < 600){
      isMobile = true;
    }else{
      isMobile = false;
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme
          (),
      ),
      home: LoginScreen(),
    );
  }
}
