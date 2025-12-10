import 'dart:convert'; // Dùng để encode/decode JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import thư viện http

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  // Controller để lấy dữ liệu từ ô nhập
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _showPassword = false;
  bool _isLoading = false; // Biến trạng thái để hiện vòng loading

  // --- HÀM XỬ LÝ LOGIN ---
  Future<void> _handleLogin() async {
    // 1. Validate form trước khi gửi
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 2. Bắt đầu loading, ẩn bàn phím
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();

    // TODO: Thay đổi URL API thật của bạn ở đây
    final url = Uri.parse('https://dummyjson.com/auth/login');

    try {
      // 3. Gọi API
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _userController.text,
          'password': _passController.text,
        }),
      );

      // Kiểm tra nếu widget đã bị hủy thì dừng lại (tránh lỗi setState)
      if (!mounted) return;

      // 4. Xử lý kết quả
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Đăng nhập thành công! Token: ${data['token']}"),
            backgroundColor: Colors.green,
          ),
        );

        // Chuyển màn hình ở đây:
        // Navigator.pushReplacement(...)
      } else {
        final errorData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Lỗi: ${errorData['error'] ?? 'Đăng nhập thất bại'}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lỗi kết nối: $e"), backgroundColor: Colors.red),
      );
    } finally {
      // 5. Tắt loading dù thành công hay thất bại
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Đăng nhập"), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TÊN NGƯỜI DÙNG
                  TextFormField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      labelText: "Tên người dùng",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập tên người dùng";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // MẬT KHẨU
                  TextFormField(
                    controller: _passController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập mật khẩu";
                      }
                      if (value.length < 6) {
                        return "Mật khẩu phải từ 6 ký tự trở lên";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  // NÚT ĐĂNG NHẬP HOẶC LOADING
                  SizedBox(
                    width: double.infinity,
                    height:
                        50, // Cố định chiều cao để nút không bị nhảy kích thước
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          ) // Hiện loading
                        : ElevatedButton.icon(
                            icon: const Icon(Icons.login),
                            label: const Text("Đăng nhập"),
                            onPressed: _handleLogin, // Gọi hàm xử lý login
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
