import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  IconData icons;
  Color backgroundColor;
  double? height;
  double? width;
  double iconSize;
  IconWidget({
    Key? key,
    required this.icons,
   required this.backgroundColor,
    this.height=40,
    this.width=40,
    this.iconSize=20
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Icon(icons,color: Colors.white,size: iconSize,),
    );
  }
}