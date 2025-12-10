import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/product.dart';
import 'package:flutter_application_1/MyProduct/api.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách sản phẩm")),
      body: FutureBuilder(
        future: test_api.getAllProduct(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) return const Text("Lỗi tải dữ liệu");

          return myListView(snap.data!);
        },
      ),
    );
  }

  // RESPONSIVE GRID
  Widget myListView(List<Product> products) {
    double width = MediaQuery.of(context).size.width;

    // responsive số cột
    int crossAxisCount = width > 1200
        ? 5
        : width > 900
        ? 4
        : width > 600
        ? 3
        : 2;

    // responsive tỷ lệ item
    double childAspectRatio = width > 1200
        ? 0.85
        : width > 900
        ? 0.80
        : width > 700
        ? 0.75
        : 0.70;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
      children: products.map((p) => myItem(p)).toList(),
    );
  }

  // ITEM SẢN PHẨM
  Widget myItem(Product p) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.blue.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.1),

      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Column(
          children: [
            // ẢNH
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  p.image,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // TEXT / PRICE / RATING
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // title
                    Text(
                      p.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    // price
                    Text(
                      "${p.price} \$",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    // rating
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text("${p.rating.rate} (${p.rating.count})"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
