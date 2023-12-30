import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretestnusantara/controller.dart';

class RegisPage extends StatelessWidget {
  const RegisPage({super.key});

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
            "Register Page",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: c.nama,
            onTap: () {},
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "nama"),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: c.email,
            keyboardType: TextInputType.emailAddress,
            onTap: () {},
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "email"),
          ),
          SizedBox(height: 20,),
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
                  labelText: "password"),
            ),
          ),
          SizedBox(height: 20,),
          Obx(
            () => TextField(
              controller: c.pwConfirmation,
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
                  labelText: "password confirmation",
                 
                  ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            c.regis();
          }, child: Text("Register")),
          ElevatedButton(onPressed: () {
            Get.back();
          }, child: Text("Back")),
         
        ],
      ),
    ));
  }
}
