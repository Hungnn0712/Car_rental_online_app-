import 'package:app_car_rental/const/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orderhistory extends StatefulWidget {
  const Orderhistory({super.key});

  @override
  State<Orderhistory> createState() => _OrderhistoryState();
}

class _OrderhistoryState extends State<Orderhistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0 , top:25.0),
                    child: IconButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                        iconSize: 40,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 45.0 , top:32.0),
                    child: Text('Chi tiết thuê xe' , style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  color: Color(light_green),
                  borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Text('Thông tin khách hàng' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 4),
                      child: const Divider(
                        color: Colors.black,
                        height: 5,
                        thickness: 2,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/user_avatar.png'),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 32.0),
                          child: Text('Nguyễn Thành Hưng' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.phone , color: Color(0xFF41B06E),),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('0975585806', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Color(0xFF41B06E),),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Quận Thủ Đức, TPHCM', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0 , right: 16.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                    color: Color(light_green),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Text('Chi tiết hoá đơn' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 4),
                      child: const Divider(
                        color: Colors.black,
                        height: 5,
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0 ),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/car3.jpg'),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text('Tên Xe (Ford Ranger 2024' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        width: double.infinity,
                        height: 110,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Ngày nhận' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                                Padding(
                                  padding: EdgeInsets.only(left: 127.0),
                                  child: Text('01/01/2024' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined, ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Ngày trả' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                                Padding(
                                  padding: EdgeInsets.only(left: 150.0),
                                  child: Text('01/01/2024' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Trạng thái' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                                Padding(
                                  padding: EdgeInsets.only(left: 180.0),
                                  child: Text('Đang thuê' , style: TextStyle(fontSize: 20,color: Color(dart_green), fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                      child: const Divider(
                        color: Colors.black,
                        height: 5,
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text('Đơn giá thuê' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                                Padding(
                                  padding: EdgeInsets.only(left: 108.0),
                                  child: Text('1.000.000 VNĐ' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Tổng cộng' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                                Padding(
                                  padding: EdgeInsets.only(left: 45.0),
                                  child: Text('1.000.000 VNĐ x 3 ngày' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                      child: const Divider(
                        color: Colors.black,
                        height: 5,
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Thành tiền' , style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                          Padding(
                            padding: EdgeInsets.only(left: 130.0),
                            child: Text('3.000.000 VNĐ' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
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
