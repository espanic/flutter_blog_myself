import 'package:flutter/material.dart';
import 'package:flutter_blog/page_util/validators.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/components/custom_writing_area.dart';

import 'package:get/get.dart';

import 'home_page.dart';

class WritePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(hint: "제목", funValidate: validateTitle()),
              CustomWritingArea(hint: "글내용", funValidate: validateContent()),
              CustomElevatedButton(
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(HomePage());
                  }
                },
                text: "글쓰기",
              )
            ],
          ),
        ),
      ),
    );
  }
}
