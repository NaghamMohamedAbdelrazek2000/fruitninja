import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key,
   this.onpressed,

  }) : super(key: key);
  Size get preferredSize => Size.fromHeight(60.h);
 Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: onpressed,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.orange,
        ),
      ),




    );
  }
}