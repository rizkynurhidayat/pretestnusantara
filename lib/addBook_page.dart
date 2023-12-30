import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pretestnusantara/home_page.dart';
// import 'package:pretestnusantara/model/book.model.dart';

import 'controller.dart';

class AddBooks extends StatelessWidget {
  const AddBooks({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Book"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: c.isbn,
                        decoration: InputDecoration(
                            hintText: "No ISBN",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.title,
                        decoration: InputDecoration(
                            hintText: "Titile",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.subtitle,
                        decoration: InputDecoration(
                            hintText: "Subtitle",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.author,
                        decoration: InputDecoration(
                            hintText: "Author",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.published,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            hintText: "published (YYYY-MM-DD)",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.publisher,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "publisher",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.pages,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "pages",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.description,
                        // keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Description",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.website,
                        // keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Website",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: ()  {
                   c.addBok();
                  },
                  child: Text("Add Book")),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
