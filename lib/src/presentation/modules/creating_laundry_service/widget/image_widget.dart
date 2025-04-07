import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_screen/show_list_image_product.dart';

class ImageWidget extends StatelessWidget {
  final File fileImage;
  final List<XFile> listFileImages;
  final void Function(File fileImage) onClickDeleted;
  final int currentPage;
  const ImageWidget(
      {super.key,
      required this.fileImage,
      required this.onClickDeleted,
      required this.listFileImages,
      required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            sheetAnimationStyle: AnimationStyle(),
            context: context,
            builder: (context) => ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Watch image"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShowListImageProduct(
                          currentPage: currentPage,
                          listFileImages: listFileImages)));
                }));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        height: 100,
        width: 100,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.file(
                fileImage,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset.zero,
                        blurRadius: 1,
                      ),
                    ]),
                child: GestureDetector(
                  onTap: () {
                    onClickDeleted(fileImage);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
