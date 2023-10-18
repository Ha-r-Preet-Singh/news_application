


import 'package:flutter/material.dart';
import 'package:news_application/screens/discover/discover_page.dart';
import 'package:news_application/screens/home/home_page.dart';
import 'package:news_application/screens/profile/profile_page.dart';
import 'package:news_application/screens/save/save_page.dart';
import 'package:news_application/ui_helper.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;



  static const List<Widget>  pages = [
    HomePage(),
    // DiscoverPage(),
    SavePage(),
    // ProfilePage(),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: colorWhite,
        selectedItemColor: colorButton,

        selectedIconTheme: IconThemeData(color: colorButton),



        items: [


          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: "Home"),
          // BottomNavigationBarItem(icon: Icon(Icons.landscape,),label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.save_as_outlined,),label: "News"),
          // BottomNavigationBarItem(icon: Icon(Icons.perm_identity,),label: "Profile"
          //     ),
        ],
        currentIndex: selectedIndex,
        onTap:onitemTapped ,

      ),

    );
  }


  void onitemTapped(int index){
    setState(() {
      selectedIndex = index;
    });

  }
}
