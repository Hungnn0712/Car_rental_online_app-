import 'package:flutter/material.dart';

class NotificationDetailPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vui vẻ hứng khởi, tự lái muôn nơi'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/suport/notificationpage2.jpg', // Replace with your image asset path
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover, // Adjust as necessary
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '🚗 DU LỊCH GIẢI NHIỆT MÙA HÈ - NHẬN NGAY ƯU ĐÃI 8%',
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
              '🎁 Quốc tế Thiếu nhi nhưng người lớn có quà!               ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '🚗 Mở Mioto chọn ngay dòng xe ưng ý, nhận liền ưu đã đúng ý - nhập mã HESANG, giảm 8% (tối đa 80k) khi thuê xe, áp dụng đến ngày 30/06/2024.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Nghỉ hè thảnh thơi đưa nhau khám phá muôn nơi, gia đình mình nhân đôi niềm vui!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '📲 Thuê xe vi vu ngay!                                                           ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
