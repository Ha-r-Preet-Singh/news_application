

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_application/screens/bottom%20bar/bottom_bar.dart';
import 'package:news_application/screens/home/home_page.dart';
import 'package:news_application/ui_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: media.size.height,
        width: media.size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.pexels.com/photos/3585069/pexels-photo-3585069.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),fit: BoxFit.cover
          )
        ) ,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Text("Stay Informed",style: TextStyle(color: colorWhite,fontSize: 40,fontWeight: FontWeight.bold),),
              Text("from Day One",style: TextStyle(color: colorWhite,fontSize: 40,fontWeight: FontWeight.bold),),
              Text("Discover the Latest News with our",style: TextStyle(color: colorWhite,fontSize: 17),),
              Text("Seamless Onboarding Experience",style: TextStyle(color: colorWhite,fontSize: 17),),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: media.size.height*.06,
        width: media.size.width*.93,
        child: FloatingActionButton(

          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),side: BorderSide(color: colorButton)),


          elevation: 12,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar()));
          },
          child:   Text("Getting Started",style: TextStyle(color: colorWhite,fontSize: 17),),


        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
