// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:developershub_task_01/component/colors.dart';
import 'package:developershub_task_01/component/text_style.dart';
import 'package:developershub_task_01/view/bottom_navigation_bar/connection_screen.dart';
import 'package:developershub_task_01/view/bottom_navigation_bar/message_screen.dart';
import 'package:developershub_task_01/view/bottom_navigation_bar/notification_screen.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const String id = 'BottomNavigationScreen';
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ConnectionScreen(),
    NotificationScreen(),
    ChatScreen()
  ];

  void _tapToScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobie',style: AppTextStyle.title_Style,),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        actions: [
          Icon(Icons.more_vert_rounded,color: AppColor.buttonColor,),
          SizedBox(width: 10,)
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon:
                Icon(Icons.menu, color: Colors.white), // Change icon color here
            onPressed: () => Scaffold.of(context).openDrawer(), // Open Drawer
          ),
        ),
      ),
      drawer: Drawer(
        // backgroundColor: AppColor.buttonColor,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpeg',
                        fit: BoxFit.cover, // Ensures the image fills the space
                        width:
                            75, // Set the width and height equal to the CircleAvatar's size
                        height: 75,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, 'ViewProfileScreen');
                    },
                    child: Text(
                      'Amahle Ade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the Home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the Notifications screen
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the About screen
              },
            ),
            Spacer(),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                // Handle logout logic
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_sharp),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Message',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColor.primaryColor,
        iconSize: 30.0,
        elevation: 10.0,
        onTap: _tapToScreen,
      ),
    );
  }
}
