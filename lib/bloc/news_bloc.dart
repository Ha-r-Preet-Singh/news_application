import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_application/api/us_api_helper.dart';
import 'package:news_application/api/urls/urls.dart';
import 'package:news_application/models/us_model/us_datamodel.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  UsApiHelper usapiHelper;
  NewsBloc({required this.usapiHelper}) : super(NewsInitialState()) {
    on<TopHeadlines>((event, emit) async {
      emit(NewsLoadingState());

      var res = await usapiHelper.getUsApi();
      // var res = await apiHelper.getApi("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3e6b4603907d4aa78580ab57f3a272c9");

      print(res);
      if (res != null) {
        emit(NewsLoadedState(mData: UsDataModel.fromJson(res)));
      } else {
        emit(NewsErrorState(errorMsg: "Internet Error"));
      }
    });
  }
}
