import 'package:flutter/material.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF0057B8),
        title: const Text(
          "Xung quanh vị trí hiện tại",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.wifi, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFFFF3E0),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: const [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 8),
                Text(
                  "23 thg 10 – 24 thg 10",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTopButton(Icons.sort, "Sắp xếp"),
                _buildTopButton(Icons.filter_list, "Lọc"),
                _buildTopButton(Icons.map, "Bản đồ"),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                HotelCard(
                  name: "aNhill Boutique",
                  rating: 9.5,
                  reviewText: "Xuất sắc",
                  reviewCount: 95,
                  distance: "0,6km",
                  location: "Huế",
                  imagePath: "assets/anh/anhill.jpg",
                  price: 109,
                  roomInfo: "1 suite riêng tư: 1 giường",
                  includeBreakfast: true,
                  note: "Đã bao gồm thuế và phí",
                ),
                HotelCard(
                  name: "An Nam Hue Boutique",
                  rating: 9.2,
                  reviewText: "Tuyệt hảo",
                  reviewCount: 34,
                  distance: "0,9km",
                  location: "Cư Chinh",
                  imagePath: "assets/anh/annam.jpg",
                  price: 20,
                  roomInfo: "1 phòng khách sạn: 1 giường",
                  includeBreakfast: true,
                  note: "Đã bao gồm thuế và phí",
                ),
                HotelCard(
                  name: "Huế Jade Hill Villa",
                  rating: 8.0,
                  reviewText: "Rất tốt",
                  reviewCount: 1,
                  distance: "1,3km",
                  location: "Cư Chinh",
                  imagePath: "assets/anh/jadehill.jpg",
                  price: 285,
                  roomInfo:
                      "1 biệt thự nguyên căn - 1.000 m²: 4 giường • 3 phòng ngủ • 1 phòng khách • 3 phòng tắm",
                  includeBreakfast: false,
                  hostLabel: "Được quản lý bởi một host cá nhân",
                  bookingNote: "Chỉ còn 1 căn với giá này trên Booking.com!",
                  payLater: "Không cần thanh toán trước",
                  note: "Đã bao gồm thuế và phí",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildTopButton(IconData icon, String text) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black87, size: 20),
      label: Text(text, style: const TextStyle(color: Colors.black87)),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String name;
  final double rating;
  final String reviewText;
  final int reviewCount;
  final String location;
  final String distance;
  final String imagePath;
  final double price;
  final String roomInfo;
  final String note;
  final bool includeBreakfast;
  final String? hostLabel;
  final String? bookingNote;
  final String? payLater;

  const HotelCard({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewText,
    required this.reviewCount,
    required this.location,
    required this.distance,
    required this.imagePath,
    required this.price,
    required this.roomInfo,
    required this.note,
    required this.includeBreakfast,
    this.hostLabel,
    this.bookingNote,
    this.payLater,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh khách sạn
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
              ),
              if (includeBreakfast)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: const Text(
                      "Bao bữa sáng",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),

          // Thông tin chi tiết
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bên trái: thông tin khách sạn
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      if (hostLabel != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            hostLabel!,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              rating.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "$reviewText · $reviewCount đánh giá",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            "$location · Cách bạn $distance",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        roomInfo,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      if (bookingNote != null) ...[
                        const SizedBox(height: 6),
                        Text(
                          bookingNote!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Bên phải: giá và ghi chú, đẩy xuống dưới cùng
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 100,
                      ), // đẩy phần này xuống dưới cùng
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "US\$${price.toStringAsFixed(0)}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              note,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            if (payLater != null) ...[
                              const SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Colors.black87,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    payLater!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
