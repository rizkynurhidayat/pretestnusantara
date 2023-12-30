import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretestnusantara/controller.dart';
import 'package:pretestnusantara/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(MyController());
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Wellcome !!!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: c.email,
            onTap: () {},
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "email"),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => TextField(
              controller: c.password,
              onTap: () {},
              obscureText: c.obscureT.value,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        c.obscureT.toggle();
                      },
                      icon: Icon(Icons.remove_red_eye_rounded)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "password"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                c.login();
              },
              child: Text("Login")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an Account?"),
              TextButton(
                  onPressed: () {
                    Get.to(() => RegisPage());
                  },
                  child: Text("Register"))
            ],
          )
        ],
      ),
    ));
  }
}
