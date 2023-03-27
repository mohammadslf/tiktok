import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone_dhuru/controller/comment_controller.dart';
import 'package:tik_tok_clone_dhuru/view/widgets/text_input.dart';

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({required this.id});
  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height / 1.05,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                        title: Row(
                          children: [
                            Text(
                              "username",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Comment',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              "2 minutes ago",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '10 likes',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        trailing: Icon(Icons.favorite),
                      );
                    }),
              ),
              Divider(),
              ListTile(
                title: TextInputField(
                  controller: _commentController,
                  myIcon: Icons.comment,
                  myLabelText: "Comment",
                ),
                trailing: TextButton(
                    onPressed: () {
                      commentController.postComment(_commentController.text);
                    },
                    child: Text("Send")),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
