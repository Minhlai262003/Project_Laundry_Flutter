// import 'package:flutter/material.dart';
// import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
// import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';
// import 'package:project_laundry_flutter/src/presentation/modules/service_detail/service_detail_screen.dart';

// class ItemServiceLaundry extends StatelessWidget {
//   final LaundryService service;
//   final MainBloc bloc;
//   const ItemServiceLaundry(
//       {super.key, required this.service, required this.bloc});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //         builder: (context) => ServiceDetailScreen(
//         //               service: service,
//         //             )));
//       },
//       child: Container(
//           // height: 200,
//           margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
//           padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//           width: 200,
//           decoration: BoxDecoration(
//               border: Border.all(
//                   color: Colors.amber[800] ?? Colors.white, width: 1),
//               borderRadius: BorderRadius.circular(20)),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
//                       padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
//                       decoration: BoxDecoration(
//                           color: Colors.amber[800],
//                           borderRadius: BorderRadius.circular(8)),
//                       child: ImageIcon(
//                         AssetImage(service.serviceClean.urlIcon),
//                         size: 25,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       service.serviceClean.nameServiceClean,
//                       style: const TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "x${service.quantity}",
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               Text(
//                 "\$${service.serviceClean.costs}",
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17),
//               ),
//             ],
//           )),
//     );
//   }
// }
