import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretestnusantara/controller.dart';
import 'package:pretestnusantara/editbook_page.dart';
// import 'package:pretestnusantara/model/book.model.dart';

class DetailBook extends StatelessWidget {
  const DetailBook({super.key,});
  // final Book book;
  @override
  Widget build(BuildContext context) {
    var c = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: Text(c.selectedBook.title!),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Title : ${c.selectedBook.title}"),
                    Text("subTitle : ${c.selectedBook.subtitle}"),
                    Text("id | user id : ${c.selectedBook.id} | ${c.selectedBook.userId}"),
                    Text("isbn : ${c.selectedBook.isbn}"),
                    Text("author : ${c.selectedBook.author}"),
                    Text("publisher : ${c.selectedBook.publisher}"),
                    Text("published : ${c.selectedBook.published}"),
                    Text("description : ${c.selectedBook.description}"),
                    Text("website : ${c.selectedBook.website}"),
                    Text("createdAt : ${c.selectedBook.createdAt}"),
                    Text("updateAt : ${c.selectedBook.updatedAt}"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  Get.to(()=> EditBooks(bookSelec: c.selectedBook,));
                }, child: Text("Edit")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: () {
                  c.deleteBook(c.selectedBook.id!);
                }, child: Text("Delete")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
