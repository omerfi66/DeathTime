import 'package:denemeblocccdeneme/view/auth/form_submission_status.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String username;
  bool get isValidUsername => username.length > 2;

  final String passwword;
  bool get isValidPassword => passwword.length >= 4 && passwword.length < 5;

  final FormSubmissionStatus formStatus;

  const LoginState({
    this.username = '',
    this.passwword = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith(
      {String? username, String? passwword, FormSubmissionStatus? formStatus}) {
    return LoginState(
        username: username ?? this.username,
        passwword: passwword ?? this.passwword,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object?> get props => [username, passwword, formStatus];
}



// Hangi degiskelerin durumlarini kontrol edecegimizi belirliyor bu sayfa

// aksiyon olarak gostermek istedigimiz degiskenlerin durumlarini burada gosterebilirlz