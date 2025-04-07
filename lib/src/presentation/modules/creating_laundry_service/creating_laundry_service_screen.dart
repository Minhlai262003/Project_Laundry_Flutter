import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/dependencies.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_widget/infor_service_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/creating_laundry_service_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/widget/button_create_service_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/widget/image_picker_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/widget/quantity_widget.dart';

import 'package:provider/provider.dart';

class CreatingLaundryServiceScreen extends StatelessWidget {
  final LaundryService laundryService;
  const CreatingLaundryServiceScreen({super.key, required this.laundryService});

  @override
  Widget build(BuildContext context) {
    return Provider<CreatingLaundryServiceBloc>(
      create: (_) => getServiceProvider().resolve(),
      child: _CreatingLaundryServicePage(
        laundryService: laundryService,
      ),
    );
  }
}

class _CreatingLaundryServicePage extends StatefulWidget {
  final LaundryService laundryService;
  const _CreatingLaundryServicePage({required this.laundryService});

  @override
  State<_CreatingLaundryServicePage> createState() =>
      ___CreatingLaundryServicePageState();
}

class ___CreatingLaundryServicePageState
    extends State<_CreatingLaundryServicePage> {
  late CreatingLaundryServiceBloc _bloc;
  int _quantity = 1;
  final List<XFile> _listImages = [];

  final TextEditingController _noteCotroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _bloc = context.read<CreatingLaundryServiceBloc>();
    _bloc.initCreatingLaundryServiceBlocc(
        listFileImages: _listImages,
        note: _noteCotroller.text,
        quantity: _quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: appBarWidget(context),
      body: Container(
        color: Colors.blue,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.grey[300]),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleWidget(),
                    lableWidget("\$${widget.laundryService.costs}"),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 10, horizontal: 15),
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.white,
                      child: ImagePickerWidget(
                        listImages: _listImages,
                        bloc: _bloc,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          lableWidget("Quantity"),
                          QuantityWidget(
                            bloc: _bloc,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: noteWidget(context),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.white,
                      child: InforServiceWidget(
                        serviceInfo: widget.laundryService.serviceInfo,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.white,
                        child: ButtonCreateServiceWidget(
                          handleAfterCreatingSuccess: (result) {
                            if (result == true) {
                              setState(() {
                                _listImages.clear();
                                _noteCotroller.clear();
                                _quantity = 1;

                                _bloc.initCreatingLaundryServiceBlocc(
                                    quantity: _quantity,
                                    listFileImages: _listImages,
                                    note: _noteCotroller.text);
                              });
                            }
                          },
                          bloc: _bloc,
                          service: widget.laundryService,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column noteWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lableWidget("Note"),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 200,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            maxLines: null,
            controller: _noteCotroller,
            onChanged: (note) {
              _bloc.updateNote(note);
            },
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none,
            ),
            style: const TextStyle(decorationThickness: 0),
          ),
        )
      ],
    );
  }

  Widget lableWidget(String nameLable) {
    return Text(
      nameLable,
      style: const TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Widget titleWidget() {
    return Text(
      widget.laundryService.nameService,
      style: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  PreferredSize appBarWidget(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.sizeOf(context).width,
          MediaQuery.sizeOf(context).height * 0.2),
      child: AppBar(
        leading: Container(
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        backgroundColor: Colors.blue,
        flexibleSpace: Center(
          child: Image.network(
            widget.laundryService.urlIcon,
          ),
        ),
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
      ),
    );
  }
}
