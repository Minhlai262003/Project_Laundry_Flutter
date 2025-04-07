import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/creating_laundry_service_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/widget/image_widget.dart';

class ImagePickerWidget extends StatefulWidget {
  final CreatingLaundryServiceBloc bloc;
  final List<XFile> listImages;
  const ImagePickerWidget(
      {super.key, required this.bloc, required this.listImages});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgettState();
}

class _ImagePickerWidgettState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  Future<void> _requestPermissions(ImageSource source) async {
    Permission permission;
    if (source == ImageSource.camera) {
      permission = Permission.camera;
    } else {
      permission = Permission.storage;
    }

    var status = await permission.status;
    if (status.isDenied || status.isLimited) {
      // Yêu cầu quyền
      status = await permission.request();
      if (status.isDenied) {
        print("Permission denied");
        return;
      } else if (status.isPermanentlyDenied) {
        print("Permission permanently denied");
        openAppSettings(); // Mở cài đặt
        return;
      }
    }
    if (status.isGranted) {
      _pickImage(source);
    }
  }

  void _pickImage(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      print('Picked image path: ${pickedImage.path}');
      widget.listImages.add(pickedImage);
      print(widget.listImages);
      widget.bloc.updateListImages(widget.listImages);
    } else {
      print('No image selected.');
    }
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _requestPermissions(ImageSource.camera);
                      },
                      child: const Text("Camera")),
                  CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _requestPermissions(ImageSource.gallery);
                      },
                      child: const Text("Gallery"))
                ],
              ));
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text("Camera"),
                      onTap: () {
                        Navigator.of(context).pop();
                        _requestPermissions(ImageSource.camera);
                      }),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text("Gallery"),
                    onTap: () {
                      Navigator.of(context).pop();
                      _requestPermissions(ImageSource.gallery);
                    },
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<XFile>>(
      stream: widget.bloc.listImagesStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return listImagesPickerWidget(widget.listImages);
          }
          return GestureDetector(
            onTap: () {
              showImageSource(context);
            },
            child: const Align(
              alignment: Alignment.centerLeft,
              child: ImageIcon(
                AssetImage("assets/add_image.png"),
                size: 80,
                color: Colors.black,
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget listImagesPickerWidget(List<XFile> listImages) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount:
              listImages.length < 6 ? listImages.length + 1 : listImages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => index != listImages.length
              ? Align(
                  alignment: Alignment.center,
                  child: ImageWidget(
                      currentPage: index,
                      listFileImages: listImages,
                      onClickDeleted: (fileImage) {
                        listImages.removeWhere(
                            (imageFile) => imageFile.path == fileImage.path);
                        widget.bloc.updateListImages(listImages);
                      },
                      fileImage: File(listImages[index].path)),
                )
              : listImages.length < 6
                  ? GestureDetector(
                      onTap: () {
                        showImageSource(context);
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: ImageIcon(
                          AssetImage("assets/add_image.png"),
                          color: Colors.black,
                          size: 80,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
    );
  }
}
