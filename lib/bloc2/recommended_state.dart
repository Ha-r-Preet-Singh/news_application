part of 'recommended_bloc.dart';


@immutable
abstract class RecoState {}

class RecoInitialState extends RecoState {}

class RecoLoadingState extends RecoState {}

class RecoErrorState extends RecoState  {
  String errorMsg;
  RecoErrorState({required this.errorMsg});
}

class RecoLoadedState extends RecoState {
  IndiaDataModel mData;
  RecoLoadedState({required this.mData});
}

