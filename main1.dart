import 'package:flutter/material.dart';

// Giữ nguyên các import của bạn
import '../myplace.dart';
import '../travel_booking/travel.dart';
import '../StatefullWidget/mytimer.dart';
import '../StatefullWidget/myregisterform.dart';
import '../StatefullWidget/myloginform.dart';
import '../StatefullWidget/mychangenumber.dart';
import '../StatefullWidget/mychangecolorapp.dart';
import '../screens_login/login_screen1.dart';
import '../routing/my_product.dart';
import '../classroom/my_classroom.dart';
import '../hotel/hotel_list_screen.dart';
import '../MyProduct/my_product.dart' as MyProductApp;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: MaterialApp(
        title: 'Danh sách bài tập Flutter Nhóm 6',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // Thêm chút cấu hình font hoặc màu nền chung nếu cần
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final int initialSelectedIndex;
  const HomePage({super.key, this.initialSelectedIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  // Danh sách các widget
  final List<Widget> _pages = [
    Myplace(),
    MyTravel(),
    MyTimer(),
    RegisterForm(),
    LoginForm(),
    MyChangeNumber(),
    MyChangeColorApp(),
    LoginScreen(),
    MyProduct(),
    MyClassroom1(),
    HotelListScreen(),
    MyProductApp.MyProduct(),
  ];

  // Tiêu đề ứng với từng page
  final List<String> _titles = [
    "MyPlace",
    "MyTravel",
    "MyTimer",
    "Register Form",
    "Login Form",
    "Change Number",
    "Change Color",
    "Login Screen UI",
    "My Product",
    "My Classroom",
    "Hotel List",
    "Product App Final",
  ];

  // Danh sách Icon tương ứng để giao diện đẹp hơn
  final List<IconData> _icons = [
    Icons.place_outlined, // MyPlace
    Icons.travel_explore, // MyTravel
    Icons.timer_outlined, // MyTimer
    Icons.app_registration, // RegisterForm
    Icons.login, // LoginForm
    Icons.format_list_numbered, // MyChangeNumber
    Icons.color_lens_outlined, // MyChangeColorApp
    Icons.lock_outline, // LoginScreen
    Icons.shopping_bag_outlined, // MyProduct
    Icons.school_outlined, // MyClassroom1
    Icons.hotel_outlined, // HotelListScreen
    Icons.shopping_cart_outlined, // MyProduct1
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  void _selectIndex(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop(); // Đóng drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      // --- PHẦN DRAWER ĐƯỢC THIẾT KẾ LẠI ---
      drawer: Drawer(
        child: Column(
          children: [
            // 1. Custom Header
            _buildCustomDrawerHeader(),

            // 2. List Items với BoxShadow
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                itemCount: _titles.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10), // Khoảng cách giữa các item
                itemBuilder: (context, index) {
                  bool isSelected = index == _selectedIndex;
                  return _buildStyledListTile(index, isSelected);
                },
              ),
            ),

            const Divider(),

            // Nút Về đầu
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home, color: Colors.redAccent),
                  title: const Text(
                    'Về trang chủ',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => _selectIndex(0),
                ),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
    );
  }

  // Widget tách riêng cho Header để code gọn gàng
  Widget _buildCustomDrawerHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2196F3),
            Color(0xFF64B5F6),
          ], // Màu xanh gradient hiện đại
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 40, color: Colors.white),
              // Nếu muốn dùng ảnh thật: backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ),
          const SizedBox(height: 15),

          // Tên
          const Text(
            'Văn Công Bút',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 5),

          // MSV & Lớp (Dùng Row hoặc Column tùy ý thích, ở đây dùng Column cho gọn)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'MSV: 22T1020552',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Lớp: Lập trình di động Nhóm 6',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  // Widget tách riêng cho từng Item trong list
  Widget _buildStyledListTile(int index, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.blueAccent
            : Colors.white, // Đổi màu nền nếu được chọn
        borderRadius: BorderRadius.circular(12), // Bo góc
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Màu bóng
            spreadRadius: 1,
            blurRadius: 5, // Độ mờ của bóng
            offset: const Offset(0, 3), // Hướng bóng đổ xuống dưới
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          _icons.length > index
              ? _icons[index]
              : Icons.circle, // Lấy icon từ list
          color: isSelected ? Colors.white : Colors.blueAccent, // Đổi màu icon
        ),
        title: Text(
          _titles[index],
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87, // Đổi màu chữ
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: isSelected
            ? const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.white70,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () => _selectIndex(index),
      ),
    );
  }
}
