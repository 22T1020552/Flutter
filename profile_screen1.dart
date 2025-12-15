import 'package:flutter/material.dart';
import 'package:flutter_application_1/Kiemtra1/main1.dart';
import 'package:flutter_application_1/Model/user_model.dart';
// import 'login_screen1.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        title: const Text("Hồ sơ"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Avatar + tên
          CircleAvatar(radius: 60, backgroundImage: NetworkImage(user.image)),
          const SizedBox(height: 10),

          Text(
            user.fullName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          Text("@${user.username}", style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 25),

          // Card thông tin
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _infoTile(Icons.email, "Email", user.email),
                _infoTile(Icons.person, "Giới tính", user.gender),
                _infoTile(Icons.tag, "ID người dùng", user.id.toString()),
              ],
            ),
          ),

          // Nút đăng xuất
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Đăng xuất", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(initialSelectedIndex: 7),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
