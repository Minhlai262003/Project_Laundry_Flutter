import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/dependencies.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_widget/form_container_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/login/login_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/login/widget/button_login_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_screen.dart';
import 'package:project_laundry_flutter/src/presentation/modules/register/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<LoginBloc>(
      create: (_) => getServiceProvider().resolve(),
      child: const _LoginPage(),
    );
  }
}

class _LoginPage extends StatefulWidget {
  const _LoginPage();

  @override
  State<_LoginPage> createState() => __LoginPageState();
}

class __LoginPageState extends State<_LoginPage> {
  late LoginBloc _bloc;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _bloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: _appBarWidget(context),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _logoWidget(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
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
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
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
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: ButtonLoginWidget(
                                bloc: _bloc,
                                emailController: _emailController,
                                passwordController: _passwordController,
                                formKey: formKey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _registerWidget(context),
                            const SizedBox(
                              height: 20,
                            ),
                            _continueGGWidget(),
                            const SizedBox(
                              height: 5,
                            ),
                            _continueFaceWidget(),
                            const SizedBox(
                              height: 5,
                            ),
                            _continueGitWidget()
                          ])),
                ),
              ),
            ),
          ],
        ));
  }

  Text _lableWidget(String lable) {
    return Text(
      lable,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  GestureDetector _continueGitWidget() {
    return GestureDetector(
      onTap: () async {
        String? idUser = await _bloc.loginWithGithub(context);
        if (idUser != null) {
          await _bloc.addIdUser(idUser);
          Navigator.pushReplacement((context),
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      },
      child: Card(
        child: ListTile(
          title: const Text(
            "Continue with Github",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          leading: Image.asset(
            "assets/github.png",
            height: 30,
            width: 30,
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

  GestureDetector _continueFaceWidget() {
    return GestureDetector(
      onTap: () async {
        String? idUser = await _bloc.loginWithFacebook();
        if (idUser != null) {
          await _bloc.addIdUser(idUser);
          Navigator.pushReplacement((context),
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      },
      child: Card(
        child: ListTile(
          title: const Text(
            "Continue with Facebook",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          leading: Image.asset(
            "assets/facebook.png",
            height: 30,
            width: 30,
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

  GestureDetector _continueGGWidget() {
    return GestureDetector(
      onTap: () async {
        String? idUser = await _bloc.loginWithGoogle();
        if (idUser != null) {
          await _bloc.addIdUser(idUser);
          Navigator.pop(context);
        }
      },
      child: Card(
        child: ListTile(
          title: const Text(
            "Continue with Google",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          leading: Image.asset(
            "assets/google.png",
            height: 30,
            width: 30,
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

  Row _registerWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don`t have an account?",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 3,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
          },
          child: const Text(
            "Register",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )
      ],
    );
  }

  Center _logoWidget() {
    return Center(
        child: Image.asset(
      "assets/washing_machine.png",
      height: 100,
      width: 100,
    ));
  }

  AppBar _appBarWidget(BuildContext context) {
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
          margin: const EdgeInsets.only(top: 15), child: const Text("Login")),
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
    );
  }
}
