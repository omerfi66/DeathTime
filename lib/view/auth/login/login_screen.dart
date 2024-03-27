// import 'package:denemeblocccdeneme/blocs/autsh/login/login_bloc.dart';
// import 'package:denemeblocccdeneme/blocs/autsh/login/login_state.dart';
// import 'package:denemeblocccdeneme/repository/auth/login/login_repository.dart';
// import 'package:denemeblocccdeneme/view/auth/form_submission_status.dart';
// import 'package:denemeblocccdeneme/view/auth/login/widgets/form_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: BlocProvider(
//         create: (context) =>
//             LoginBloc(authRepo: context.read<LoginRepository>()),
//         child: BlocListener<LoginBloc, LoginState>(
//           listenWhen: (previous, current) =>
//               previous.formStatus != current.formStatus,
//           listener: (context, state) {
//             final FormState = state.formStatus;
//             if (FormState is SubmissionFailed) {
//               _showSnackBAr(context, FormState.exception.toString());
//             }
//           },
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [const SizedBox(height: 10), FormWidget()],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showSnackBAr(BuildContext context, String message) {
//     final sinekbar = SnackBar(
//       content: Text(
//         message,
//         style: const TextStyle(color: Colors.redAccent),
//       ),
//       backgroundColor: Colors.transparent,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(sinekbar);
//   }
// }

import 'package:denemeblocccdeneme/blocs/autsh/login/login_bloc.dart';
import 'package:denemeblocccdeneme/blocs/autsh/login/login_state.dart';
import 'package:denemeblocccdeneme/repository/auth/login/login_repository.dart';
import 'package:denemeblocccdeneme/view/auth/form_submission_status.dart';
import 'package:denemeblocccdeneme/view/auth/login/widgets/form_widget.dart';
import 'package:denemeblocccdeneme/view/snackBar_anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, // Ekran boyutu kadar yükseklik
          child: BlocProvider(
            create: (context) =>
                LoginBloc(authRepo: context.read<LoginRepository>()),
            child: BlocListener<LoginBloc, LoginState>(
              listenWhen: (previous, current) =>
                  previous.formStatus != current.formStatus,
              listener: (context, state) {
                final formState = state.formStatus;
                if (formState is SubmissionFailed) {
                  _showSnackBar(context, formState.exception.toString());
                }
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      FormWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    // 'Exception' ibaresini kaldır
    final processedMessage = message.replaceAll('Exception', '');

    final snackBar = SnackBar(
      content: AnimatedText(
        text: processedMessage.substring(1), // Gereksiz boşlukları kaldır
        textStyle: const TextStyle(color: Colors.redAccent),
      ),
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 5), // SnackBar'ın ekranda kalma süres
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }
}
