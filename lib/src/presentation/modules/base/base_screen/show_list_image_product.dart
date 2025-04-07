import 'dart:io';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShowListImageProduct extends StatefulWidget {
  final List<XFile> listFileImages;
  final int currentPage;
  const ShowListImageProduct(
      {super.key, required this.listFileImages, required this.currentPage});

  @override
  State<ShowListImageProduct> createState() => _ShowListImageProductState();
}

class _ShowListImageProductState extends State<ShowListImageProduct> {
  late int currentPage;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    currentPage = widget.currentPage;
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.listFileImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  controller: pageController,
                  itemBuilder: (context, index) => Center(
                          child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white)),
                        child: Image.file(
                          fit: BoxFit.cover,
                          File(widget.listFileImages[index].path),
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.3,
                        ),
                      ))),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: widget.listFileImages.length > 1
                    ? DotsIndicator(
                        dotsCount: widget.listFileImages.length,
                        position: currentPage,
                        axis: Axis.horizontal,
                        decorator: const DotsDecorator(
                            activeColor: Colors.blue, color: Colors.grey),
                      )
                    : Container())
          ],
        ),
      ),
    );
  }
}
