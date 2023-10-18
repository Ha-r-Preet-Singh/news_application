import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_application/api/india_api_helper.dart';
import 'package:news_application/bloc2/recommended_event.dart';

import 'package:news_application/models/india_model/india_datamodel.dart';



part 'recommended_state.dart';


class RecoBloc extends Bloc<RecoEvent, RecoState> {
  IndiaApiHelper indiaapiHelper;
  RecoBloc({required this.indiaapiHelper}) : super(RecoInitialState()) {
    on<RecoHeadlines>((event, emit) async {
      emit(RecoLoadingState());

      var res = await indiaapiHelper.getIndiaApi(Cat: event.Cat==null? "general" : event.Cat!);
      // var res = await apiHelper.getApi("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3e6b4603907d4aa78580ab57f3a272c9");

      print(res);
      if (res != null) {
        emit(RecoLoadedState(mData: IndiaDataModel.fromJson(res)));
      } else {
        emit(RecoErrorState(errorMsg: "Internet Error"));
      }
    });
  }
}
