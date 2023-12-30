import 'package:dio/dio.dart';
import 'package:pretestnusantara/model/book.model.dart';

class ApiService {
  final dio = Dio();
  final url = "https://book-crud-service-6dmqxfovfq-et.a.run.app/api";
  String token = '';

  Future<void> register(
      String username, String password, String passwordConfirmation, String email) async {
    Response<Map<String, dynamic>> response;
    response = await dio.post("$url/register",
        options: Options(headers: {"Accept": "application/json"}),
        data: {
          "name": username,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation
        });
    print(response.data!["message"]);
    // response.data!;
  }

  Future<void> login(String email, String password) async {
    Response<Map<String, dynamic>> response;
    response = await dio.post("$url/login",
        options: Options(headers: {"Accept": "application/json"}),
        data: {"email": email, "password": password});

    print(response.data!);
    // response berupa token
    token = response.data!['token'];
    print(token);
  }

  void logout() async {
    try {
      print(token);
      Response<Map<String, dynamic>> response;
      response = await dio.delete(
        "$url/user/logout",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json"
        }),
      );

      print(response.data!);
    } catch (e) {
      print(e);
    }
  }

  Future<void> addBook(Book book) async {
    print(token);
    Response<Map<String, dynamic>> response;
    response = await dio.post("$url/books/add",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        }),
        data: {
          "isbn": book.isbn,
          "title": book.title,
          "subtitle": book.subtitle,
          "author": book.author,
          "published": book.published!,
          "publisher": book.publisher,
          "pages": book.pages,
          "description": book.description,
          "website": book.website
        });

    print(response.data!['message']);
    print(response.data!['book']['id']);
    // response berupa token
    // token = response.data!['token'];
  }

  Future<Map<String, dynamic>> getAllBooks() async {
    try {
      Response<Map<String, dynamic>> response;
      response = await dio.get(
        "$url/books",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        }),
      );

      print(response.data!['current_page']);
      return response.data!;
    } catch (err) {
      print(err);
    }
    return {};
  }

  Future<Map<String, dynamic>> getBookbyID(int id) async {
    Response<Map<String, dynamic>> response;
    response = await dio.get(
      "$url/books/$id",
      options: Options(headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      }),
    );

    print(response.data!['message']);
    return response.data!;
  }
  Future<void> editBookbyID(int id, Book book) async {
    Response<Map<String, dynamic>> response;
    response = await dio.put(
      "$url/books/$id/edit",
      options: Options(headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
        
      },
      
      ),
       data: {
          "isbn": book.isbn,
          "title": book.title,
          "subtitle": book.subtitle,
          "author": book.author,
          "published": book.published!,
          "publisher": book.publisher,
          "pages": book.pages,
          "description": book.description,
          "website": book.website
        }
    );

    print(response.data!['message']);
    
  }

  Future<void> detelBook(int id) async {
    Response<Map<String, dynamic>> response;
    response = await dio.delete(
      "$url/books/$id",
      options: Options(headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      }),
    );

    print(response.data!['message']);
    // return response.data!;
  }
}
