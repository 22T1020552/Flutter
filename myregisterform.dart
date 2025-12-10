import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form Đăng ký tài khoản",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Họ tên
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Họ tên",
                      prefixIcon: const Icon(Icons.person),
                      helperText: _nameController.text.isEmpty
                          ? "Vui lòng nhập họ tên"
                          : null, // Ẩn khi người dùng đã nhập
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {}); // cập nhật helperText
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Họ tên không được để trống";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  //Email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      helperText: _emailController.text.isEmpty
                          ? "Vui lòng nhập email"
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email không được để trống";
                      }

                      final gmailReg = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@gmail\.com$",
                      );
                      if (!gmailReg.hasMatch(value)) {
                        return "Email phải có dạng @gmail.com";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  //Mật Khẩu
                  TextFormField(
                    controller: _passController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      prefixIcon: const Icon(Icons.lock),
                      helperText: _passController.text.isEmpty
                          ? "Vui lòng nhập mật khẩu"
                          : null,
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
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Mật khẩu không được để trống";
                      }
                      if (value.length < 6) {
                        return "Mật khẩu phải từ 6 ký tự trở lên";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Xác nhận mật khẩu
                  TextFormField(
                    controller: _confirmPassController,
                    obscureText: !_showConfirmPassword,
                    decoration: InputDecoration(
                      labelText: "Xác nhận mật khẩu",
                      prefixIcon: const Icon(Icons.lock_outline),
                      helperText: _confirmPassController.text.isEmpty
                          ? "Vui lòng xác nhận mật khẩu"
                          : null,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showConfirmPassword = !_showConfirmPassword;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập lại mật khẩu";
                      }
                      if (value != _passController.text) {
                        return "Mật khẩu không khớp";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // NÚT ĐĂNG KÝ
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.person_add),
                      label: const Text(
                        "Đăng ký",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, //  🔵 ĐỔI MÀU NỀN TẠI ĐÂY
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Đăng ký thành công")),
                          );
                        }
                      },
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
