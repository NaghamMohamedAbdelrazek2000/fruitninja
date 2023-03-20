import 'package:flutter/material.dart';

class SetLocationOnMap extends StatelessWidget {
  const SetLocationOnMap({Key? key}) : super(key: key);

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
