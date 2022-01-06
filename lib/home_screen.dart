import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_sharing/about_us.dart';
import 'package:material_sharing/contact_us.dart';
import 'package:material_sharing/login_screen.dart';
import 'package:material_sharing/news/news_home.dart';
import 'package:material_sharing/profile_screen.dart';

import 'core/constants/contants.dart';
import 'materials/files_home.dart';

String profilePic =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                tooltip: 'options',
                onSelected: (choice) {
                  if (choice == UserMenu.myProfile) {
                    Get.to(() => ProfileScreen());
                  } else if (choice == UserMenu.logout) {
                    Navigator.of(context).pop();
                    successToastMessage(msg: 'Logout Successful');
                    Get.to(() => LoginScreen());
                  } else if (choice == UserMenu.about) {
                    Get.to(() => AboutUs());
                  } else if (choice == UserMenu.contact) {
                    Get.to(() => const ContactUs());
                  }
                },
                itemBuilder: (BuildContext context) {
                  return UserMenu.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: "Materials",
                  icon: Icon(Icons.home),
                ),
                Tab(
                  text: "News",
                  icon: Icon(Icons.question_answer),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [FilesHome(), NewsHome()],
          ),
        ),
      ),
    );
  }
}

class UserMenu {
  static const String myProfile = 'My Profile';
  static const String logout = 'Logout';
  static const String settings = 'Settings';
  static const String contact = 'Contact Us';
  static const String about = 'About Us';

  static const List<String> choices = <String>[
    myProfile,
    logout,
    settings,
    contact,
    about
  ];
}
