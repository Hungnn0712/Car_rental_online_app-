import 'package:flutter/material.dart';

class NotificationDetailPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ford - Trải nghiệm vượt bậc, nâng tầm chuyến đi'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/suport/notificationpage1.jpg', // Replace with your image asset path
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover, // Adjust as necessary
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '🎁 TIẾT KIỆM 10% KHI TRẢI NGHIỆM MẪU XE FORD TẠI MIOTO',
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
              '🚗 Với thiết kế mạnh mẽ, đi kèm với động cơ vượt trội, trang thiết bị tân tiến hiện đại cùng nhiều ưu điểm nổi bật khác, những mẫu xe Ford đã được nhiều khách hàng ưu ái và lựa chọn tin dùng tại thị trường Việt Nam.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '🌟 Mở Mioto, trải nghiệm ngay những mẫu xe Ford đời mới và chất lượng. Nhập ngay mã FORD - giảm 10% (tối đa 100K) khi thuê xe Ford tại Mioto. Ưu đãi đến hết ngày 09/06/2024.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '📲 Mở app đặt xe, nhận ngay ưu đãi!                                 ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
