import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mj_app_f/custom/custom_bottom_navigation.dart';
import 'package:mj_app_f/util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    const Center(child: Text('홈 화면')),
    const Center(child: Text('게임 화면')),
    const Center(child: Text('켈린더')),
    const Center(child: Text('가계부')),
    const Center(child: Text('기타')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 탭 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation")),
      body: _pages[_selectedIndex],
      bottomNavigationBar: buildBottomNavigation(
        context: context,
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
