import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/show_service/show_service_screen.dart';

class ItemImageSlider extends StatelessWidget {
  final String urlImage;
  final MainBloc bloc;
  const ItemImageSlider(
      {super.key, required this.urlImage, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowServiceScreen(
                      urlImage: urlImage,
                    )));
      },
      child: Image.network(
        urlImage,
        width: MediaQuery.sizeOf(context).width,
        fit: BoxFit.fill,
      ),
    );
  }
}
