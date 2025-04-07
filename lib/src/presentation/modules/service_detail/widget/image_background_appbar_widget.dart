// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:project_laundry_flutter/src/data/models/register_service.dart';
// import 'package:project_laundry_flutter/src/presentation/modules/base/base_screen/show_list_image_product.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class ImageBackgroundAppbarWidget extends StatefulWidget {
//   final RegisterService service;
//   final List<XFile> listImages;
//   const ImageBackgroundAppbarWidget(
//       {super.key, required this.service, required this.listImages});

//   @override
//   State<ImageBackgroundAppbarWidget> createState() =>
//       _ImageBackgroundAppbarWidgetState();
// }

// class _ImageBackgroundAppbarWidgetState
//     extends State<ImageBackgroundAppbarWidget> {
//   late PageController _pageController;
//   late Timer _timer;
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentPage, keepPage: true);
//     _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
//       if (_currentPage < widget.service.listUrlImage.length) {
//         _currentPage++;
//         _pageController.animateToPage(
//           _currentPage,
//           duration: const Duration(milliseconds: 800),
//           curve: Curves.fastOutSlowIn,
//         );
//       } else {
//         _currentPage = 0;
//         _pageController.jumpToPage(_currentPage);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//     _timer.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       PageView.builder(
//           controller: _pageController,
//           onPageChanged: (index) {
//             _currentPage = index;
//           },
//           itemCount: widget.service.listUrlImage.length + 1,
//           itemBuilder: (context, index) {
//             if (index == widget.service.listUrlImage.length) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => ShowListImageProduct(
//                           currentPage: 0, listFileImages: widget.listImages)));
//                 },
//                 child: Image.file(
//                   File(widget.service.listUrlImage[0]),
//                   fit: BoxFit.cover,
//                 ),
//               );
//             }
//             return GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => ShowListImageProduct(
//                         currentPage: index,
//                         listFileImages: widget.listImages)));
//               },
//               child: Image.file(
//                 File(widget.service.listUrlImage[index]),
//                 fit: BoxFit.cover,
//               ),
//             );
//           }),
//       Positioned.fill(
//           bottom: 10,
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: SmoothPageIndicator(
//               controller: _pageController,
//               count: widget.service.listUrlImage.length,
//               effect: const ExpandingDotsEffect(
//                   activeDotColor: Colors.white,
//                   spacing: 5,
//                   dotColor: Colors.grey,
//                   dotWidth: 15,
//                   dotHeight: 5),
//             ),
//           ))
//     ]);
//   }
// }
