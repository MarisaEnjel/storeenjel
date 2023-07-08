import 'package:flutter/material.dart';
import 'package:storeenjel/detail_page.dart';
import 'items.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Colors.black, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined,
                color: Colors.black, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.black, size: 30),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Product List",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: (1 / 1.2),
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  DetailPage(selfIndex: index,),
                      ));
                    },
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(items[index][1],scale: 0.7,),
                          Text(items[index][0],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red.shade700),),
                          SizedBox(height: 10,),
                          Text(items[index][3],style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),),
                          SizedBox(height: 10,),
                          Text(items[index][2],style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
                      ],


                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
