import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone_dhuru/constants.dart';
import 'package:tik_tok_clone_dhuru/controller/auth_controller.dart';
import 'package:tik_tok_clone_dhuru/view/screens/auth/login_screen.dart';
import 'view/screens/auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

// dhuru ke is project ka video no 3 me 9 min se aage const ke bare me important
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: SignUpScreen(),
    );
  }
}
