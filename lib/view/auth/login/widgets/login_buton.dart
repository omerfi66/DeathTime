import 'package:denemeblocccdeneme/blocs/autsh/login/login_bloc.dart';
import 'package:denemeblocccdeneme/blocs/autsh/login/login_event.dart';
import 'package:denemeblocccdeneme/blocs/autsh/login/login_state.dart';
import 'package:denemeblocccdeneme/view/auth/form_submission_status.dart';
import 'package:denemeblocccdeneme/view/death_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButon extends StatelessWidget {
  const LoginButon({super.key, required this.formKey});

  final dynamic formKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return state.formStatus is FormSubmitting
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.grey.shade700,
              ))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade700,
                  minimumSize: const Size(150, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Köşeleri yuvarlar
                  ),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                    await Future.delayed(const Duration(seconds: 2));
                    final Busername =
                        (BlocProvider.of<LoginBloc>(context).state).username;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeathScreen(
                                  username: Busername,
                                )));
                  }
                },
                child: const Text(
                  'Hesapla',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ));
      }),
    );
  }
}
