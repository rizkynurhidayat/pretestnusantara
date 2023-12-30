import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretestnusantara/addBook_page.dart';
import 'package:pretestnusantara/controller.dart';
import 'package:pretestnusantara/model/book.model.dart';

// import 'model/book.model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(MyController());
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Home"),
            actions: [
              IconButton(
                  onPressed: () {
                    c.logout();
                  },
                  icon: Icon(Icons.logout)),
            ]),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //   "Your Books Collection",
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                Expanded(
                    child: FutureBuilder<Map<String, dynamic>>(
                        future: c.api.getAllBooks(),
                        builder: (context, snapshot) {
                          print("home page");
                          print(c.api.token);
                          if (snapshot.hasData) {
                            print(snapshot.data!['data']);
                            List<dynamic> listD = snapshot.data!['data'];

                            return SingleChildScrollView(
                              child: Column(
                                children: List.generate(listD.length, (index) {
                                  Book bok = Book.fromJson(listD[index]);
                                  return ListTile(
                                    
                                    leading: Text(bok.id.toString()),
                                    title: Text(
                                      bok.title!,
                                      maxLines: 1,
                                    ),
                                    subtitle: Text(
                                      bok.subtitle!,
                                      maxLines: 2,
                                    ),
                                    
                                    onTap: () {
                                      c.selectedBook = bok;
                                      c.getBookbyId();
                                    },
                                  );
                                }),
                              ),
                            );
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("error banh"),
                            );
                          }
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator(),);
                          }
                          return Center(
                            child: Text("No Books"),
                          );
                        })),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                        onPressed: () {
                          Get.to(() => AddBooks());
                        },
                        child: Text("Add Books")),
                SizedBox(
                  height: 20,
                )
              ],
            )));
  }
}
