import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({Key? key, required this.profilePhotoUrl}) : super(key: key);
  String profilePhotoUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 65,
              height: 65,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(image: NetworkImage(profilePhotoUrl)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
