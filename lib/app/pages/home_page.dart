import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izifood/app/bindings/comment_binding.dart';
import 'package:izifood/app/controllers/post_controller.dart';
import 'package:izifood/app/pages/comments_page.dart';
import 'package:izifood/app/pages/widgets/bottom_navigation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends GetView<PostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            height: 50.0,
            decoration: BoxDecoration(
                color: Color(0xfff1f2f6),
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              cursorColor: Color(0xffff2956),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar',
                hintStyle: TextStyle(color: Color(0xff93a2a6)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                top: 3.0,
                left: 5.0,
                right: 5.0,
              ),
              child: Container(
                width: 50.0,
                height: 30.0,
                decoration: BoxDecoration(
                    color: Color(0xffff2956),
                    borderRadius: BorderRadius.circular(30.0)),
                child: IconButton(
                    icon: Icon(Icons.add, size: 30.0), onPressed: () {}),
              ),
            )
          ],
          elevation: 0),
      body: GetX<PostController>(initState: (state) {
        Get.find<PostController>().getPosts();
      }, builder: (post) {
        return post.postList.length < 1
            ? Padding(
                padding: EdgeInsets.all(25.0),
                child: Center(child: LinearProgressIndicator()),
              )
            : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 80.0,
                      ),
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setInt(
                                        'postId', post.postList[index].id);
                                    Get.to(
                                        CommentsPage(
                                            title: post.postList[index].title,
                                            body: post.postList[index].body),
                                        binding: CommentBinding());
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10.0),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              post.postList[index].title,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              post.postList[index].body,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text('123'),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.comment,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text('123')
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('Notícias',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              );
      }),
      bottomNavigationBar: bottomNavigationWidget(),
    );
  }
}
