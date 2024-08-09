import 'package:flutter/material.dart';

class NotificationDetailPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ngại chi nắng mưa - Mioto đón đưa'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/suport/notificationpage4.jpg', // Replace with your image asset path
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover, // Adjust as necessary
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '🎉Nhập mã MI06 - ưu đãi 10% khi thuê xe có tài tại Mioto',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 50, right: 50, top: 4),
            child: const Divider(
              color: Colors.green,
              height: 20,
              thickness: 3,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '🌦 Dù nắng dù mưa vẫn có Mioto đón đưa. Với dịch vụ thuê xe có tải tiện lợi, nhanh chóng cùng thủ tục đơn giản. Bạn chỉ cần mở app đặt xe, có Mioto đón ngay🚗',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '💥 Nhập mã MI06 - giảm ngay 10%(tối đa 100K) chi phí khi thuê xe có tải tại Mioto. Ưu đãi được áp dụng đến hết 30/06/2024',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '📲 Nhà bao nhiêu người, Mioto cũng chiều đúng ý, thuê xe ngay!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
