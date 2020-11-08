import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izifood/app/controllers/comment_controller.dart';

class CommentsPage extends GetView<CommentController> {
  final title;
  final body;
  CommentsPage({@required this.title, this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<CommentController>(
        initState: (state) {
          Get.find<CommentController>().getComments();
        },
        builder: (comment) {
          return comment.commentList.length < 1
              ? Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Center(child: LinearProgressIndicator()))
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1,
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/background.png'),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.darken),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              title: Text('Notícias'),
                              centerTitle: true,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 25.0),
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.37),
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(body),
                              SizedBox(height: 30.0),
                              Text(
                                  'Comentários (' +
                                      comment.commentList.length.toString() +
                                      ')',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: comment.commentList.length,
                                itemBuilder: (context, index) {
                                  print(comment.commentList[index].name);
                                  return Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(comment.commentList[index].name,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold)),
                                        Text(comment.commentList[index].email,
                                            style: TextStyle(
                                                color: Color(0xffff2956))),
                                        SizedBox(height: 20.0),
                                        Text(comment.commentList[index].body),
                                        Divider(color: Colors.black)
                                      ],
                                    ),
                                  );

                                  //Text(
                                  //'Comentários (' +
                                  //comment.commentList.length +
                                  //')',
                                  //style: TextStyle(
                                  //fontSize: 25.0,
                                  //fontWeight: FontWeight.bold))
                                  //
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
