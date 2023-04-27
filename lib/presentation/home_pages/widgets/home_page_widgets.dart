import 'package:flutter/material.dart';
import 'package:studynotes/resources/fonts.dart';

class DText extends StatelessWidget {
  TextAlign align;
  int? lines;
String text;
FontWeight weight;
String family;
double size;
Color color;
   DText({
    Key? key,
    this.lines,
    this.align=TextAlign.start,
    required this.color,
    required this.text,
    required this.weight,
    required this.family,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      textAlign: align,
      maxLines: lines,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: family,
        fontWeight: weight
      ),
    );
  }
}

//topics
class Topics extends StatelessWidget {
  String text2;
  Color color;
String text;
var onTap;
   Topics({
    Key? key,
    this.text2 = "View all",
   required this.color,
    required this.text,
     this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 20),
      height: 23,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DText(color: color,
          text: text,
          weight: FontWeightManager.regular,
          family: FontConstants.fontNoto,
          size: FontSize.s16),
           GestureDetector(
            onTap: onTap,
             child: DText(color: Colors.blue,
                     text: text2,
                     weight: FontWeightManager.regular,
                     family: FontConstants.fontNoto,
                     size: FontSize.s11),
           ),
        ],
      ),
    );
  }
}