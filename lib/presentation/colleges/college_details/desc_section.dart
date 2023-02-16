import 'package:flutter/material.dart';
import 'package:studynotes/presentation/colleges/college_details/comment_sheet.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class DescPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DText(text: "",weight: FontWeightManager.medium,color: ColorManager.boxGreen,family: FontConstants.fontNunito,size: 12,),
          SizedBox(height: 10,),
          Container(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    RichText(text: TextSpan(
                                      children: [
                                          TextSpan(text: "4/5",style: TextStyle(
                                          color: Colors.black,fontSize: 15,
                                        ),
                                        ),
                                                                                WidgetSpan(child: Container(width: 2,)),
                                        WidgetSpan(child: Icon(Icons.star,color: Theme.of(context).primaryColor,size: 15,)),
                                      
                                      ],
                                    ),),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 10,),
          Expanded(
            child: DText(text: "The descriptions are very clear Clothing (also known as clothes, apparel, and attire) are items worn on the body. Typically, clothing is made of fabrics or textiles, but over time it has included garments made from animal skin and other thin sheets of materials and natural products found in the environment, put together.Clothing (also known as clothes, apparel, and attire) are items worn on the body. Typically, clothing is made of fabrics or textiles, but over time it has included garments made from animal skin and other thin sheets of materials and natural products found in the environment, put together.",
            family: FontConstants.fontNoto,
            weight: FontWeightManager.light,
            lines: 22,size: 15,
            color: Colors.black.withOpacity(0.7),),
          )
        ],
      ),
    );
  }
}




class Specifications extends StatelessWidget {
  const Specifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SizedBox(height: 10,),
      SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Quality:",detail: "Medium",),
          Divider(),
          SpecificationName(specification: "Chipset:",detail: "Quantinum",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
        ],
      ),
    );
  }
}

class SpecificationName extends StatelessWidget {
  String specification;
  String detail;
  SpecificationName({required this.specification,required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.3,
          child: DText(text: specification,color: Colors.black,weight: FontWeightManager.light,size: FontSize.s13,family: FontConstants.fontNunito,)),
        SizedBox(width: 5,),
        Container(
         width: MediaQuery.of(context).size.width*0.6,
          child: DText(text: detail,color: Colors.grey[700]??Colors.green,lines: 2,weight: FontWeightManager.light,size: FontSize.s13,family: FontConstants.fontNunito,)),
      ],
    );
  }
}

class Reviews extends StatefulWidget {
  bool show;
   Reviews({
    super.key,
    required this.show
  });

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  void initState() {
    widget.show=true;
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
            children: 
              [
                SizedBox(height: 10,),
                Center(child: DText(text: "4/5",color: Colors.black,size: 20,weight: FontWeightManager.semibold,family: FontConstants.fontNunito,)),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=0;i<5;i++)
                Icon(Icons.star, color: Theme.of(context).primaryColor,),
                  ],
                ),
                Divider(),
                ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: ((context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(3),
                  height: 150,
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
                                border: Border.all(width: 2,color: Theme.of(context).primaryColor),
                                image: DecorationImage(image: NetworkImage("https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg"))
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DText(text: "Julia Richard",color: Colors.black.withOpacity(0.7),size: 15,weight: FontWeightManager.semibold,family: FontConstants.fontPoppins,),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(text: TextSpan(
                                        children: [
                                          WidgetSpan(child: Icon(Icons.star,color: Theme.of(context).primaryColor,size: 15,)),
                                          WidgetSpan(child: Container(width: 2,)),
                                          TextSpan(text: "4.0",style: TextStyle(
                                            color: Colors.black.withOpacity(0.7),fontSize: 12,
                                          )),
                                        ],
                                      ),),
                                      DText(text: "1 days ago",color: Colors.black.withOpacity(0.7),size: 15,family: FontConstants.fontNoto,weight: FontWeightManager.light,)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 5,right: 5),
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        child: DText(text: "The clothes are great and all but I cannot undrestand the fact that it was a littel darker,but overall I was really satisfied with the price and the time of delivery, it was perfectly on time and the service was good and I was really glad  ",
                        color: Colors.black.withOpacity(0.7),size: 12,lines: 4,
                        family: FontConstants.fontNunito,
                        weight: FontWeightManager.light,
                        ),
                      ),
                    ],
                  ),
                );
              })),
            ],
          ),
        )
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: widget.show ==false?1: 0,
        duration: Duration(seconds: 2),
        child: FloatingActionButton.extended(
          splashColor: Colors.black,
          backgroundColor: Theme.of(context).primaryColor,
          label: Text("Write a review"),
          onPressed: (){
             showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return CommentSheet(
                                                        
                                                        );
                                                      });
                                             
          }),
      ),
    );
  }
}
