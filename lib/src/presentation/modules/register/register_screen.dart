import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/dependencies.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_widget/form_container_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/register/register_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/register/widget/button_register_widget.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<RegisterBloc>(
      create: (_) => getServiceProvider().resolve(),
      child: const _RegisterPage(),
    );
  }
}

class _RegisterPage extends StatefulWidget {
  const _RegisterPage();

  @override
  State<_RegisterPage> createState() => __RegisterPageState();
}

class __RegisterPageState extends State<_RegisterPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  late RegisterBloc _bloc;
  @override
  void initState() {
    _bloc = context.read<RegisterBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: _appbarWiget(context),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          _logoWiget(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      _lableWidget("Username"),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _userNameController,
                        hintText: "Username",
                        isPasswordField: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your username please!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _lableWidget("Email"),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _emailController,
                        hintText: "Email",
                        isPasswordField: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your email please!';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'The email format is incorrect!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _lableWidget("Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _passwordController,
                        hintText: "Password",
                        isPasswordField: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your password please!';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long.';
                          }
                          return null;
                        },
                      ),
                      _lableWidget("Confirm password"),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _confirmPasswordController,
                        hintText: "Confirm password",
                        isPasswordField: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your password please!';
                          }
                          if (value != _passwordController.text) {
                            return 'Password Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: ButtonRegisterWidget(
                          bloc: _bloc,
                          userNameController: _userNameController,
                          emailController: _emailController,
                          passWordController: _passwordController,
                          formKey: formKey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _lableWidget(String lable) {
    return Text(
      lable,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Center _logoWiget() {
    return Center(
        child: Image.asset(
      "assets/washing_machine.png",
      height: 100,
      width: 100,
    ));
  }

  AppBar _appbarWiget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey,
      leading: Container(
        margin: const EdgeInsets.only(top: 15),
        child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      centerTitle: true,
      title: Container(
          margin: const EdgeInsets.only(top: 15),
          child: const Text("Register")),
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
    );
  }
}
