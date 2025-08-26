import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_bottom_navigation.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/views/account_book/account_book.dart';
import 'package:mj_app_f/views/home/home.dart';

import 'controller/home_controller.dart';

void main() async {
  Get.lazyPut(() => HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // 각 탭에서 보여줄 화면
  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('게임 화면', style: TextStyle(color: ColorStyle.white),)),
    const Center(child: Text('켈린더', style: TextStyle(color: ColorStyle.white),)),
    const AccountBookScreen(),
    const Center(child: Text('기타', style: TextStyle(color: ColorStyle.white),)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 탭 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: buildBottomNavigation(
        context: context,
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
