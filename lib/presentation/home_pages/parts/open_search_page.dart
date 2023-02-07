import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studynotes/resources/colors.dart';

class OpenSearchPage extends StatefulWidget {
  const OpenSearchPage({super.key});

  @override
  State<OpenSearchPage> createState() => _OpenSearchPageState();
}

class _OpenSearchPageState extends State<OpenSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.grey.withOpacity(0.6), 
    statusBarIconBrightness: Brightness.light, 
    statusBarBrightness: Brightness.light, 
  ),
        actions: [
          Padding(padding: EdgeInsets.only(top: 15,bottom: 15,right: 20),
          child: Icon(Icons.menu)
          )
        ],
        toolbarHeight: 70,
        foregroundColor: Colors.black.withOpacity(0.8),
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.6),
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search all subjects"
          ),
        ),
      ),
    );
  }
}