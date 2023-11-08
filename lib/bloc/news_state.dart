part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String? errorMsg;
  NewsErrorState({required this.errorMsg});
}

class NewsLoadedState extends NewsState {
  UsDataModel mData;
  NewsLoadedState({required this.mData});
}
