import 'package:flutter/material.dart';
import 'package:studynotes/presentation/colleges/college_details/desc_section.dart';
import 'package:studynotes/presentation/colleges/college_details/widgets/widgets.dart';
import 'package:studynotes/resources/colors.dart';
class CollegeDetail extends StatefulWidget {
  const CollegeDetail({super.key});

  @override
  State<CollegeDetail> createState() => _CollegeDetailState();
}

class _CollegeDetailState extends State<CollegeDetail> {
    List imageList = [
    "https://lh3.googleusercontent.com/p/AF1QipMt81hodeb7nPhGqeK82U6UhDAJe6v-06tLBs5N=s680-w680-h510",
    "https://lh3.googleusercontent.com/p/AF1QipOdKQSb5b3KY25qnCR68ht4Og27YpOYAbv_fbGn=s680-w680-h510",
    "https://lh3.googleusercontent.com/p/AF1QipM5WbbSvi2IABMiUO2QspjJ0szpF-6muCN0gRFT=s680-w680-h510",
  ];
  TabController? _tabController;
  int theNumber = 1;
  String networkImage =
      "https://lh3.googleusercontent.com/p/AF1QipMt81hodeb7nPhGqeK82U6UhDAJe6v-06tLBs5N=s680-w680-h510";
  Color color = Colors.white;
  int currentIndex = 0;
  double bottomHeight = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: IconWidget(
                              icons: Icons.arrow_back,
                              backgroundColor:
                                  ColorManager.primaryColor.withOpacity(0.6))),
                
                    ],
                  ),
                  backgroundColor: ColorManager.primaryColor,
                  collapsedHeight: 80,
                  automaticallyImplyLeading: false,
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: NetworkImage(imageList[currentIndex]),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                          top: 200,
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 180,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imageList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        networkImage = imageList[index];
                                        currentIndex = index;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width:
                                                  currentIndex == index ? 3 : 2,
                                              color: currentIndex == index
                                                  ? ColorManager.primaryColor
                                                  : Colors.white),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  imageList[index]),
                                              fit: BoxFit.cover)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                    ],
                  )),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(20),
                    child: Card(
                      shadowColor: Colors.black,
                      child: TabBar(
                          onTap: (val) {
                            setState(() {
                              val == 2 ? bottomHeight = 0 : bottomHeight = 70;
                            });
                          },
                          controller: _tabController,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                              color: ColorManager.primaryColor,
                              borderRadius: BorderRadius.circular(4)),
                          tabs: const [
                            Tab(
                              child: Text("Description"),
                            ),
                            Tab(
                              child: Text("Details"),
                            ),
                            Tab(
                              child: Text("Reviews"),
                            ),
                          ]),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    DescPart(
                      // index: index,
                    ),
                    Specifications(),
                    Reviews(),
                  ]),
            )),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(left: 10, right: 10),
        width: double.maxFinite,
        height: bottomHeight,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 
          
          ],
        ),
      ),
          ]
    )
      )
      );
  }
}