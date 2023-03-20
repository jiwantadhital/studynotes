import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/institute/images/bloc/image_bloc.dart';
import 'package:studynotes/logic/institute/main/bloc/institute_bloc.dart';
import 'package:studynotes/presentation/colleges/college_details/desc_section.dart';
import 'package:studynotes/presentation/colleges/college_details/widgets/widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';

class CollegeDetail extends StatefulWidget {
  int id;
  int index;
  CollegeDetail({super.key, required this.index, required this.id});

  @override
  State<CollegeDetail> createState() => _CollegeDetailState();
}

class _CollegeDetailState extends State<CollegeDetail> {
  bool loaded=false;
  TabController? _tabController;
  int theNumber = 1;
  String networkImage =
      "https://lh3.googleusercontent.com/p/AF1QipMt81hodeb7nPhGqeK82U6UhDAJe6v-06tLBs5N=s680-w680-h510";
  Color color = Colors.white;
  int currentIndex = 0;
  double bottomHeight = 70;

refresh(){
  Future.delayed(Duration(milliseconds: 500),(){
    setState(() {
      
    });
  });
}

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    var institute = context
        .read<InstituteBloc>()
        .instituteController
        .instituteModel[widget.index];

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
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6))),
                      ],
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    collapsedHeight: 80,
                    automaticallyImplyLeading: false,
                    expandedHeight: 300.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                      alignment: Alignment.center,
                      children: [
                      loaded==false?CircularProgressIndicator():  Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                                image: NetworkImage("${ApiClass.local}uploads/images/colleges/images/${context.read<ImageBloc>().instituteController.imageModel[currentIndex].image}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                            top: 200,
                            child: Center(
                              child: BlocConsumer<ImageBloc, ImageState>(
                                listener: (context,state){
                                  if(state is ImageLoaded){
                                    refresh();
                                  }
                                },
                                builder: (context, state) {
                                  if(state is ImageLoading){

                                  }
                                  if(state is ImageError){

                                  }
                                  if(state is ImageLoaded){
                                    return SizedBox(
                                    height: 50,
                                    width: 180,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.imageModel.length,
                                      itemBuilder: (context, index) {
                                        loaded = true;
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              networkImage = "${ApiClass.local}uploads/images/colleges/images/${state.imageModel[index].image}";
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
                                                    width: currentIndex == index
                                                        ? 3
                                                        : 2,
                                                    color: currentIndex == index
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "${ApiClass.local}uploads/images/colleges/images/${state.imageModel[index].image}"),
                                                    fit: BoxFit.cover)),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                  }
                                  return Container();
                                },
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
                                color: Theme.of(context).primaryColor,
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
                        desc: institute.description.toString(),
                        // index: index,
                      ),
                      Specifications(
                        details: institute.details.toString(),
                      ),
                      Reviews(
                        id: institute.id!.toInt(),
                        show: false,
                      ),
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
                      children: [],
                    ),
                  ),
                ])));
  }
}
