import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_widget/item_service_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';

class ListServiceWidget extends StatelessWidget {
  final MainBloc bloc;
  const ListServiceWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.listLaundryServiceStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Hiển thị loading khi chưa có dữ liệu
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No popular services available'));
        }

        List<LaundryService> services = snapshot.data!;
        return SizedBox(
          height: 120,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              itemBuilder: (context, index) => ItemServiceWidget(
                    bloc: bloc,
                    laundryService: services[index],
                  )),
        );
      },
    );
  }
}
