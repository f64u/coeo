import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  List<BottomNavyBarItem> NavyItem;

  int bottomNavyIndex = 0;

  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: bottomNavyIndex);
    NavyItem = [
      BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          activeColor: Colors.red,
          inactiveColor: Colors.grey),
      BottomNavyBarItem(
          icon: Icon(
            Icons.people,
          ),
          title: Text("Users"),
          activeColor: Colors.orange,
          inactiveColor: Colors.grey),
      BottomNavyBarItem(
          icon: Icon(
            Icons.message,
          ),
          title: Text("Message"),
          activeColor: Colors.purple,
          inactiveColor: Colors.grey),
      BottomNavyBarItem(
          icon: Icon(
            Icons.settings,
          ),
          title: Text("Settings"),
          activeColor: Colors.blue,
          inactiveColor: Colors.grey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save My Life"),
        primary: true,
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: true,
        selectedIndex: bottomNavyIndex,
        items: NavyItem,
        onItemSelected: (index) {
          bottomNavyIndex = index;
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        },
      ),
      body: PageView(
        children: <Widget>[
          HomePage(),
          UserPage(),
          MessagePage(),
          SettingPage()
        ],
        onPageChanged: (index) {
          setState(() {
            bottomNavyIndex = index;
          });
        },
        controller: pageController,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height / 1.2;
    return Container(
      height: heigh,
      width: double.infinity,
      child: Text("home"),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Users',
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ));
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Message',
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ));
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Setting',
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ));
  }
}
