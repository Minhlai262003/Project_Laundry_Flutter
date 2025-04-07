import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/presentation/modules/login/login_bloc.dart';

class ButtonLoginWidget extends StatelessWidget {
  final LoginBloc bloc;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const ButtonLoginWidget(
      {super.key,
      required this.bloc,
      required this.emailController,
      required this.passwordController,
      required this.formKey});

  void _handleLoginButton(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      var idUser = await bloc.loginEmail(
          emailController.text.trim(), passwordController.text.trim());
      if (idUser != null) {
        await bloc.addIdUser(idUser);
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleLoginButton(context);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
