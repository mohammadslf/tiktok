import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String username;
  String uid;
  String id;
  List likes;
  int commentsCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePic;
  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentsCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePic,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'uid': uid,
      'id': id,
      'likes': likes,
      'commentsCount': commentsCount,
      'shareCount': shareCount,
      'songName': songName,
      'caption': caption,
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'profilePic': profilePic,
    };
  }

  static Video fromsnap(DocumentSnapshot snap) {
    var sst = snap.data() as Map<String, dynamic>;
    return Video(
      username: sst['username'] ?? '',
      uid: sst['uid'] ?? '',
      id: sst['id'] ?? '',
      likes: sst['likes'],
      commentsCount: sst['commentsCount']?.toInt() ?? 0,
      shareCount: sst['shareCount']?.toInt() ?? 0,
      songName: sst['songName'] ?? '',
      caption: sst['caption'] ?? '',
      videoUrl: sst['videoUrl'] ?? '',
      thumbnail: sst['thumbnail'] ?? '',
      profilePic: sst['profilePic'] ?? '',
    );
  }
}
