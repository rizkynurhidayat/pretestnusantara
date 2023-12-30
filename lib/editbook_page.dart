import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pretestnusantara/home_page.dart';
// import 'package:pretestnusantara/model/book.model.dart';

import 'controller.dart';
import 'model/book.model.dart';

class EditBooks extends StatelessWidget {
   EditBooks({super.key, required this.bookSelec});
final Book bookSelec;
  @override
  Widget build(BuildContext context) {
    var c = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Book ${bookSelec.title}"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      TextField(
                        controller: c.isbn,
                        decoration: InputDecoration(
                          labelText:"no ISBN" ,
                            hintText: bookSelec.isbn,

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.title,
                        decoration: InputDecoration(
                          labelText: "Titile : ",
                            hintText: bookSelec.title,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.subtitle,
                        decoration: InputDecoration(
                           labelText:"Subtitle" ,
                            hintText: bookSelec.subtitle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: c.author,
                        decoration: InputDecoration(
                           labelText: "Author",
                            hintText: bookSelec.author,
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
                           labelText: "published (YYYY-MM-DD)",
                            hintText: bookSelec.published,
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
                           labelText: "publisher",
                            hintText: bookSelec.publisher,
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
                           labelText: "pages",
                            hintText: bookSelec.pages.toString(),
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
                           labelText: "Description",
                            hintText: bookSelec.description,
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
                           labelText: "Website",
                            hintText: bookSelec.website,
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
                   c.editBook(bookSelec.id!);
                  },
                  child: Text("Edit Book")),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
