import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginUserNameChanged extends LoginEvent {
  final String? username;
  LoginUserNameChanged({this.username});

  @override
  List<Object?> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  final String? passwword;
  LoginPasswordChanged({this.passwword});
  @override
  List<Object?> get props => [passwword];
}

class LoginSubmitted extends LoginEvent {
  @override
  List<Object?> get props => [];
}



// bu event kismi bizim butun olaylarimiz icin ayri ayri  sinif olusturacagimiz yapi olacak...