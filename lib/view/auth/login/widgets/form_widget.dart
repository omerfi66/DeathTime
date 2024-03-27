import 'package:denemeblocccdeneme/view/auth/login/widgets/login_buton.dart';
import 'package:denemeblocccdeneme/view/auth/login/widgets/password_testfield.dart';
import 'package:denemeblocccdeneme/view/auth/login/widgets/username_textfield.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});
  final GlobalKey _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/death.png'),
              const UsernameTextField(),
              const PasswordTextfield(),
              LoginButon(formKey: _formKey)
            ],
          ),
        ));
  }
}
