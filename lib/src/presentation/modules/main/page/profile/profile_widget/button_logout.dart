import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';

class ButtonLogout extends StatelessWidget {
  final MainBloc bloc;
  const ButtonLogout({super.key, required this.bloc});

  void _handleLogoutButton() {
    bloc.logout();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleLogoutButton();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Text(
            "Logout",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
