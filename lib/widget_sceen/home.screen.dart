import 'package:flutter/material.dart';
import 'package:my_apptest/model/blog.model.dart';
import 'package:my_apptest/pages/blogbox.pages.dart';
import 'package:my_apptest/pages/blogdetails.pages.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, this.title}):super(key: key);

  final String? title;
  final items = Blog.getBlog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:

          ListView.builder(
            itemCount: items.length,
              itemBuilder: (context, index){
              return GestureDetector(
                child: BlogBox(item: items[index],),
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BlogPages(item: items[index])));
                },
              );

          })


    );
  }
}
