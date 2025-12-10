import 'package:flutter/material.dart';

class Myplace extends StatelessWidget {
  const Myplace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(children: [block1(), block2(), block3(), block4()]);
  }

  Widget block1() {
    var src =
        "https://images.unsplash.com/photo-1559586616-361e18714958?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Image.network(src);
  }

  Widget block4() {
    var content =
        "Sahara là sa mạc lớn nhất trên Trái Đất, là hoang mạc lớn thứ 3 trên Trái Đất, với diện tích hơn 9.000.000 km², xấp xỉ diện tích của Hoa Kỳ và Trung Quốc. Sahara ở phía bắc châu Phi và có tới 2,5 triệu năm tuổi.";
    return Padding(padding: const EdgeInsets.all(20.0), child: Text(content));
  }

  Widget block2() {
    var title = "Hoang mạc Sahara";
    var subTitle = "Châu Phi";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(subTitle, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red),
              Text("41"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(Icons.call, color: Colors.blue),
            Text("CALL", style: TextStyle(color: Colors.blue)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.route, color: Colors.blue),
            Text("ROUTE", style: TextStyle(color: Colors.blue)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue),
            Text("SHARE", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ],
    );
  }
}
