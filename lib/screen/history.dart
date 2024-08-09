import 'dart:async';
import 'dart:ui';

import 'package:app_car_rental/const/color.dart';
import 'package:app_car_rental/screen/orderhistory.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class History extends StatefulWidget {
  String uid;
  History({super.key, required this.uid});
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DatabaseReference references = FirebaseDatabase.instance.ref().child('Orders');
  Query dbRef = FirebaseDatabase.instance.ref().child('Orders');
  @override
  void initState() {
    // TODO: implement initState
    dbRef = references.orderByChild('uid').equalTo('VASyEU2KqBc4QiyAYPRGruyMCOH2');
  }

  void updateQuery(String categoryId) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(grey),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Padding(
            padding: EdgeInsets.only(left: 120),
            child: Text(
              'Chuyến của tôi',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history, size: 35),
            onPressed: () {
              // Hành động khi nhấn biểu tượng tìm kiếm
            },
          ),
        ],
      ),
      body: FirebaseAnimatedList(
        scrollDirection: Axis.vertical,
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map orders = snapshot.value as Map;
          orders['key'] = snapshot.key;
          return ListItem(order: orders);
        },
      ),
    ));
  }
}

class ListItem extends StatefulWidget {
  final Map<dynamic, dynamic> order;
  const ListItem({required this.order});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  DatabaseReference ordersRef = FirebaseDatabase.instance.ref().child('Orders');
  DatabaseReference productsRef = FirebaseDatabase.instance.ref().child('Products');
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ordersRef.child(widget.order['orderId'].toString()).once(),
        builder: (context, orderSnapshot) {
          if (orderSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (orderSnapshot.hasError) {
            return Center(child: Text('Error: ${orderSnapshot.error}'));
          } else if (orderSnapshot.hasData &&
              orderSnapshot.data!.snapshot.value != null) {
            var orderData = Map<String, dynamic>.from(
                orderSnapshot.data!.snapshot.value as Map);
            String proId = orderData['proId'];
            return FutureBuilder(
                future: productsRef.orderByChild('id').equalTo(proId).once(),
                builder: (context, productSnapshot) {
                  if (productSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (productSnapshot.hasError) {
                    return Center(child: Text('Error: ${orderSnapshot.error}'));
                  } else if (productSnapshot.hasData &&
                      productSnapshot.data!.snapshot.value != null) {
                    var productData = Map<String, dynamic>.from(
                        productSnapshot.data!.snapshot.value as Map);
                    final ref =
                        storage.ref().child('Car/' + productData['img']);
                    return FutureBuilder<String>(
                        future: ref.getDownloadURL(),
                        builder: (context, urlSnapshot) {
                          if (urlSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (urlSnapshot.hasError) {
                            return Center(
                                child: Text('Error: ${urlSnapshot.error}'));
                          } else if (urlSnapshot.hasData) {
                            String imgUrl = urlSnapshot.data!;
                            return
                              Container(
                              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: Offset(0, 2),
                                      blurRadius: 10,
                                    ),
                                  ],
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: 1
                                  )
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    height: 180,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        image: DecorationImage(
                                            image: NetworkImage(imgUrl),
                                            fit: BoxFit.fitHeight
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 32.0,left: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(productData['name'].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: RichText(
                                            textAlign: TextAlign.end,
                                            text: const TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(text: 'Giá thuê: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black),),
                                                  TextSpan(text: '1200K', style: TextStyle(color: Color(dart_green), fontSize: 22, fontWeight: FontWeight.bold)),
                                                ]
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: RichText(
                                            textAlign: TextAlign.end,
                                            text: const TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(text: 'Trạng thái: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black),),
                                                  TextSpan(text: 'Đang hoạt động', style: TextStyle(color: Color(dart_green), fontSize: 16, fontWeight: FontWeight.bold)),
                                                ]
                                            ),
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: null,
                                          label: const Text('Hỗ trợ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black)),
                                          icon: const Icon(Icons.help_outline,),
                                        ),
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => Orderhistory()));
                                              },
                                              child: const Text('Xem chi tiết',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black,
                                                      decoration: TextDecoration.underline)
                                              ),
                                            ),
                                            Icon(Icons.navigate_next)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            );
                          } else {
                            return Center(child: Text('No image URL available'));
                          }
                        });
                  } else {
                    return Center(child: Text('No product data available'));
                  }
                });
          }else {
            return Center(child: Text('No order data available'));
          }
        });
  }
}
//
// FutureBuilder(
//   future: dbRef.once(),
//   builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
//     if (snapshot.hasData) {
//       if(snapshot.data!.snapshot.value != null) {
//         Map<String, dynamic> productData = Map<String, dynamic>.from(snapshot.data!.snapshot.value as Map);
//         final ref = storage.ref().child('Car/' + productData['img']);
//         return FutureBuilder(
//             future: ref.getDownloadURL(),
//             builder: (context, AsyncSnapshot<String> urlSnapshot) {
//               if (urlSnapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (urlSnapshot.hasError) {
//                 return Center(child: Text('Error: ${urlSnapshot.error}'));
//               } else if (urlSnapshot.hasData) {
//                 String imgUrl = urlSnapshot.data!;
//                 return Row(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 16),
//                       height: 180,
//                       width: 180,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18),
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/car4.jpg'),
//                               fit: BoxFit.fitHeight
//                           )
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 32.0,left: 8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(widget.order['orderId'].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child: RichText(
//                               textAlign: TextAlign.end,
//                               text: const TextSpan(
//                                   children: <TextSpan>[
//                                     TextSpan(text: 'Giá thuê: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black),),
//                                     TextSpan(text: '1200K', style: TextStyle(color: Color(dart_green), fontSize: 22, fontWeight: FontWeight.bold)),
//                                   ]
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child: RichText(
//                               textAlign: TextAlign.end,
//                               text: const TextSpan(
//                                   children: <TextSpan>[
//                                     TextSpan(text: 'Trạng thái: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black),),
//                                     TextSpan(text: 'Đang hoạt động', style: TextStyle(color: Color(dart_green), fontSize: 16, fontWeight: FontWeight.bold)),
//                                   ]
//                               ),
//                             ),
//                           ),
//                           TextButton.icon(
//                             onPressed: null,
//                             label: const Text('Hỗ trợ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black)),
//                             icon: const Icon(Icons.help_outline,),
//                           ),
//                           Row(
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => Orderhistory()));
//                                 },
//                                 child: const Text('Xem chi tiết',
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w400,
//                                         color: Colors.black,
//                                         decoration: TextDecoration.underline)
//                                 ),
//                               ),
//                               Icon(Icons.navigate_next)
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 );
//               }
//               else {
//                 return Center(child: Text('No image URL available'));
//               }
//             }
//         );
//       } else {
//         return Center(child: Text('No data available'));
//       }
//     }else if (snapshot.hasError) {
//       return Center(child: Text('Error: ${snapshot.error}'));
//     }else {
//       return Center(child: CircularProgressIndicator());
//     }
//   } ,
// ),
//
