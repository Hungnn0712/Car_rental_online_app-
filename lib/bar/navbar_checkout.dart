import 'package:app_car_rental/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const/color.dart';

class NavbarCheckout extends StatelessWidget {
  String? proId;
  String? userId;
  DateTime? receiveDay;
  DateTime? returnDay;
  NavbarCheckout(
  {
    required this.proId,
    required this.userId,
    required this.receiveDay,
    required this.returnDay,
  });
  void saveOrder(BuildContext context) async {
    final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

    // Tăng mã hóa đơn tự động
    DataSnapshot snapshot = await _databaseReference.child('Order_counter').get();
    int currentCounter = (snapshot.value ?? 0) as int;

    // Tăng giá trị của order_counter
    int newOrderId = currentCounter + 1;

    // Cập nhật giá trị mới của order_counter
    await _databaseReference.child('Order_counter').set(newOrderId);

    // Lưu thông tin đơn hàng với mã hóa đơn mới
    await _databaseReference.child("Orders").child(newOrderId.toString()).set({
      'orderId': newOrderId,
      'proId': proId,
      'uid': userId,
      'receiveDay': DateFormat('yyyy-MM-dd').format(receiveDay!),
      'returnDay': DateFormat('yyyy-MM-dd').format(returnDay!),
      'orderDate': DateFormat('yyyy-MM-dd').format(DateTime.now())
    });

    // Hiển thị thông báo thành công
    showDialog(
        context: context,
        builder: (BuildContext context) {
           return AlertDialog(
            title: Center(
                child: const Text(
                  'Thông báo',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                )),
            content: const Text(
              'Bạn đã gữi yêu cầu thuê thành công',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Center(
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Color(dart_green),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                          'OK',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
    print('Hóa đơn đã được lưu với mã hóa đơn $newOrderId');
  }
  Future<bool> isPhoneNumberVerified() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final DatabaseReference reference = FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(_auth.currentUser!.uid);
    try {
      // Lấy dữ liệu người dùng từ Realtime Database
      DatabaseEvent event = await reference.once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.exists) {
        // Kiểm tra trường phoneNumberVerified trong dữ liệu người dùng
        Map<String, dynamic>? userData =
            Map<String, dynamic>.from(snapshot.value as Map);
        if (userData['phoneNumberVerified'] == '1') {
          return true;
        } else if (userData['phoneNumberVerified'] == '0') {
          return false;
        } else {
          return false;
        }
      } else {
        print('Không tìm thấy dữ liệu người dùng');
        return false;
      }
    } catch (e) {
      print('Lỗi khi kiểm tra xác minh số điện thoại: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(
                    'assets/images/check.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: const TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Tôi đồng ý với ',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      TextSpan(
                          text: 'chính sách hủy chuyến của Mioto',
                          style: TextStyle(
                              color: Color(dart_green),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: ElevatedButton(
              onPressed: () async {
                bool isVerified = await isPhoneNumberVerified();
                if (isVerified) {
                  saveOrder(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Thông báo'),
                        content: Text(
                            'Vui lòng xác minh số điện thoại trước khi yêu cầu thuê xe.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Đồng ý'),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                          ),
                          TextButton(
                            child: Text('Đóng'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 20),
                backgroundColor: Color(dart_green),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Gữi yêu cầu thuê xe",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
