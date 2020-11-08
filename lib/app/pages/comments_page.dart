import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izifood/app/controllers/comment_controller.dart';

class CommentsPage extends GetView<CommentController> {
  final id;
  final title;
  final body;
  CommentsPage({@required this.id, this.title, this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
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
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.37),
          child: Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              children: [
                Text(body),
                SizedBox(height: 10.0),
                GetX<CommentController>(initState: (state) {
                  Get.find<CommentController>().getComments();
                }, builder: (comment) {
                  return comment.commentList.length >= 1
                      ? Center(child: LinearProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: comment.commentList.length,
                          itemBuilder: (context, index) {
                            print(comment.commentList[index].name.toString());
                            return Column(
                              children: [
                                SizedBox(height: 20),
                                Text(comment.commentList[index].name),
                                Text(
                                    'Comentários (' +
                                        comment.commentList.length +
                                        ')',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold))
                              ],
                            );
                          },
                        );
                })
              ],
            ),
          ),
        )
      ]),
    );
  }
}
