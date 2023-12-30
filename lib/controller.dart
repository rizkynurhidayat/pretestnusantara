import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretestnusantara/detail_book_pages.dart';
import 'package:pretestnusantara/home_page.dart';
import 'package:pretestnusantara/login_page.dart';
// import 'package:pretestnusantara/model/book.model.dart';
import 'package:pretestnusantara/service_api.dart';

import 'model/book.model.dart';

class MyController extends GetxController {
  // ? user text controller
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pwConfirmation = TextEditingController();

  // ? Book text controller
  TextEditingController isbn = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController published = TextEditingController();
  TextEditingController publisher = TextEditingController();
  TextEditingController pages = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController website = TextEditingController();

  var obscureT = true.obs;

  final api = ApiService();

  Book selectedBook = Book();

  void logout() {
    api.logout();
    // print("logout");
    email.clear();
    password.clear();
    Get.to(() => const LoginPage());
  }

  void regis() async {
    await api.register(
        nama.text, password.text, pwConfirmation.text, email.text);

    // nama.clear();
    // pwConfirmation.clear();
    // password.clear();
    // email.clear();
    Get.back();
  }

  void login() async {
    await api.login(email.text, password.text);
    Get.to(() => const HomePage());
  }

  void addBok() async {
    await api.addBook(Book(
        author: author.text,
        description: description.text,
        isbn: isbn.text,
        pages: int.tryParse(pages.text),
        published: DateTime.tryParse(published.text)!.toIso8601String(),
        publisher: publisher.text,
        title: title.text,
        subtitle: subtitle.text,
        website: website.text));

    author.clear();
    description.clear();
    isbn.clear();
    pages.clear();
    published.clear();
    publisher.clear();
    title.clear();
    subtitle.clear();
    website.clear();
    Get.to(() => HomePage());
  }

  void getBookbyId()async{
    await api.getBookbyID(selectedBook.id!);
    Get.to(()=> DetailBook());
  }
  void deleteBook(int id)async{
    await api.detelBook(id);
    Get.to(()=> HomePage());
  }

  void editBook(int id) async {
    await api.editBookbyID(id ,Book(
        author: author.text,
        description: description.text,
        isbn: isbn.text,
        pages: int.tryParse(pages.text),
        published: DateTime.tryParse(published.text)!.toIso8601String(),
        publisher: publisher.text,
        title: title.text,
        subtitle: subtitle.text,
        website: website.text));

    author.clear();
    description.clear();
    isbn.clear();
    pages.clear();
    published.clear();
    publisher.clear();
    title.clear();
    subtitle.clear();
    website.clear();
    Get.to(() => HomePage());
  }
}
