import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storeenjel/insertuser.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listDataUser = [];
  Future<void> getDataUser() async {
    String url = "https://marisaenjel.000webhostapp.com/listuser.php";
    try {
      var response = await http.get(Uri.parse(url));
      listDataUser = jsonDecode(response.body);
      setState(() {
        listDataUser = jsonDecode(response.body);
      });
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> deleteDataUser(String id) async {
    String url = "https://marisaenjel.000webhostapp.com/deleteuser.php";
    try {
      var uriParam = await http.post(Uri.parse(url), body: {"id": id});
      var response = jsonDecode(uriParam.body);
      if (response["success"] == "true") {
        print("hapus data user berhasil");
        getDataUser();
      } else {
        print("hapus data user gagal");
      }
    } catch (exc) {
      print(exc);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Data User")),
        body: ListView.builder(
            itemCount: listDataUser.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(2),
                child: ListTile(
                  leading: const Icon(CupertinoIcons.person_2_alt,
                      color: Colors.orange, size: 18),
                  title: Text(
                    listDataUser[index]["username"],
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  subtitle: Text(
                    listDataUser[index]["email"],
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.delete_solid,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deleteDataUser(listDataUser[index]["id"]);
                        },
                        iconSize: 18,
                      ),
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.arrow_down_doc,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                        iconSize: 18,
                      )
                    ],
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => InsertUser()),
            ));
          },
          splashColor: Colors.red,
          backgroundColor: Colors.orange,
          mini: true,
          child: Icon(Icons.add, color: Colors.white),
        ));
  }
}