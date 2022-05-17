import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_app_final/screen/camerascree.dart';
import 'package:camera_app_final/screen/fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
ValueNotifier<List<String>> imageList=ValueNotifier([]); 
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
       
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async {
        await availableCameras().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CammeraScreen(Cameras: value,))));
      },
      child: const Icon(Icons.camera_alt_outlined),
      ),
      body: ValueListenableBuilder(
        valueListenable: imageList,
        builder: (BuildContext ctx, List<String> imageLList, Widget? child) {
           
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: imageLList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext ctx, index) {
                final String curntPath =imageLList[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FullScreen(path:curntPath ),
                      ),
                    );
                  },
                  child: Hero(    
                    tag: curntPath,
                    child: Image.file(
                      File(curntPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      
    );
  }
 
}