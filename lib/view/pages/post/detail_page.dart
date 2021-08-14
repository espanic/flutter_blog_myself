import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';

import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "글 제목 $index",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.off(HomePage());
                  },
                  child: Text("삭제"),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    Get.to(UpdatePage());
                  },
                  child: Text("수정"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text("글 내용" * 500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
