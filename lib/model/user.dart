import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String name;
  String profilePhoto;
  String email;
  String uid;
  //iska matlab hai ki jab hum user class object use karen ge to required cheez chahiye
  MyUser({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });
//APp Firebase (Map)  app se data firebase me jayega
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "profilePic": profilePhoto,
      "email": email,
      "uid": uid
    };
  }

//firebase to app data, firebase se ap me aayega data
  static MyUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return MyUser(
        //email user class ka user hai aur snapshot email firebase ka email hai, baki isi tarah
        email: snapshot["email"],
        profilePhoto: snapshot["profilePic"],
        uid: snapshot["uid"],
        name: snapshot["name"]);
  }
}
