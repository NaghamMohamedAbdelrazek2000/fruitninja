import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trackorder extends StatelessWidget {
  const Trackorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/Maps Image.png'),
          ],
        ),
      ),
    );
  }
}
