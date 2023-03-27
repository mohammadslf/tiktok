import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone_dhuru/controller/video_controller.dart';
import 'package:tik_tok_clone_dhuru/view/screens/comment_screen.dart';
import 'package:tik_tok_clone_dhuru/view/widgets/album_rotator.dart';
import 'package:tik_tok_clone_dhuru/view/widgets/profile_button.dart';
import 'package:tik_tok_clone_dhuru/view/widgets/tiktoc_video_player.dart';

class DisplayVideo_screen extends StatelessWidget {
  DisplayVideo_screen({Key? key}) : super(key: key);
  final VideoController videoController = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return PageView.builder(
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return Stack(
                children: [
                  TikTokVideoPlayer(videoUrl: data.videoUrl),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.username,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                        Text(data.caption),
                        Text(
                          data.songName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 400,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3,
                          right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(profilePhotoUrl: data.profilePic),
                          InkWell(
                            onTap: () {
                              videoController.likedVideo(data.id);
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 45,
                                  color: Colors.pinkAccent,
                                ),
                                Text(
                                  data.likes.length.toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.reply,
                                size: 45,
                                color: Colors.white,
                              ),
                              Text(
                                data.shareCount.toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CommentScreen(id: data.id)));
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.comment,
                                  size: 45,
                                  color: Colors.white,
                                ),
                                Text(
                                  data.commentsCount.toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                AlbumRotator(profilePicUrl: data.profilePic),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
            scrollDirection: Axis.vertical,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            itemCount: videoController.videoList.length,
          );
        }),
      ),
    );
  }
}
