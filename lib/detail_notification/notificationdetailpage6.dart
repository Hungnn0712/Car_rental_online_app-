import 'package:flutter/material.dart';

class NotificationDetailPage6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chu du xuyên Việt giải nhiệt mùa hè'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/suport/notificationpage6.jpg', // Replace with your image asset path
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover, // Adjust as necessary
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '🚗 ĐẶT XE HÔM NAY ĐỂ NHẬN ƯU ĐÃI 100K, DU HÈ THẢNH THƠI KHÔNG NGHĨ NGỢI!',
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
              '"Chớ âu lo để làm gì. Hè về là ta phải đi thôi!"                       ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '🌴 Hè này bạn sẽ cùng gia đình hay cùng hội bạn của mình chu du khắp mọi miền, khám phá núi rừng hay đón bình minh bên bờ biển?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '🚘 Di chuyển tiết kiệm, thoải mái trải nghiệm muôn nơi. Dù đi đến đâu, Mioto vẫn luôn đồng hành cùng bạn trên mọi cung đường. ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '🎊 Nhập mã CHAOHE - nhận ngay ưu đãi 100k, áp dụng cho chuyến đi ngày 14/06 - 30/06/2024, và đặt cọc sớm ngày 12/06/2024.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '☀️Chu du xuyên Việt, giải nhiệt mùa hè, đặt xe ngay!               ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
