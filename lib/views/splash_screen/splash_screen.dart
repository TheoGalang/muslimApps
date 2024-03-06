import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app/models/daily_model.dart';
import 'package:muslim_app/services/daily_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DailyModel? dataJson;

  getDailyPrayer(){
    DailyServices().getDailyPrayer().then((response) => {
    // print('lalalala + ${response!}')
    if(response != null){
      setState(() {
        dataJson = response;
      })
    }
    else{
      print('error')
    }
    }
    );
    setState(() {});
  }

  @override
  void initState() {
    getDailyPrayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/8),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                dataJson!.data.timings.Maghrib,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xffb18392B)
              ),
              ),
                Container(
                  width: 195,
                  
                  child: Text(
                    "Memorize and recite Quran easily",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xffb8789A3),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.53,
                      child: Image.asset(
                      'assets/splash_screen/SS.png'
                                        ),
                    ),
                Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width/5,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xffbD0DED8),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color(0xffb18392B)
                      ),
                    ),
                  ),
                ),
                  ]
                )
            ],
          ),
        ),
      ),
    );
  }
}

