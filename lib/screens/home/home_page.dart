import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/bloc/news_bloc.dart';
import 'package:news_application/bloc2/recommended_bloc.dart';
import 'package:news_application/bloc2/recommended_event.dart';
import 'package:news_application/constants/constants.dart';
import 'package:news_application/customs/custom_container.dart';
import 'package:news_application/customs/custom_text.dart';
import 'package:news_application/screens/show_news/shownews.dart';
import 'package:news_application/ui_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cat='general';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(TopHeadlines());
    context.read<RecoBloc>().add(RecoHeadlines(Cat: cat));
  }

  @override
  Widget build(BuildContext context) {
    // var data = Constants.results;
    var category = Categories.results;
    // var List = Lists.results;

    var media = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(

        backgroundColor: colorWhite,
        body: SingleChildScrollView(
          child: Column(
            children: [
           Padding(
              padding:
              EdgeInsets.only(top: 10, left: 15, right: 15),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  CustomText(mText: "News",mSize: 25,mColor:colorBlack ,),
                    CustomText(mText: "Black",mSize: 25,mWeight: FontWeight.bold,mColor: colorButton,),
                  ],
                ),
            ),

              hSpacer(),
              Padding(
                padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const  Text(
                      "Breaking News",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: colorBlack),
                    ),
                    InkWell(
                      onTap: (){


                      },
                      child:const Text(
                        "Show More",
                        style: TextStyle(fontSize: 12, color: colorGrey),
                      ),
                    ),
                  ],
                ),
              ),
              hSpacer(),

              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewsErrorState) {
                    return Center(
                      child: Text(state.errorMsg!),
                    );
                  } else if (state is NewsLoadedState) {
                    return SizedBox (
                      height: media.size.height * .23,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.mData.articles!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              var name =
                                  state.mData.articles![index].source!.name;
                              var author = state.mData.articles![index].author;
                              var title = state.mData.articles![index].title;
                              var desc =
                                  state.mData.articles![index].description;
                              var content =
                                  state.mData.articles![index].content;
                              var imgUrl =
                                  state.mData.articles![index].urlToImage;
                              var newsUrl = state.mData.articles![index].url;
                              var publishedAt =
                                  state.mData.articles![index].publishedAt;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowNews(
                                      name,
                                      author,
                                      title,
                                      desc,
                                      content,
                                      imgUrl,
                                      newsUrl,
                                      publishedAt,
                                    ),
                                  ));
                            },
                            child:
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Hero(
                                tag: "news",
                                child: Stack(
                                  children: [
                                    Container(
                                      // height: media.size.height*.02,
                                      width: media.size.width * .9,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: colorGrey,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                state.mData
                                                .articles![index].urlToImage
                                                .toString()),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 150, left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                             const   CircleAvatar(
                                                  radius: 5,
                                                ),
                                                wSpacer(),
                                                Text(
                                                  state.mData.articles![index]
                                                      .source!.name!
                                                      .toString(),
                                                  style:const TextStyle(
                                                      color: colorWhite,
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            hSpacer(mHeight: 4.0),
                                            SizedBox(
                                              width: media.size.width * .9,
                                              child: Text(
                                                state.mData.articles![index]
                                                    .description
                                                    .toString(),
                                                maxLines: 2,
                                                style:const TextStyle(
                                                    color: colorWhite,
                                                    fontWeight:
                                                    FontWeight.w700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );


                  }
                  return Container();
                },
              ),
              hSpacer(mHeight: media.size.height * .02),
           BlocBuilder<RecoBloc,RecoState>(builder:(context, state) {
         return    SizedBox(
           height: media.size.height * .05,
           width: media.size.width,
           // height: 300,
           child: ListView.builder(
             shrinkWrap: true,
             itemCount: category.length,
             scrollDirection: Axis.horizontal,
             itemBuilder: (_, index) {
               return Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: InkWell(
                   onTap: (){
                     cat=category[index]['name'];
                     context.read<RecoBloc>().add(RecoHeadlines(Cat: cat));
                   },
                   child: Container(
                     // height: media.size.height*.02,

                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       color: colorGrey.withOpacity(.2),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Center(
                           child: Row(
                             children: [
                               CircleAvatar(
                                 radius: 14,
                                 backgroundColor:
                                 colorGrey.withOpacity(.0),
                                 backgroundImage:
                                 NetworkImage(category[index]["img"]),
                               ),
                               wSpacer(),
                               Text(
                                 category[index]["name"],
                                 style:const TextStyle(
                                   color: colorGrey,
                                 ),
                               ),
                             ],
                           )),
                     ),
                   ),
                 ),
               );
             },
           ),
         );
           }, ),
             const Padding(
                padding:
                 EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended News",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: colorBlack),
                    ),
                    Text(
                      "Show More",
                      style: TextStyle(fontSize: 12, color: colorGrey),
                    ),
                  ],
                ),
              ),
              BlocBuilder<RecoBloc, RecoState>(
                builder: (context, state) {
                  if (state is RecoLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is RecoErrorState) {
                    return Center(
                      child: Text(state.errorMsg),
                    );
                  } else if (state is RecoLoadedState) {
                    return SingleChildScrollView(
                      child:


                      Column(
                        children: [

                          ListView.builder(
                            shrinkWrap: true,
                            physics:const NeverScrollableScrollPhysics(),
                            itemCount:state.mData.articles!.length,
                            itemBuilder: (context, index) {

                              return GestureDetector(
                                onTap: (){
                                  var name =
                                      state.mData.articles![index].source!.name;
                                  var author = state.mData.articles![index].author;
                                  var title = state.mData.articles![index].title;
                                  var desc =
                                      state.mData.articles![index].description;
                                  var content =
                                      state.mData.articles![index].content;
                                  var imgUrl =
                                      state.mData.articles![index].urlToImage;
                                  var newsUrl = state.mData.articles![index].url;
                                  var publishedAt =
                                      state.mData.articles![index].publishedAt;


                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShowNews(name, author, title, desc, content, imgUrl, publishedAt, newsUrl),));





                                },


                                child: ListTile(
                                  leading: Container(
                                    width: media.size.width * .3,
                                    height: media.size.height * .1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colorGrey,
                                        image: DecorationImage(
                                          image: NetworkImage(state
                                              .mData.articles![index].urlToImage
                                              .toString()),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                        const  CircleAvatar(
                                            radius: 4,
                                            backgroundColor: colorButton,
                                          ),
                                          wSpacer(),
                                          Text(
                                            state.mData.articles![index].author ==
                                                null
                                                ? "Unknown Author"
                                                : state
                                                .mData.articles![index].author
                                                .toString(),
                                            style:const TextStyle(fontSize: 10),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          wSpacer(),
                                         
                                        ],
                                      ),
                                      hSpacer(),
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.mData.articles![index].title
                                            .toString(),
                                        style:const TextStyle(
                                            color: colorBlack,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      hSpacer(),
                                      Text(
                                        state.mData.articles![index].publishedAt
                                            .toString(),
                                        style:const TextStyle(color: colorGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),


                    );
                  }
                  return Container();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}






//
// Padding(
// padding:
// const EdgeInsets.only(top: 10, left: 15, right: 15),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: media.size.height * .06,
// width: media.size.width * .13,
// decoration: BoxDecoration(
// color: colorGrey.withOpacity(.2),
// borderRadius: BorderRadius.circular(50),
// ),
// child: Center(
// child: Container(
// height: media.size.height * .05,
// width: media.size.width * .11,
// decoration: BoxDecoration(
// color: colorWhite,
// borderRadius: BorderRadius.circular(50),
// ),
// child:const Center(
// child: Icon(
// Icons.menu_rounded,
// color: colorBlack,
// )),
// ),
// ),
// ),
// Container(
// height: media.size.height * .06,
// width: media.size.width * .25,
// decoration: BoxDecoration(
// color: colorGrey.withOpacity(.2),
// borderRadius: BorderRadius.circular(50),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// height: media.size.height * .05,
// width: media.size.width * .11,
// decoration: BoxDecoration(
// color: colorWhite,
// borderRadius: BorderRadius.circular(50),
// ),
// child:const Center(
// child: Icon(
// Icons.search,
// color: colorBlack,
// )),
// ),
// wSpacer(mWidth: media.size.width * .01),
// Stack(children: [
// Container(
// height: media.size.height * .05,
// width: media.size.width * .11,
// decoration: BoxDecoration(
// color: colorWhite,
// borderRadius: BorderRadius.circular(50),
// ),
// child:const Center(
// child: Icon(
// Icons.notifications_none_rounded,
// color: colorBlack,
// )),
// ),
// Positioned(
// left: 25,
// top: 13,
// child: Container(
// height: media.size.height * .01,
// width: media.size.width * .02,
// decoration: BoxDecoration(
// color: Colors.red,
// borderRadius:
// BorderRadius.circular(50),
// ),
// )),
// ]),
// ],
// ),
// ),
// ],
// ),
// ),


