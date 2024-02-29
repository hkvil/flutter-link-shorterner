import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learn_provider_1/database/DatabaseService.dart';
import 'package:learn_provider_1/provider/LinkProvider.dart';
import 'package:learn_provider_1/screen/HistoryScreen.dart';
import 'package:learn_provider_1/screen/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'component/MyBottomNavBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LinkProvider()),
        ChangeNotifierProvider(create: (context) => DatabaseService())
      ],
      child: const ShorternerApp(),
    ),
  );
  configEasyLoading();
}

void configEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false;
}

class ShorternerApp extends StatefulWidget {
  const ShorternerApp({super.key});

  @override
  State<ShorternerApp> createState() => _ShorternerAppState();
}

class _ShorternerAppState extends State<ShorternerApp> {
  int _currentIndex = 0;
  final List<Widget> _screen = [
    const HomeScreen(),
    const HistoryScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dbService = Provider.of<DatabaseService>(context, listen: false);
      dbService.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _screen,
          ),
          bottomNavigationBar:
              MyBottomNavBar(onTap: onTabTapped, currentIndex: _currentIndex),
        ),
      ),
    );
  }
}
