import 'package:flutter/material.dart';

class ShowServiceScreen extends StatelessWidget {
  final String urlImage;
  const ShowServiceScreen({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          _logoWidget(context),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                child: Image.network(
                  urlImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoWidget(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 8,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        SizedBox(
          height: 250,
          child: Center(
              child: Image.asset(
            "assets/washing_machine.png",
            height: 130,
            width: 130,
          )),
        ),
      ],
    );
  }
}
