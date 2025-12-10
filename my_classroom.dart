import 'dart:math';

import 'package:flutter/material.dart';

class MyClassroom1 extends StatelessWidget {
  const MyClassroom1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(5, (index) => itemClassroom()),
    );
  }

  Widget itemClassroom() {
    final Color randomColor = Color(
      (Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withOpacity(1.0);

    return Container(
      margin: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: randomColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [leftChild(), rightChild()],
      ),
    );
  }

  Widget rightChild() {
    return IconButton(
      onPressed: () {
        print("Hello");
      },
      icon: Icon(Icons.more_horiz),
    );
  }

  Widget leftChild() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("XML và ứng dụng - Nhóm 1"),
            Text("2025-2025.1.TIN4583.001"),
          ],
        ),
        Text("58 học viên"),
      ],
    );
  }
}
