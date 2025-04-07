import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_laundry_flutter/src/presentation/modules/register/register_bloc.dart';

class ButtonRegisterWidget extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passWordController;
  final RegisterBloc bloc;
  final GlobalKey<FormState> formKey;
  const ButtonRegisterWidget(
      {super.key,
      required this.userNameController,
      required this.emailController,
      required this.passWordController,
      required this.bloc,
      required this.formKey});

  void _handleSignUp() async {
    if (formKey.currentState?.validate() ?? false) {
      print(emailController.text);
      var idUser = await bloc.registerEmail(
        emailController.text.trim(),
        passWordController.text.trim(),
        userNameController.text.trim(),
      );
      if (idUser != null) {
        Fluttertoast.showToast(
            msg: "Register success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.amber[800],
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Register error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.amber[800],
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleSignUp();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Text(
            "Register",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
