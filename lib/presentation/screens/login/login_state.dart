import 'package:demo_mc/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessfullyState extends LoginState {
  final UserModel userModel;

  LoginSuccessfullyState({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
