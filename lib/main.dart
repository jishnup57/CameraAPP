import 'package:camera_app_final/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    createalist();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

  createalist() async {
    final dir = await getExternalStorageDirectory();
    if (dir != null) {
      var listdir = await dir.list().toList();

      ///.list?
      for (var i = 0; i < listdir.length; i++) {
        imageList.value.add(listdir[i].path);
      }
    }
  }
}
