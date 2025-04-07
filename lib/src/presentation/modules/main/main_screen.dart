import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/dependencies.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/home/home_page.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/widget/bottom_bar_widget.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/profile/profile_page.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/service/service_page.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<MainBloc>(
      create: (_) => getServiceProvider().resolve(),
      dispose: (_, bloc) => bloc.dispose,
      child: const _MainPage(),
    );
  }
}

class _MainPage extends StatefulWidget {
  const _MainPage();

  @override
  State<_MainPage> createState() => __MainPageState();
}

class __MainPageState extends State<_MainPage> {
  int _selectedIndex = 0;
  late MainBloc _bloc;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    _bloc = context.read<MainBloc>();
    _bloc.initMainBloc();

    _widgetOptions = <Widget>[
      HomePage(
        bloc: _bloc,
      ),
      ServicePage(
        bloc: _bloc,
      ),
      ProfilePage(
        bloc: _bloc,
      ),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
