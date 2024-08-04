//import 'dart:html';

import 'package:flutter/material.dart';

import 'Activity_Page/activity_page.dart';
import 'Home_Page/home_page.dart';
import 'Match_Page/match_page.dart';
import 'ProfilePage/profile_page.dart';

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
    final double bottomNavBarHeight = screenHeight * 0.12;
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        width: double.infinity, // 确保宽度填充整个屏幕
        height: bottomNavBarHeight, // 设置高度为屏幕高度的 10%
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 41, 97, 153),
              Color.fromARGB(255, 16, 38, 64)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding:
                      EdgeInsets.only(bottom: screenHeight * 0.01), // 向上移动按钮
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        _selectedIndex == 0
                            ? 'assets/image/navigation/light/Home.png'
                            : 'assets/image/navigation/filled/Home.png',
                        width: screenHeight * 0.035,
                        height: screenHeight * 0.035,
                        fit: BoxFit.contain,
                      ),
                      // SizedBox(height: screenHeight*0.005), // 调整图标和文字之间的距离
                    ],
                  ),
                ),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '活动',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding:
                      EdgeInsets.only(bottom: screenHeight * 0.01), // 向上移动按钮
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        _selectedIndex == 2
                            ? 'assets/image/navigation/light/Cart.png'
                            : 'assets/image/navigation/filled/Cart-1.png',
                        width: screenHeight * 0.035,
                        height: screenHeight * 0.035,
                        fit: BoxFit.contain,
                      ),
                      // SizedBox(height: screenHeight*0.005), // 调整图标和文字之间的距离
                    ],
                  ),
                ),
                label: '比赛',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding:
                      EdgeInsets.only(bottom: screenHeight * 0.01), // 向上移动按钮
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        _selectedIndex == 3
                            ? 'assets/image/navigation/light/User.png'
                            : 'assets/image/navigation/filled/User.png',
                        width: screenHeight * 0.035,
                        height: screenHeight * 0.035,
                        fit: BoxFit.contain,
                      ),
                      // SizedBox(height: screenHeight*0.005), // 调整图标和文字之间的距离
                    ],
                  ),
                ),
                label: '我的',
              ),
            ],
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
}
