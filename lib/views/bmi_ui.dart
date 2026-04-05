// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //text field controller
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  //dispose controller
  String bmiResult = '0.00';
  String bmiResultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 50),
          child: Center(
            child: Column(
              children: [
                
                Text(
                  'คำนวนาค่าดัชนี้ร่างกาย BMI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset('assets/images/bmi.png', width: 100, height: 100),
                SizedBox(height: 20),

                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก(KG.)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกน้ำหนัก',
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง(CM.)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกส่วนสูง',
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //Validate input
                    if (weightController.text.isEmpty ||
                        heightController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกน้ำหนักและส่วนสูง'),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    //Calculate BMI
                    double weight = double.parse(weightController.text);
                    double height = double.parse(heightController.text) / 100;
                    double bmi = weight / (height * height);
                    setState(() {
                      bmiResult = bmi.toStringAsFixed(2);
                      if (bmi < 18.5) {
                        bmiResultText = 'น้ำหนักน้อยเกินไป';
                      } else if (bmi >= 18.5 && bmi < 25) {
                        bmiResultText = 'น้ำหนักปกติ';
                      } else if (bmi >= 25 && bmi < 30) {
                        bmiResultText = 'น้ำหนักเกิน';
                      } else {
                        bmiResultText = 'โรคอ้วน';
                      }
                    });
                  },
                  child: Text(
                    'คำนวน BMI',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    fixedSize: Size(MediaQuery.of(context).size.width,50),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //Clear input
                    weightController.clear();
                    heightController.clear();
                    setState(() {
                      bmiResult = '0.00';
                      bmiResultText = '';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text('BMI:'),
                      Text(bmiResult,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(bmiResultText),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
