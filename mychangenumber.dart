import 'package:flutter/material.dart';

class MyChangeNumber extends StatefulWidget {
  MyChangeNumber({super.key});

  @override
  State<MyChangeNumber> createState() => _MyChangeNumberState();
}

class _MyChangeNumberState extends State<MyChangeNumber> {
  int number = 0;
  void _Tang() {
    setState(() {
      number++;
    });
  }

  void _datlai() {
    setState(() {
      number = 0;
    });
  }

  void _Giam() {
    setState(() {
      number--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Ứng dụng đếm số"),
        centerTitle: true,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Giá trị hiện tại:"),
          Text(
            number.toString(),
            style: TextStyle(fontSize: 50, color: Colors.red),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _Giam,
                    icon: const Icon(Icons.remove),
                    label: const Text("Giảm"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Màu nền nút Giảm
                      foregroundColor: Colors.white, // Màu chữ + icon
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: _datlai,
                icon: const Icon(Icons.refresh),
                label: const Text("Đặt lại"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey, // Màu nền nút Đặt lại
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: _Tang,
                icon: const Icon(Icons.add),
                label: const Text("Tăng"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Màu nền nút Tăng
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
