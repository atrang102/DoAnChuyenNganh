import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      'storeName': '3TL SPORTS',
      'productName': 'Bóng rổ Spalding',
      'size': 'Size 7',
      'material': 'Da tổng hợp',
      'originalPrice': 1200000,
      'discountPrice': 890000,
      'totalPrice': 890000,
    },
    {
      'storeName': 'SLAM DUNK SHOP',
      'productName': 'Bóng rổ Molten',
      'size': 'Size 6',
      'material': 'Cao su tự nhiên',
      'originalPrice': 900000,
      'discountPrice': 750000,
      'totalPrice': 750000,
    },
    {
      'storeName': 'BASKETBALL PRO',
      'productName': 'Bóng rổ Wilson Evolution',
      'size': 'Size 7',
      'material': 'Da microfiber',
      'originalPrice': 1500000,
      'discountPrice': 1200000,
      'totalPrice': 1200000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Header
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF5E3023),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Lịch Sử Đặt Hàng',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Danh sách các đơn hàng gần đây',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailScreen(order: order),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['storeName'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            order['productName'],
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text('Kích thước: ${order['size']}'),
                          Text('Chất liệu: ${order['material']}'),
                          const SizedBox(height: 8),
                          Text(
                            'Giá gốc: ${order['originalPrice']} ₫',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          Text('Giá giảm: ${order['discountPrice']} ₫'),
                          const SizedBox(height: 8),
                          Text(
                            'Tổng tiền: ${order['totalPrice']} ₫',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(order['storeName']),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sản phẩm: ${order['productName']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Kích thước: ${order['size']}'),
            Text('Chất liệu: ${order['material']}'),
            const SizedBox(height: 16),
            Text(
              'Giá gốc: ${order['originalPrice']} ₫',
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
            Text('Giá giảm: ${order['discountPrice']} ₫'),
            const SizedBox(height: 16),
            Text(
              'Tổng tiền: ${order['totalPrice']} ₫',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
