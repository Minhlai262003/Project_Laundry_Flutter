import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_widget/list_service_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/home/home_widget/carousel_banner_laundry_service_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/home/home_widget/list_popular_services_widget.dart';

class HomePage extends StatefulWidget {
  final MainBloc bloc;

  const HomePage({
    super.key,
    required this.bloc,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: appBarWidget(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.sizeOf(context).width,
                child: CarouselBannerLaundryServiceWidget(bloc: widget.bloc),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    lableWidget("Services"),
                    const SizedBox(
                      height: 10,
                    ),
                    ListServiceWidget(bloc: widget.bloc),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        lableWidget("Popular Services"),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ListPopularServicesWidget(
                            bloc: widget.bloc,
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
          StreamBuilder<User?>(
            stream: widget.bloc.userStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ));
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
          margin: const EdgeInsets.only(top: 15),
          child: const Center(child: Text("Home"))),
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 35),
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
    );
  }

  Widget lableWidget(String nameLable) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          nameLable,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
        ),
      ),
    );
  }
}
