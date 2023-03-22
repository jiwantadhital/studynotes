// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:studynotes/logic/institute/comments/bloc/comments_bloc.dart';

import 'package:studynotes/presentation/colleges/college_details/comment_sheet.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

class DescPart extends StatelessWidget {
  String desc;
  DescPart({
    Key? key,
    required this.desc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DText(
            text: "",
            weight: FontWeightManager.medium,
            color: ColorManager.boxGreen,
            family: FontConstants.fontNunito,
            size: 12,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "4/5",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      WidgetSpan(
                          child: Container(
                        width: 2,
                      )),
                      WidgetSpan(
                          child: Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                        size: 15,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: DText(
              text: desc,
              family: FontConstants.fontNoto,
              weight: FontWeightManager.light,
              lines: 22,
              size: 15,
              color: Colors.black.withOpacity(0.7),
            ),
          )
        ],
      ),
    );
  }
}

class Specifications extends StatelessWidget {
  String details;
  Specifications({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: DText(
              text: details,
              family: FontConstants.fontNoto,
              weight: FontWeightManager.light,
              lines: 22,
              size: 15,
              color: Colors.black.withOpacity(0.7),
            ),
          )
          // SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          //     Divider(),
          //     SpecificationName(specification: "Quality:",detail: "Medium",),
          //     Divider(),
          //     SpecificationName(specification: "Chipset:",detail: "Quantinum",),
          //     Divider(),
          //     SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          //     Divider(),
          //     SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          //     Divider(),
          //     SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          //     Divider(),
          //     SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          //     Divider(),
          //     SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          //     Divider(),
        ],
      ),
    );
  }
}

class SpecificationName extends StatelessWidget {
  String specification;
  String detail;
  SpecificationName({required this.specification, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: DText(
              text: specification,
              color: Colors.black,
              weight: FontWeightManager.light,
              size: FontSize.s13,
              family: FontConstants.fontNunito,
            )),
        SizedBox(
          width: 5,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: DText(
              text: detail,
              color: Colors.grey[700] ?? Colors.green,
              lines: 2,
              weight: FontWeightManager.light,
              size: FontSize.s13,
              family: FontConstants.fontNunito,
            )),
      ],
    );
  }
}

class Reviews extends StatefulWidget {
  int id;
  bool show;
  Reviews({super.key, required this.show, required this.id});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
    double average = 0;
      final f =  DateFormat('yyyy-M-d');

  @override
  void initState() {
    widget.show = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
                child: DText(
              text: "${average.toStringAsPrecision(2)}/5",
              color: Colors.black,
              size: 20,
              weight: FontWeightManager.semibold,
              family: FontConstants.fontNunito,
            )),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < average.toInt(); i++)
                  Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  ),
                  for (int i = 0; i < 5-average.toInt(); i++)
                  Icon(
                    Icons.star,
                    color: Theme.of(context).disabledColor,
                  ),
              ],
            ),
            Divider(),
            BlocConsumer<CommentsBloc, CommentsState>(
              listener: (context, state) {
               if(state is CommentsLoaded){
               }
              },
              builder: (context, state) {
                if(state is CommentsLoading){
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context,index){
                      return Container(
                        height: 160,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15)
                              ),
                            ),
                               Container(
                              margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                          ],
                        ),
                      );
                  });
                }
                if(state is CommentsError){
                  return Center(child: Text("Something went wrong"),);
                }
                if(state is CommentsLoaded){
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: state.commentModel.length,
                    itemBuilder: ((context, index) {
                     var tday = f.format(DateTime.parse(state.commentModel[index].createdAt.toString()));
                      average = state.avg;
                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(3),
                        // height: 150,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            width: 2,
                                            color:
                                                Theme.of(context).primaryColor),
                                        image: DecorationImage(
                                            image: MemoryImage(
                                                base64Decode(state.commentModel[index].student!.image??imageAll)),fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DText(
                                          text: state.commentModel[index].student!.name.toString(),
                                          color: Colors.black.withOpacity(0.7),
                                          size: 15,
                                          weight: FontWeightManager.semibold,
                                          family: FontConstants.fontPoppins,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  WidgetSpan(
                                                      child: Icon(
                                                    Icons.star,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    size: 15,
                                                  )),
                                                  WidgetSpan(
                                                      child: Container(
                                                    width: 2,
                                                  )),
                                                  TextSpan(
                                                      text: state.commentModel[index].commentsRatting!.toDouble().toString(),
                                                      style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontSize: 12,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            DText(
                                              text: tday.toString(),
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                              size: 15,
                                              family: FontConstants.fontNoto,
                                              weight: FontWeightManager.light,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5, right: 5,top: 5,bottom: 5),
                              // height: 80,
                              width: MediaQuery.of(context).size.width,
                              child: DText(
                                text:
                                   state.commentModel[index].description??"",
                                color: Colors.black.withOpacity(0.7),
                                size: 12,
                                lines: 4,
                                family: FontConstants.fontNunito,
                                weight: FontWeightManager.light,
                              ),
                            ),
                          ],
                        ),
                      );
                    }));
                }
                return Center(child: Text("Something went wrong"),);              },
            ),
          ],
        ),
      )),
      floatingActionButton: AnimatedOpacity(
        opacity: widget.show == false ? 1 : 0,
        duration: Duration(seconds: 2),
        child: FloatingActionButton.extended(
            splashColor: Colors.black,
            backgroundColor: Theme.of(context).primaryColor,
            label: Text("Write a review"),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return CommentSheet(id: widget.id,);
                  }).then((value) {
                    context.read<CommentsBloc>().add(CommentsGettingEvent(id: widget.id));
                  });
            }),
      ),
    );
  }
}
