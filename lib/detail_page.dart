import 'package:flutter/material.dart';

import 'items.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key,required this.selfIndex});
  final selfIndex;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
      body: Column(children: [
        Padding(padding: EdgeInsets.all(20),
          child: Text(items[widget.selfIndex][0], style: TextStyle(fontSize: 25, color: Colors.black),),
        ),
        SizedBox(height: 20),
        ],
      ),
    );


  }
}