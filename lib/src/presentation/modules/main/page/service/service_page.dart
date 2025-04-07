import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/models/service_registed.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_widget/button_to_login_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/service/widget/item_history_service_widget.dart';

class ServicePage extends StatefulWidget {
  final MainBloc bloc;
  const ServicePage({super.key, required this.bloc});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  void initState() {
    // widget.bloc.initMainBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            _logoWidget(),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: StreamBuilder<User?>(
                    stream: widget.bloc.userStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.data == null) {
                          return Center(
                            child: ButtonToLoginWidget(
                              bloc: widget.bloc,
                            ),
                          );
                        } else {
                          return StreamBuilder<List<ServiceRegisted>?>(
                            stream: widget.bloc.listHistoryServiceStream,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                List<ServiceRegisted>? listService =
                                    snapshot.data;
                                if (listService == null ||
                                    listService.isEmpty) {
                                  return const Center(
                                    child: Text("No Data"),
                                  );
                                }
                                return ListView.builder(
                                  itemCount: listService.length,
                                  itemBuilder: (context, index) =>
                                      ItemHistoryServiceWidget(
                                    serviceRegisted: listService[index],
                                  ),
                                );
                              }
                              return const Center(
                                child: Text("No Data"),
                              );
                            },
                          );
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              ),
            ),
          ],
        ));
  }

  Widget _logoWidget() {
    return const SizedBox(
      height: 200,
      child: Center(
        child: Text(
          "History service",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
