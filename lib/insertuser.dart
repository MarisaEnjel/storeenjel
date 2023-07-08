import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertUser extends StatefulWidget {
  const InsertUser({super.key});

  @override
  State<InsertUser> createState() => _insertUser();
}

class _insertUser extends State<InsertUser> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone= TextEditingController();

  Future<void> insertDataUser() async{
    String url = 'https://marisaenjel.000webhostapp.com/adduser.php';
    try{
      var response = await http.post(Uri.parse(url), body: {
        "username": _username.text.toString(),
        "password": _password.text.toString(),
        "email": _email.text.toString(),
        "phone": _phone.text.toString(),
      });
      var insertUser = json.decode(response.body);
      if(insertUser == "true"){
        print("Data User baru berhasil ditambahkan");
      }else{
        print("Data User baru gagal ditambahkan");
      }

    }catch(exc){
      print(exc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New User")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: TextField(
                controller: _username,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 40, 38, 38), fontSize: 16),
                  hintText: "input username",
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: const Icon(
                      CupertinoIcons.person_2_square_stack,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 26, 23, 22), fontSize: 16),
                  hintText: "input password",
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      CupertinoIcons.lock_slash,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 57, 54, 54), fontSize: 16),
                  hintText: "input email",
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      CupertinoIcons.mail_solid,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: TextField(
                controller: _phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 41, 33, 33), fontSize: 16),
                  hintText: "input phone number",
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      CupertinoIcons.phone_circle,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
              child: ElevatedButton(
                onPressed: () {
                  insertDataUser();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 247, 54, 70)
                ),
                child: const Text(
                  "ADD USER",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}