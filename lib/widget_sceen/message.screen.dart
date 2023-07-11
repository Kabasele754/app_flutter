import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return
      GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding: EdgeInsets.all(20),
      childAspectRatio: 3 / 2,
      children: [
        Card(elevation: 20,child: Image.asset('assets/images/python.jpg')),
    Card(elevation: 20,child:Image.asset('assets/images/java.png')),
    Card(elevation: 20,child:Image.asset('assets/images/dart.png')),
    Card(elevation: 20,child:Image.asset('assets/images/c#.png')),
    Card(elevation: 20,child:Image.asset('assets/images/c++.png')),
    Card(elevation: 20,child:Image.asset('assets/images/html.png')),
      ],
    );
  }
}
