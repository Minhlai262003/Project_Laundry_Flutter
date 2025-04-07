import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/creating_laundry_service_screen.dart';
import 'package:project_laundry_flutter/src/presentation/modules/login/login_screen.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';

class ItemServiceWidget extends StatefulWidget {
  final LaundryService laundryService;
  final MainBloc bloc;
  const ItemServiceWidget(
      {super.key, required this.bloc, required this.laundryService});

  @override
  State<ItemServiceWidget> createState() => _ItemServiceWidgetState();
}

class _ItemServiceWidgetState extends State<ItemServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: widget.bloc.userStream,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              if (!snapshot.hasData) {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()))
                    .then((_) async {
                  await widget.bloc.initMainBloc();
                  widget.bloc.userStream.first.then((user) {
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CreatingLaundryServiceScreen(
                                    laundryService: widget.laundryService,
                                  ))).then((_) {
                        widget.bloc.initMainBloc();
                      });
                      ;
                    }
                  });
                });
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatingLaundryServiceScreen(
                              laundryService: widget.laundryService,
                            ))).then((_) {
                  widget.bloc.initMainBloc();
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 70,
                      width: 70,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Image.network(
                        widget.laundryService.urlIcon,
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    widget.laundryService.nameService,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
          );
        });
  }
}
