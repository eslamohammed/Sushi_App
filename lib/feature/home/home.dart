import 'package:flutter/material.dart';
import 'package:sushi/core/utils/color_manger.dart';
import 'package:sushi/feature/home/home_screen.dart';
import 'package:sushi/feature/home/widget/custom_appBar.dart';

import '../../core/utils/style_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildReservationsIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.calendar_today_outlined),
        Positioned(
          top: -6,
          right: -6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(minWidth: 20, minHeight: 16),
            child: const Text(
              '12',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(),
      Center(
        child: Text(
          'Menu Page',
          style: headlineNew3.copyWith(color: Colors.white, fontSize: 30),
        ),
      ),
      Center(
        child: Text(
          'Reservations Page',
          style: headlineNew3.copyWith(color: Colors.white, fontSize: 30),
        ),
      ),
      Center(
        child: Text(
          'Profile Page',
          style: headlineNew3.copyWith(color: Colors.white, fontSize: 30),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryBg,
      appBar: CustomAppBar(),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: _buildReservationsIcon(),
            label: 'Reservations',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF332D2B),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }
}
