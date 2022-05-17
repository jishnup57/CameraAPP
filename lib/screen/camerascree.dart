


import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_app_final/screen/fullscreen.dart';
import 'package:camera_app_final/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CammeraScreen extends StatefulWidget {
 final List<CameraDescription> Cameras;
  CammeraScreen({ Key? key ,required this.Cameras}) : super(key: key);

  @override
  State<CammeraScreen> createState() => _CammeraScreenState();
}

class _CammeraScreenState extends State<CammeraScreen> {
  late CameraController controller;
  XFile? picture;
  List <File> imageCaptured=[];

  @override
  void initState() {
   controller=CameraController(widget.Cameras[0],ResolutionPreset.high);
   controller.initialize().then((value) {
     if(!mounted){
       return;
     }else{
       setState(() {
       
     });
     }
     
   });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      ); 
      
      
    }
    return Column(
      
      children: [
        Expanded(
          flex: 8,
          child: SizedBox(
            width: double.infinity,
            child: CameraPreview(controller),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              GestureDetector(child:const Icon(Icons.cameraswitch,
              color: Colors.white) ,
              onTap: (){

              },
              ),
               GestureDetector(child:const Icon(Icons.camera_rounded,
               color: Colors.white,
               size: 60,)
                ,
              onTap: (){
                capture();

              },
              ),
              GestureDetector(child:
              Container(
                height: 50,
                width: 50,
                decoration:BoxDecoration(
                  image: imageCaptured.isNotEmpty? DecorationImage(
                    image:FileImage(
                      imageCaptured.last
                    ) ) :null,
                  border:Border.all(
                    color: Colors.white
                  ),
                ) ,
              )
                ,
              onTap: (){
              
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx){
                  return FullScreen(path: picture!.path);
                })
              );

              },
              ),

             
             
              
            ],
          ),
        )
      ],
      
      
    );
  }
  capture()async{
    picture=await controller.takePicture();  //what is xfile?
    setState(() {
      imageCaptured.add(File(picture!.path));

    }
    
    );
    if(picture!=null){
      var createdirectorypath=await getExternalStorageDirectory();
      
          
  File imageNewPath=File(picture!.path);
  File pathUpdate = await imageNewPath.copy('${createdirectorypath!.path}/${DateTime.now()}.jpg');
  imageList.value.add(pathUpdate.path);
  imageList.notifyListeners();
    }



  }
  
}