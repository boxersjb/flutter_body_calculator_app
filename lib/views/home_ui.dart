import 'package:flutter/material.dart';
import 'package:flutter_body_calculator_app/views/about_ui.dart';
import 'package:flutter_body_calculator_app/views/bmi_ui.dart';
import 'package:flutter_body_calculator_app/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int selectedIndex = 1;
  List subPage = [BmiUi(), AboutUi(), BmrUi()];

  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Body health calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      
      //ButtomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'BMI'),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'เกี่ยวกับเรา',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.personRunning),
            label: 'Settings',
          ),
        ],
      ),
      //body
      body: subPage[selectedIndex],
    );
  }
}
