import 'package:flutter/material.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class Colleges extends StatefulWidget {


  @override
  State<Colleges> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.primaryColor,
              Colors.white,
            ],
            end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
            ),
        ),
         child: Column(
           children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.008,),
         Container(
                  padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
                  height: MediaQuery.of(context).size.height*0.08,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white
                      ),
                      child:   TextField(
                        cursorColor: const Color.fromRGBO(255, 141, 13, 1),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: ColorManager.primaryColor,
                            size: 25,
                            ),
                            border: InputBorder.none,
                            hintText: "Search fo colleges",
                            hintStyle: const TextStyle(color: Colors.black26,fontSize: 10)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    ),
                    child:  GestureDetector(
                      onTap: (() {
                  //       showModalBottomSheet<void>(
                  //         isScrollControlled: true,
                  //         enableDrag: true,
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //   return Filters();
                  // },
                  //   );
                      }),
                      child: const Icon(
                        Icons.list,
                        color: Colors.grey,
                        ),
                    ),
                  ),
                ],
              ),),
             Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
              height: MediaQuery.of(context).size.height*0.83,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white54,
                  ],
                   end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
              ),
              child: Container(
                margin:  EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.66,
          ), 
          itemCount: 12,
          itemBuilder: (context, index){
            return Container(
              margin: const EdgeInsets.only(left: 10,right: 10,top: 15),
              
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
              
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 2,color: Colors.grey.withOpacity(0.5)),
                                  boxShadow: [
                    // BoxShadow(
                    //   offset: const Offset(-2,0),
                    //   color: Colors.grey.withOpacity(0.3),
                    //   blurRadius: 10
                    // ),
                    ],
                      // image: const DecorationImage(image: NetworkImage(
                      //   "https://media.istockphoto.com/id/876177980/vector/university-vector.jpg?s=612x612&w=0&k=20&c=FqW7PHJFlpzTfK3ax3zPhxgTCgCnVQaPnnmTRPmdjjc=",
                      //   )
                      //   ,fit: BoxFit.cover)
                                  ),
                                  child: Image.asset("assets/images/clz.png",fit: BoxFit.cover,),
                                ),
                  ),
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child:  DText(
                  lines: 3,
                  color: ColorManager.textColorBlack, text: "Orchild International College", weight: FontWeightManager.regular, family: FontConstants.fontNunito, size: FontSize.s12),

              ),
                ],
              )
            );
          }
                ),
              ),
             ),
              
           ],
         ),
       ),
      ),
    );
  }
}