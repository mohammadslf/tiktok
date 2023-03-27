import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_clone_dhuru/model/user.dart';
import 'package:tik_tok_clone_dhuru/view/screens/auth/login_screen.dart';

import '../view/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  File? proimg;
  pickImage() async {
    // gallary se image lene ke liye
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final img = File(image.path);
    this.proimg = img;
  }

  //User State Persistence
  late Rx<User?> _user;
  User get user => _user.value!;
  @override
  void onReady() {
    //TODO: implement on Ready
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void SignUp(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadProPic(image);
        MyUser user = MyUser(
            name: username,
            profilePhoto: downloadUrl,
            email: email,
            uid: credential.user!.uid);
        //issse user ka data firebase pe download ho jayega
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
            "Error Creating account", "Please enter all the required field");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  Future<String> _uploadProPic(File image) async {
    // ye hum ne reference banaya hai ki kanhan profile pic save karna hai, aur agar folder ke andar folder karna hai to aur child use honge
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);
    //ye image ko load karega
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error Logining In", "Please enter all the field");
      }
    } catch (e) {
      Get.snackbar("Error Logging In", e.toString());
    }
  }
}
