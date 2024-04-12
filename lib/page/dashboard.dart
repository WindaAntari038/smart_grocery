// ignore_for_file: unused_import, unused_field

import 'package:apk1/page/dashboard_purchase.dart';
import 'package:apk1/page/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:apk1/utils/constants.dart';

import 'package:apk1/page/dashboard_home.dart';
import 'package:apk1/page/dashboard_add.dart';
import 'package:apk1/page/dashboard_setting.dart';
import 'package:apk1/page/second_screen.dart'; // Import PurchasePage

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
 
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0; //set initial screen index here
  //Track active index
  final List<Widget> _screens = [
    const DashboardHome(),
    const DashboardAdd(),
     DashboardPurchase(),
    const DashboardSetting(),
  ];

  final List<String> _appBarTitles = const [
    "Halaman Utama",
    "Halaman Belanja",
    "Riwayat Pembelian",
    "Pengaturan & Profil",
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        buttonBackgroundColor: Constants.primaryColor,
        items: [
          Icon(
            Icons.home,
            size: 30.0,
            color: _selectedIndex == 0 ? Colors.white : Constants.activeMenu,
          ),
          Icon(
            Icons.add,
            size: 30.0,
            color: _selectedIndex == 1 ? Colors.white : Constants.activeMenu,
          ),
          Icon(
            Icons.list,
            size: 30.0,
            color: _selectedIndex == 2 ? Colors.white : Constants.activeMenu,
          ),
          Icon(
            Icons.settings,
            size: 30.0,
            color: _selectedIndex == 3 ? Colors.white : Constants.activeMenu,
          ), // Changed to list icon
        ],
        onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }
      ),
      backgroundColor: Constants.primaryColor,
      body: _screens[_selectedIndex],
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer'),
            ),
            ListTile(
              title: const Text('Latihan API'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LongListScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Latihan CRUD'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTypes()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}