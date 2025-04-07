import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/home/home_widget/item_popular_service.dart';

class ListPopularServicesWidget extends StatelessWidget {
  final MainBloc bloc;
  const ListPopularServicesWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LaundryService>?>(
      stream: bloc.listPopularLaundryServiceStream, // Sử dụng stream từ bloc
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
        List<LaundryService> popularServices = snapshot.data!;
        return SizedBox(
          height: 250,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsetsDirectional.only(start: 30),
            scrollDirection: Axis.horizontal,
            itemCount: popularServices.length,
            itemBuilder: (context, index) {
              return ItemPopularService(
                bloc: bloc,
                nameService: popularServices[index].nameService,
                urlImage: popularServices[index].urlIcon,
                rating: popularServices[index].rating,
              );
            },
          ),
        );
      },
    );
  }
}
