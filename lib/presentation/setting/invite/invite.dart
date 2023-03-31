import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({super.key});

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Share(image: "https://img.freepik.com/premium-vector/instagram-social-media-icon-gradient-social-media-logo_197792-4682.jpg",),
                                         Share(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Facebook_Messenger_logo_2018.svg/2048px-Facebook_Messenger_logo_2018.svg.png",),
                                          Share(image: "https://cdn-icons-png.flaticon.com/512/281/281769.png",),
                                           Share(image: "https://uxwing.com/wp-content/themes/uxwing/download/communication-chat-call/text-message-icon.png",)
                                      ],
                                    ),
                                  );
  }
}

class Share extends StatelessWidget {
  String image;
   Share({
    super.key,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[400]!,width: 2)
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image),fit: BoxFit.contain),
        ),
      ),
    );
  }
}