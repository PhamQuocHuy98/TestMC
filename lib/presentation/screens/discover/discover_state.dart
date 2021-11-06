import 'package:demo_mc/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DiscoverState extends Equatable {}

class Initial extends DiscoverState {
  @override
  List<Object> get props => [];
}

class LoadingState extends DiscoverState {
  @override
  List<Object> get props => [];
}

class LoadSuccessfullyState extends DiscoverState {
  final List<String> images;

  LoadSuccessfullyState({required this.images});

  @override
  List<Object> get props => [images];
}

class ErrorLoadState extends DiscoverState {
  final String errorMessage;

  ErrorLoadState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
