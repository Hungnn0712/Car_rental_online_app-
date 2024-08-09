import 'package:flutter/cupertino.dart';

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text(title,
            style: const TextStyle( fontSize: 30),)
    );
  }
}
