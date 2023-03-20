import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Images extends StatelessWidget {
  const Images({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(image),width: 350.w,
    );
  }
}