import 'package:flutter/material.dart';

class NotificationDetailPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Di chuyển tiện nghi cùng Honda City'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/suport/notificationpage5.jpg', // Replace with your image asset path
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover, // Adjust as necessary
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '🎁 TIẾT KIỆM 10% CÙNG MÃ CITY KHI THUÊ XE HONDA CITY TẠI MIOTO',
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
              '🌟 Nổi bật với ngoại thất trẻ trung với thiết kế thể thao cùng dàn trang thiết bị hiện đại, Honda City luôn là  dòng xe chiếm ưu thế nhất trong phân khúc sedan hạng B.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '🚗 Với vận hành mượt mà và động cơ chắc chắn, dù di chuyển nội thành hay vùng ngoại ô, Honda City đều đáp ứng.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '💥 Trải nghiệm Honda City - nhận ngay ưu đãi  10% (tối đa 100K) khi nhập mã CITY. Ưu đãi áp dụng đến hết ngày 16/06/2024.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '📲 Ưu đãi đã có, đặt xe trải nghiệm ngay!                                ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
