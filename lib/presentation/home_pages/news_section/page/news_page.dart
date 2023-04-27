import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/news/bloc/news_bloc.dart';
import 'package:studynotes/presentation/home_pages/main_page.dart';
import 'package:studynotes/presentation/home_pages/news_section/news_details.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: UserSimplePreferences.getDark()==true?Colors.black:Colors.white,
        appBar: AppBar(
          centerTitle: true,
        title: DText(
          text: "All News",
          color: ColorManager.textColorWhite,
          weight: FontWeightManager.semibold,
          size: FontSize.s20,
          family: FontConstants.fontNunito,
        ),
      ),
      body: Container(
        child:  BlocConsumer<NewsBloc, NewsState>(
                        builder: ((context, state) {
                          if (state is NewsLoading) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10, bottom: 10),
                                  height: 120,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Loading(size: size),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Loading(size: size)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 15, right: 15),
                                  height: 120,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Loading(size: size),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Loading(size: size)
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                          if (state is NewsGot) {
                            return SingleChildScrollView(
                               controller: context.read<NewsBloc>().scrollController,
                              child: Container(
                                child: GridView.builder(
                                    padding: const EdgeInsets.all(0),
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio:
                                          size.width < 370 ? 4 / 3.7 : 4 / 3.5,
                                    ),
                                    itemCount: context.read<NewsBloc>().isLoadingMore? state.newsModel.length+1:state.newsModel.length,
                                    itemBuilder: (context, index) {
                                       if(index >= state.newsModel.length){
                                                return const Center(child: CircularProgressIndicator());
                                               }
                                               else{
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) {
                                            return NewsDetails(
                                                 data: state.newsModel[index].description.toString(),
                                            image: state.newsModel[index].image.toString(),
                                            title: state.newsModel[index].title.toString(),
                                              index: index,
                                            );
                                          }));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Container(
                                                // margin: EdgeInsets.only(left: 5,right: 5),
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        "${ApiClass.local}uploads/images/news/${state
                                                          .newsModel[index].image
                                                          .toString()}"
                                                      ),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: DText(
                                                    lines: 2,
                                                   color: UserSimplePreferences.getDark()==true?Colors.white:Colors.black,
                                                    text: state.newsModel[index].title
                                                        .toString(),
                                                    weight: FontWeightManager.regular,
                                                    family: FontConstants.fontNoto,
                                                    size: FontSize.s11),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                               }
                                    }),
                              ),
                            );
                          }
                          if (state is NewsError) {
                            print(state.message);
                            return const Center(child: Text("Something went wrong"));
                          }
                          return const Text("error");
                        }),
                        listener: (context, state) {}),
      ),
    );
  }
}