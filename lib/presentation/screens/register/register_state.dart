import 'package:demo_mc/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class LoadingRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessfullyState extends RegisterState {
  final UserModel userModel;

  RegisterSuccessfullyState({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class ErrorRegisterState extends RegisterState {
  final String errorMessage;

  ErrorRegisterState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
