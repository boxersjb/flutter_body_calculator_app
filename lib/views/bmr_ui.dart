// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  //text field controller
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  //dispose controller
  String bmrResult = '0.00';

  //gender
  String gender = 'ชาย';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 50, right: 30, bottom: 50),
          child: Center(
            child: Column(
              children: [
                
                Text(
                  'คำนวนาอัตราการเผาผลาญที่',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'ร่างกายต้องการ(BMR)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Image.asset('assets/images/bmr.png', width: 150, height: 150),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                Row(
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        //Set gender
                        setState(() { 
                          gender = 'ชาย';
                        });
                      },
                      child: Text(
                        'ชาย',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gender == 'ชาย' ? Colors.blue[300] : Colors.white,
                        fixedSize: Size(150, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                      ),
                    ),
                    
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        //Set gender
                        setState(() {
                          gender = 'หญิง';
                        });
                      },
                      child: Text(
                        'หญิง',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gender == 'หญิง' ? Colors.pink[300] : Colors.white,
                        fixedSize: Size(150, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก(KG.)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 10),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกส่วนสูง',
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ(ปี)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกอายุของคุณ',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //Valaidate input
                    if (weightController.text.isEmpty ||
                        heightController.text.isEmpty ||
                        ageController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกน้ำหนัก ส่วนสูง และอายุ'),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    //Calculate BMR
                    double weight = double.parse(weightController.text);
                    double height = double.parse(heightController.text);
                    double age = double.parse(ageController.text);
                    double bmr = 0;
                    if (gender == 'ชาย') {
                      bmr = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
                    } else {
                      bmr = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
                    }
                    setState(() {
                      bmrResult = bmr.toStringAsFixed(2);
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
                    ageController.clear();
                    setState(() {
                      bmrResult = '0.00';
                      gender = 'ชาย';
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
                //ส่วนแสดงผลข้อมูลที่ไดจากการคำนวน
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
                      Text('BMR:'),
                      Text(bmrResult,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text('Kcal/day'),
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
