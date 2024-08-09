import 'package:app_car_rental/screen/detail_product.dart';
import 'package:app_car_rental/screen/home_page.dart';
import 'package:app_car_rental/screen/main_page.dart';
import 'package:app_car_rental/screen/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../const/authentication.dart';

class Loginpage extends StatefulWidget {
  final String? fromPage;
  final String? proId;
  const Loginpage({required this.fromPage, required this.proId});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethod
    String res = await AuthMethod().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      //navigate to the home screen
      if (widget.fromPage != null && widget.proId != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DetailProduct(proId: widget.proId!),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      // show error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Icon(FontAwesomeIcons.angleLeft)
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 85, top: 32),
                  height: 100,
                  width: 160,
                  child: const Center(
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Email',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF686D76)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: TextFormField(
                  obscureText: false,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Nhập địa chỉ email",
                    labelStyle:
                        TextStyle(color: Color(0xFF686D76), fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Mật khẩu',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF686D76)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Nhập mật khẩu",
                    labelStyle:
                        TextStyle(color: Color(0xFF686D76), fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Quên mật khẩu',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Container(
                    height: 65,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/googlelogo1.png', // Đường dẫn tới hình ảnh trong thư mục assets
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Container(
                    height: 65,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/fblogo.png', // Đường dẫn tới hình ảnh trong thư mục assets
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registerpage()));
                },
                child: RichText(
                    text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Bạn chưa là thành viên ?',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  TextSpan(
                      text: ' Hãy đăng ký ngay',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ]))),
            const SizedBox(
              height: 290,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5fcf86),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150.0, vertical: 10.0),
                  ),
                  onPressed: () {
                    loginUser();
                  },
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
