import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/productR.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text(product.title), elevation: 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- ẢNH SẢN PHẨM ---
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Image.network(
                    product.thumbnail,
                    width: double.infinity, // <-- mở rộng tối đa chiều rộng
                    height: 320, // <-- tăng chiều cao ảnh nếu muốn
                    fit: BoxFit.contain, // giữ nguyên tỷ lệ ảnh
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// --- TIÊU ĐỀ ---
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            /// --- MÔ TẢ ---
            Text(
              product.description,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),

            SizedBox(height: 20),

            /// --- THÔNG TIN GIÁ ---
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Giá:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${product.price} \$",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Giảm giá:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${product.discountPercentage}%",
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            /// --- ĐÁNH GIÁ ---
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 28),
                SizedBox(width: 8),
                Text(
                  "${product.rating}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
