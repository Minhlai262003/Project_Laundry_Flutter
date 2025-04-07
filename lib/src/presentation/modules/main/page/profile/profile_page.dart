import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/profile/profile_widget/button_logout.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_widget/button_to_login_widget.dart';

class ProfilePage extends StatefulWidget {
  final MainBloc bloc;
  const ProfilePage({super.key, required this.bloc});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                          var user = snapshot.data;
                          return Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                user!.avatar.isNotEmpty
                                    ? ClipOval(
                                        child: Image.network(
                                          user.avatar,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : _noAvatarWidget(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data?.userName ?? 'No Name',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                ButtonLogout(
                                  bloc: widget.bloc,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
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

  Container _noAvatarWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      child: Icon(
        Icons.person,
        size: 100,
        color: Colors.grey[100],
      ),
    );
  }

  Widget _logoWidget() {
    return SizedBox(
      height: 250,
      child: Center(
          child: Image.asset(
        "assets/washing_machine.png",
        height: 130,
        width: 130,
      )),
    );
  }
}
