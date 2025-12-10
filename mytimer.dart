import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({super.key});

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  final TextEditingController _controller =
      TextEditingController(); //nhận dữ liệu nhập số giây
  Timer? _timer; //đếm số giây
  int _secondsRemaining = 0; //số giây còn lại
  bool _isRunning = false; //Kiểm tra xem timer có đang chạy hay không

  //Kiểm tra xem timer có đang chạy hay không
  void _startTimer() {
    if (_isRunning) return;
    final input = int.tryParse(_controller.text);
    if (input == null || input <= 0) {
      //xử lý dữ liệu nhập vào
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập số giây hợp lệ!')),
      );
      return;
    }

    //Gán giá trị ban đầu và bắt đầu timer
    setState(() {
      _secondsRemaining = input;
      _isRunning = true;
    });

    //Gọi Timer.periodic để đếm ngược:
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
        _showTimeUpDialog();
      }
    });
  }

  //Dừng timer và làm mới dữ liệu, xóa ô nhập.
  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _secondsRemaining = 0;
      _controller.clear();
    });
  }

  //Khi đếm xong, hiện một hộp thoại thông báo.
  void _showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('⏰ Hết thời gian!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  //Hàm định dạng thời gian
  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  //Dọn dẹp tài nguyên khi widget bị hủy (để tránh rò bộ nhớ).
  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Bộ đếm thời gian"),
        centerTitle: true,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nhập số giây cần đếm:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ví dụ: 10',
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _formatTime(_secondsRemaining),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: const Text('Bắt đầu'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _resetTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: const Text('Đặt lại'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
