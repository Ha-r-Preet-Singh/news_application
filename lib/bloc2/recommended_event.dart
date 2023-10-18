



import 'package:flutter/material.dart';

@immutable
abstract class RecoEvent {}


class RecoHeadlines extends RecoEvent{
  String? Cat;

  RecoHeadlines({ this.Cat});
}

