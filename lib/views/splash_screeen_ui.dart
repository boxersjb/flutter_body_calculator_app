// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'home_ui.dart';

class SplashScreeenUi extends StatefulWidget {
  const SplashScreeenUi({super.key});

  @override
  State<SplashScreeenUi> createState() => _SplashScreeenUiState();
}

class _SplashScreeenUiState extends State<SplashScreeenUi> {
  @override
  void initState() {
    // หน่วงเลาลาหน้าจอ3วินาทีแล้วไปหน้าhomeUI แบบย้อนกลับไม่ได้
    Future.delayed(
      //เวลาที่หน่วง
      Duration(seconds: 3),
      //ฟังก์ชันที่ทำงานหลังจากหน่วง
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
            //เปิดหน้าhomeUI
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 130,
              width: 130,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Body health calculator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '2026 All rights reserved',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            Text(
              'Created by: Boxers',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
