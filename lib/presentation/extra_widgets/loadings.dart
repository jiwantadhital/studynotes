import 'package:flutter/material.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

 Future<void> dialogBuilder(BuildContext context,text) {
    return showDialog<void>(
                        // barrierDismissible: false,
                        context: context, builder: (context){
                        return Center(
                          child: Container(
                            padding: EdgeInsets.only(left: 5,right: 5),
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DText(color: ColorManager.textColorBlack, text: text, weight: FontWeightManager.semibold, family: FontConstants.fontNunito, size: FontSize.s14),
                                  SizedBox(height: 10,),
                                  LinearProgressIndicator(color: ColorManager.primaryColor,),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
  }