import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';
import 'package:project_laundry_flutter/src/presentation/modules/login/login_screen.dart';
import 'package:project_laundry_flutter/src/presentation/modules/show_service/show_service_screen.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';

class ItemPopularService extends StatefulWidget {
  final String urlImage;
  final double rating;
  final MainBloc bloc;
  final String nameService;

  const ItemPopularService({
    super.key,
    required this.urlImage,
    required this.rating,
    required this.bloc,
    required this.nameService,
  });

  @override
  State<ItemPopularService> createState() => _ItemPopularServiceState();
}

class _ItemPopularServiceState extends State<ItemPopularService> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: widget.bloc.userStream,
      builder: (context, snapshot) {
        return GestureDetector(
            onTap: () async {
              if (!snapshot.hasData) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
                await widget.bloc.initMainBloc();
                widget.bloc.userStream.first.then((user) {
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowServiceScreen(
                          urlImage: widget.urlImage,
                        ),
                      ),
                    );
                  }
                });
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowServiceScreen(
                      urlImage: widget.urlImage,
                    ),
                  ),
                );
              }
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      widget.urlImage,
                      fit: BoxFit.contain,
                      height: 180,
                      width: 180,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: _ratingWidget(),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _nameService(),
                  )
                ],
              ),
            ));
      },
    );
  }

  Center _nameService() {
    return Center(
      child: Text(
        widget.nameService,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10.0, // Độ mờ của bóng đổ
                color: Colors.black.withOpacity(0.5), // Màu bóng đổ
                offset: const Offset(2.0, 2.0),
              ) // Vị trí bóng đổ)
            ],
            fontSize: 30),
      ),
    );
  }

  Container _ratingWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          const SizedBox(width: 5),
          Text(
            widget.rating.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
