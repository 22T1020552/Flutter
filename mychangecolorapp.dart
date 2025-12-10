import 'dart:math';

import 'package:flutter/material.dart';

class MyChangeColorApp extends StatefulWidget {
  MyChangeColorApp({super.key});

  @override
  State<MyChangeColorApp> createState() => _MyChangeColorAppState();
}

class _MyChangeColorAppState extends State<MyChangeColorApp> {
  Color bgColor = Colors.purple;
  String bgColorString = "Tím";
  List<Color> listColor = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
  ];

  List<String> listColorString = [
    "Do",
    "Vang",
    "Xanh la",
    "Xanh duong",
    "Tim",
    "Cam",
  ];
  void _changeColor() {
    var rand = Random();
    var i = rand.nextInt(listColor.length);
    setState(() {
      bgColor = listColor[i];
      bgColorString = listColorString[i];
    });
  }

  void _resetColor() {
    setState(() {
      bgColor = Colors.purple;
      bgColorString = "Tím";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("ứng dụng Đổi màu nền"),
        centerTitle: true,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Màu hiện tại",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Text(
            bgColorString,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _changeColor();
                    },
                    child: Text("Đổi màu"),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _resetColor();
                    },
                    child: Text("Đặt lại"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
