

import 'dart:io';


import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullScreen extends StatelessWidget {
  String path;
   FullScreen({ Key? key,required this.path }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File image=File(path);
    //String name=path.split('/').last;
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SizedBox(
        width: double.infinity,
        child: Image.file(image),
      ),
      
    );
  }
}