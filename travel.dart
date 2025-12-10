//import 'dart:math';

import 'package:flutter/material.dart';

class MyTravel extends StatelessWidget {
  const MyTravel({super.key});
  static const List<String> imagePaths = [
    'assets/anh/NDM03541.JPG',
    'assets/anh/NDM03544.JPG',
    'assets/anh/NDM03554.jpg',
    'assets/anh/NDM03706.JPG',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thanh trên cùng
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 28),
                  Row(
                    children: [
                      Icon(Icons.notifications_none, size: 28),
                      SizedBox(width: 15),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Welcome text
              Text(
                'Welcome,',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'Charlie',
                style: TextStyle(fontSize: 28, color: Colors.grey[700]),
              ),

              SizedBox(height: 25),

              // Ô tìm kiếm
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Tiêu đề "Saved Places"
              Text(
                'Saved Places',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 15),

              // Grid ảnh
              Expanded(
                child: GridView.builder(
                  itemCount: imagePaths.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(imagePaths[index], fit: BoxFit.cover),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
