import 'package:denemeblocccdeneme/blocs/autsh/login/login_bloc.dart';
import 'package:denemeblocccdeneme/blocs/autsh/login/login_event.dart';
import 'package:denemeblocccdeneme/blocs/autsh/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2.0), // Border color and thickness
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2.0), // Focused border color and thickness
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2.0), // Enabled border color and thickness
                ),
                icon: const Icon(Icons.person),
                hintText: ' isim  ',
                hintStyle: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
              validator: (value) => state.isValidUsername ? null : 'ismini yaz',
              onChanged: (value) => context
                  .read<LoginBloc>()
                  .add(LoginUserNameChanged(username: value)),
            );
          },
        ));
  }
}
