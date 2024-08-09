import 'package:flutter/material.dart';

class NotificationDetailPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7 chỗ rộng thinh, du hè cùng gia đình'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/suport/notificationpage3.jpg', // Replace with your image asset path
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover, // Adjust as necessary
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '🎁 ƯU ĐÃI 120K CHO LẦN ĐẦU THUÊ XE 7 CHỖ TẠI MIOTO',
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
              '🔎 Thuê xe nào cho gia đình du hè thoải mái suốt đường dài?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '🚗 Chọn ngay xe 7 chỗ với thiết kế rộng rãi, gia đình đông người đi đâu cũng tiện. Động cơ êm ái, thoải mái du hè muôn nơi. Xe to cốp rộng, chẳng ngại hành lý cồng kềnh.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '💥 Đặc biệt, Mioto giảm ngay 120K cho lần đầu thuê xe 7 chỗ trên ứng dụng, áp dụng đến hết ngày 30/06/2024',
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
