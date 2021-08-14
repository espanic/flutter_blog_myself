import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/detail_page.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:flutter_blog/view/pages/user/user_info.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(DetailPage(index: index));
              },
              title: Text("글 제목"),
              leading: Text("${index + 1}"),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 20),
    );
  }

  Widget _navigation(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Get.to(UserInfo());
              },
              child: Text(
                "회원정보",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Get.to(WritePage());
              },
              child: Text(
                "글쓰기",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Get.off(LoginPage());
              },
              child: Text(
                "로그아웃",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
