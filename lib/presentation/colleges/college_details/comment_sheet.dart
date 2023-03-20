// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/auth/getProfile/bloc/profile_bloc.dart';
import 'package:studynotes/logic/institute/comments/bloc/comments_bloc.dart';
import 'package:studynotes/logic/institute/pcomments/bloc/pcomments_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class CommentSheet extends StatelessWidget {
  int id;
  CommentSheet({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          // width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          child: Items(
            id: id,
          ),
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {
  int id;
  Items({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  TextEditingController _mycontroller = TextEditingController();
  int _value = 3;
  String _comment = " ";
  String submit = "Submit";
  Widget afterSubmit = DText(
    size: FontSize.s15,
    weight: FontWeightManager.bold,
    family: FontConstants.fontNunito,
    text: "Submit",
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    var sId = context.read<ProfileBloc>().authController.profileModel.id;
    print(sId);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 30,
              width: double.maxFinite,
              child: Center(
                  child: DText(
                text: "Write A Review",
                color: Colors.grey,
                family: FontConstants.fontNunito,
                weight: FontWeightManager.medium,
                size: FontSize.s14,
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Align(
                    alignment: Alignment.center,
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      glowColor: ColorManager.primaryColor,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                      onRatingUpdate: (rating) {
                        _value = rating.toInt();
                        print(rating);
                      },
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _mycontroller,
              onChanged: (String comment) {
                setState(() {
                  _comment = comment;
                });
              },
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "Write your review",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                  context.read<PcommentsBloc>().add(PostingEvent(
                      rate: _value,
                      desc: _mycontroller.text,
                      id: UserSimplePreferences.getUserID()!.toInt(),
                      studentId: sId!.toInt(),
                      collegeId: widget.id));
              },
              child: BlocConsumer<PcommentsBloc, PcommentsState>(
                listener: (context, state) {
                  if(state is PcommentsPosting){

                     afterSubmit = Container(
                                  height: 25,
                                  width: 25,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ));
                  }
                  if(state is PcommentsPosted){
                    context.read<CommentsBloc>().add(CommentsGettingEvent(id: widget.id));
                    Navigator.pop(context);
                  }
                  if(state is PcommentsError){
                    ScaffoldMessenger.of(context).showSnackBar(
                                    ShowSnackBar().snack(
                                        "Something went wrong", Colors.red));
                  }
                  if(state is PcommentsInitial){
                  }
                },
                builder: (context,state){
                  return Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: afterSubmit),
                );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
