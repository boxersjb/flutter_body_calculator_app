import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  'Body health calculator',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  'คำนวนาค่าดัชนี้ร่างกาย BMI',
                  style: TextStyle(fontSize: 16),
                ),

                Text(
                  'คำนวนาค่าดคลอรี่ที่ร่างดายต้องดารในแต่ละวัน BMR',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Logosau-02.png/250px-Logosau-02.png",
              height: 70,
              width: 70,
              fit: BoxFit.cover,
              ),
              Text('Develop by Boxers'
          ),
          SizedBox(height: 30),
          ],
          ),
          ),
        ],
      ),
    );
  }
}
