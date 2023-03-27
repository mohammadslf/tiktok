import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_clone_dhuru/constants.dart';
import 'package:tik_tok_clone_dhuru/view/screens/addcaption_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);
  videoPick(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => addCaptionScreen(
                    videoFile: File(video.path),
                    videoPath: video.path,
                  )));
    } else {
      Get.snackbar(
          "Error in Selecting Video", "Please Choose a Different Video File");
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    videoPick(ImageSource.gallery, context);
                  },
                  child: Text("Gallery"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    videoPick(ImageSource.camera, context);
                  },
                  child: Text("Camera"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showDialogOpt(context);
          },
          child: Container(
            height: 50,
            width: 190,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
