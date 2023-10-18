import 'package:flutter/material.dart';
import 'package:news_application/constants/constants.dart';
import 'package:news_application/screens/show_news/open_news.dart';
import 'package:news_application/ui_helper.dart';

//global variables

String? name;
String? author;
String? title;
String? desc;
String? content;
String? imgUrl;
String? newsUrl;
String? publishedAt;

class ShowNews extends StatefulWidget {
  @override
  State<ShowNews> createState() => _ShowNewsState();
//Constructor variable

  String? c_name;
  String? c_author;
  String? c_title;
  String? c_desc;
  String? c_content;
  String? c_imgUrl;
  String? c_newsUrl;
  String? c_publishedAt;

  ShowNews(
    this.c_name,
    this.c_author,
    this.c_title,
    this.c_desc,
    this.c_content,
    this.c_imgUrl,
    this.c_publishedAt,
    this.c_newsUrl,
  ){
    name = c_name;
    author = c_author;
    title = c_title;
    desc = c_desc;
    content = c_content;
    imgUrl= c_imgUrl;
    newsUrl = c_newsUrl;
    publishedAt= c_publishedAt;

  }
}

class _ShowNewsState extends State<ShowNews> {
  @override
  Widget build(BuildContext context) {
    var data = Constants.results;
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: media.size.height * .06,
                        width: media.size.width * .13,
                        decoration: BoxDecoration(
                          color: colorGrey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Container(
                            height: media.size.height * .05,
                            width: media.size.width * .11,
                            decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: colorBlack,
                            )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: media.size.height * .06,
                        width: media.size.width * .25,
                        decoration: BoxDecoration(
                          color: colorGrey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: media.size.height * .05,
                              width: media.size.width * .11,
                              decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.upload_outlined,
                                color: colorBlack,
                              )),
                            ),
                            wSpacer(mWidth: media.size.width * .01),
                            Stack(children: [
                              Container(
                                height: media.size.height * .05,
                                width: media.size.width * .11,
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.switch_camera_outlined,
                                  color: colorBlack,
                                )),
                              ),
                              Positioned(
                                  left: 25,
                                  top: 13,
                                  child: Container(
                                    height: media.size.height * .01,
                                    width: media.size.width * .02,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  )),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                    ),
                    wSpacer(),
                    Text(
                      name == null ? "Unknown Publisher" : "${name}",
                      style: TextStyle(fontSize: 18),
                    ),
                    wSpacer(),
                    CircleAvatar(
                      radius: 1,
                      backgroundColor: colorBlack,
                    ),
                    wSpacer(),
                    Text(
                      author==null ? "Unknown Author" : "${author}",
                      style: TextStyle(fontSize: 15, color: colorBlack),
                    ),
                    // wSpacer(),
                    // CircleAvatar(
                    //   radius: 1,
                    //   backgroundColor: colorBlack,
                    // ),
                    // wSpacer(),
                    // Text(
                    //   "name",
                    //   style: TextStyle(fontSize: 18, color: colorBlack),
                    // ),
                  ],
                ),
              ),
              hSpacer(),
              Padding(
                padding:  EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Text(
                  title==null ? "Unknown title" : "${title}",
                  style: TextStyle(
                      color: colorBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
              hSpacer(),
              Column(
                children: [
                  Hero(
                    tag: "news",
                    child: Container(
                      height: media.size.height*.25,
                      width: media.size.width * .96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorGrey,
                          image: DecorationImage(
                            image: NetworkImage(imgUrl==null ? "https://blog.vantagecircle.com/content/images/2022/06/What-Is-Office-Politics.png":"${imgUrl}"),
                            fit: BoxFit.cover,
                          )),

                    ),
                  ),
                  Text(
                    "Demage of tornadoes",
                    style: TextStyle(fontSize: 15, color: colorGrey),
                  ),
                ],
              ),
              hSpacer() ,
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Text(
                    content ==null ? "" :" ${content}",maxLines: 443,
                  style: TextStyle(
                      color: colorBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
              ),
              hSpacer(mHeight: 20.0),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Read more at",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    InkWell(
                      onTap: () {
                        String fetchedUrl = newsUrl.toString();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => OpenNews(cUrl: fetchedUrl)));
                      },
                      child: Text(
                        newsUrl.toString(),
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    hSpacer(),
                    Text("Published at: ${publishedAt.toString()}",style: TextStyle(fontSize: 14,color: Colors.grey.shade600),),



                  ],
                ),
              ),





            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: media.size.height * .06,
        width: media.size.width * .6,
        child: FloatingActionButton(
          backgroundColor: colorWhite,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: colorWhite)),
          elevation: 12,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: media.size.height * .05,
                  width: media.size.width * .11,
                  decoration: BoxDecoration(
                    color: colorGrey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Center(
                        child: Icon(
                      Icons.heart_broken_outlined,
                      color: colorBlack,
                    )),
                  ),
                ),
                Text(
                  "6.7k",
                  style: TextStyle(color: colorBlack),
                ),
                Container(
                  height: media.size.height * .05,
                  width: media.size.width * .11,
                  decoration: BoxDecoration(
                    color: colorGrey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Center(
                        child: Icon(
                      Icons.event_note_outlined,
                      color: colorBlack,
                    )),
                  ),
                ),
                Text(
                  "12k",
                  style: TextStyle(color: colorBlack),
                ),
                Container(
                  height: media.size.height * .05,
                  width: media.size.width * .11,
                  decoration: BoxDecoration(
                    color: colorButton,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Center(
                        child: Icon(
                      Icons.headset_outlined,
                      color: colorWhite,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
