//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/Activity_Page/activity_page.dart';
import 'pages/Home_Page/home_page.dart';
import 'pages/Match_Page/match_page.dart';
import 'pages/ProfilePage/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    ActivityPage(),
    MatchPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // 计算 BottomNavigationBar 的高度（10% 的屏幕高度）
    final double bottomNavBarHeight = 85.h;
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        width: double.infinity, // 确保宽度填充整个屏幕
        height: bottomNavBarHeight, // 设置高度为屏幕高度的 10%
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff286199), Color(0xff0a1526)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            items: List.generate(
                4, (index) => _buildBottomNavigationBarItem(index)),
            currentIndex: _selectedIndex,
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: Color.fromARGB(255, 111, 122, 135),
            backgroundColor: Colors.transparent, // 使导航栏背景透明
            elevation: 0, // 移除阴影
            type: BottomNavigationBarType.fixed, // 确保所有按钮都固定
            onTap: _onItemTapped, // 点击按钮时调用
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(int index) {
    List<String> lightIcons = [
      'assets/image/navigation/light/Home.png',
      'assets/image/navigation/light/Activity.png',
      'assets/image/navigation/light/Cart.png',
      'assets/image/navigation/light/User.png',
    ];

    List<String> filledIcons = [
      'assets/image/navigation/filled/Home.png',
      'assets/image/navigation/filled/Activity.png',
      'assets/image/navigation/filled/Cart.png',
      'assets/image/navigation/filled/User.png',
    ];

    List<String> labels = ['首页', '活动', '比赛', '我的'];

    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 8.h), // 向上移动按钮
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              _selectedIndex == index ? lightIcons[index] : filledIcons[index],
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
            // SizedBox(height: screenHeight*0.005), // 调整图标和文字之间的距离
          ],
        ),
      ),
      label: labels[index],
    );
  }
}
