import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_laundry_flutter/src/data/models/service_registed.dart';
import 'package:project_laundry_flutter/src/presentation/modules/service_detail/service_detail_screen.dart';

class ItemHistoryServiceWidget extends StatelessWidget {
  final ServiceRegisted serviceRegisted;
  const ItemHistoryServiceWidget({super.key, required this.serviceRegisted});
  String formatDateTime(DateTime dateTime) {
    String formattedTime =
        DateFormat('HH:mm').format(dateTime); // Lấy giờ và phút
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(dateTime); // Lấy ngày/tháng/năm
    return '$formattedTime $formattedDate';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Thêm bóng đổ để làm nổi bật Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bo tròn các góc
      ),
      margin: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 15), // Khoảng cách giữa các card
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Bo tròn ảnh đại diện
          child: Image.network(
            serviceRegisted.service.urlIcon,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatDateTime(serviceRegisted.createdDate),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 5), // Khoảng cách giữa các dòng
              Text(
                serviceRegisted.service.nameService,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "\$${serviceRegisted.service.costs * serviceRegisted.quantity}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceRegistedDetailScreen(
                    serviceRegisted: serviceRegisted,
                  ),
                ));
          },
          icon: const Icon(Icons.arrow_forward_ios),
          color: Colors.blue, // Màu sắc cho icon
        ),
      ),
    );
  }
}
