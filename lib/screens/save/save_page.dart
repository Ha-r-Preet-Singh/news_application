

import 'package:flutter/material.dart';
import 'package:news_application/screens/save/chennal.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              children: <Widget>[
                InkWell(
                    onTap: (){
                      openChannel(url: "https://www.aajtak.in/");
                    },
                    child: channelCard(imgRes: 'assets/images/aajtak.png', channelName: 'Aaj Tak')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://www.indiatvnews.com/");
                    },
                    child: channelCard(imgRes: 'assets/images/indiatv.png', channelName: 'India TV')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://news.abplive.com/");
                    },
                    child: channelCard(imgRes: 'assets/images/abpnews.png', channelName: 'ABP News')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://www.news18.com/");
                    },
                    child: channelCard(imgRes: 'assets/images/newsindia18.png', channelName: 'News 18 India')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://bharat.republicworld.com/");
                    },
                    child: channelCard(imgRes: 'assets/images/rbharat.png', channelName: 'Republic Bharat')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://www.ndtv.com/topic/official-website");
                    },
                    child: channelCard(imgRes: 'assets/images/ndtvindia.png', channelName: 'NDTV India')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://www.timesnownews.com/");
                    },
                    child: channelCard(imgRes: 'assets/images/timesnow.png', channelName: 'Times Now')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://news24online.com/");
                    },
                    child: channelCard(imgRes: 'assets/images/news24.png', channelName: 'News 24')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://www.newsnationtv.com/");
                    },
                    child: channelCard(imgRes: 'assets/images/newsnation.png', channelName: 'News Nation')),
                InkWell(
                    onTap: (){
                      openChannel(url: "https://ddnews.gov.in/");
                    },
                    child: channelCard(imgRes: 'assets/images/ddnews.png', channelName: 'DD News')),
              ],
            ),
          ),
        ],
      ),
    );
  }




  Widget headerBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image.asset("assets/images/lettern.png"),
          radius: 17,
          backgroundColor: Colors.grey.shade300,
        ),

        Text("Indian News Express",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),

        Text("Get latest updates from India's famous news chennels",style: TextStyle(fontSize: 15),),


      ],
    );
  }

  Widget channelCard({required String imgRes, required String channelName}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(21),
              image: DecorationImage(
                  image: AssetImage(
                    imgRes,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0x89000000),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21)),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Center(
                child: Text(
                  channelName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }




  void openChannel({required String url}){
    Navigator.push(context, MaterialPageRoute(builder: (builder) => Channel(cUrl: url)));
  }
}
