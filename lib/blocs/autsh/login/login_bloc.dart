import 'package:denemeblocccdeneme/blocs/autsh/login/login_event.dart';
import 'package:denemeblocccdeneme/blocs/autsh/login/login_state.dart';
import 'package:denemeblocccdeneme/repository/auth/login/login_repository.dart';
import 'package:denemeblocccdeneme/view/auth/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? authRepo;
  LoginBloc({this.authRepo}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await maoEventToState(event, emit);
    });
  }
  Future maoEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUserNameChanged) {
      emit(state.copyWith(username: event.username));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(passwword: event.passwword));
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await authRepo?.login();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}





// bu kisimda ise, state durumu var, hangi degiskenlerin degisecegini tanimladik,
// degisirken de event ile cagiracagiz ve bloc kisminda bize ne yapilmasi gerekiyorsa onu yaptiracak