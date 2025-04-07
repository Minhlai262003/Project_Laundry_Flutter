// import 'package:flutter/material.dart';
// import 'package:project_laundry_flutter/src/data/models/user.dart';
// import 'package:project_laundry_flutter/src/presentation/modules/create_service/create_service_screen.dart';
// import 'package:project_laundry_flutter/src/presentation/modules/login/login_screen.dart';
// import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';

// class ButtonCreateService extends StatelessWidget {
//   final MainBloc bloc;
//   const ButtonCreateService({super.key, required this.bloc});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//         stream: bloc.userStream,
//         builder: (context, snapshot) {
//           return GestureDetector(
//             onTap: () {
//               if (!snapshot.hasData) {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const LoginScreen())).then((_) {
//                   bloc.initMainBloc();
//                 });
//               } else {
//                 Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const CreateServiceScreen()))
//                     .then((_) {
//                   bloc.initMainBloc();
//                 });
//               }
//             },
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
//               width: 150,
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.amber[800],
//                   borderRadius: BorderRadius.circular(10)),
//               child: const Center(
//                 child: Text(
//                   "Create Service",
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
