import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class CommentSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
              heightFactor: 0.9,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
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
          ),
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  TextEditingController _mycontroller = TextEditingController();
  int _value = 1;
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
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                   itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              ),
                    onRatingUpdate: (rating) {
                      _value = rating.toInt();
                        print(rating);
                             }, 
                  ),
                )
              ),
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
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: ()async {
                setState(() {
                  afterSubmit = Container(
                      height: 25,
                      width: 25,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ));
                });
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: GestureDetector(
                  onTap: ()async{
                    setState(() {
                  afterSubmit = Container(
                      height: 25,
                      width: 25,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ));
                });
                Navigator.pop(context);
                  },
                  child: afterSubmit)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}