import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/presentation/modules/login/login_screen.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';

class ButtonToLoginWidget extends StatelessWidget {
  final MainBloc bloc;
  const ButtonToLoginWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()))
            .then((_) {
          bloc.initMainBloc();
        });
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
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
