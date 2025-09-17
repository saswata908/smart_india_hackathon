import 'package:farmify_app/screens/community.dart';
import 'package:farmify_app/screens/dashboard.dart';
import 'package:farmify_app/screens/profile.dart';
import 'package:farmify_app/screens/quests.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedNavBarIndex = 0; // Default: Home
  int _currentBodyPageIndex = 0; // For body display
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Dashboard(onCategorySelected: _handleCategorySelection),
      Quests(),
      Community(),
      Profile(),
    ];
  }

  void _handleCategorySelection(int pageIndex) {
    setState(() {
      _currentBodyPageIndex = pageIndex;
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedNavBarIndex = index;
      _currentBodyPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentBodyPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures all labels show
        currentIndex: _selectedNavBarIndex,
        onTap: _selectPage,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.blueGrey,
        selectedLabelStyle: GoogleFonts.lato(
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),

        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24,
              height: 24,
              color:
                  _selectedNavBarIndex == 0
                      ? Colors.lightGreen
                      : Colors.blueGrey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/quest.png',
              width: 24,
              height: 24,
              color:
                  _selectedNavBarIndex == 1
                      ? Colors.lightGreen
                      : Colors.blueGrey,
            ),
            label: 'Quests',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/people.png',
              width: 28,
              height: 28,
              color:
                  _selectedNavBarIndex == 2
                      ? Colors.lightGreen
                      : Colors.blueGrey,
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user.png',
              width: 24,
              height: 24,
              color:
                  _selectedNavBarIndex == 3
                      ? Colors.lightGreen
                      : Colors.blueGrey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
