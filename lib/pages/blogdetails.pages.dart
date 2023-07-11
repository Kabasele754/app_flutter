import 'package:flutter/material.dart';
import 'package:my_apptest/model/blog.model.dart';

class BlogPages extends StatelessWidget {
  const BlogPages({Key? key, this.item}): super(key: key);
  final Blog? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item!.name),),
      body: Center(child:
        Container(
          padding: EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/"+ this.item!.image),
              Expanded(child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.item!.name,
                      style: TextStyle(fontWeight: FontWeight.bold),

                    ),
                    Text(this.item!.description),
                    Text("Price" + this.item!.price.toString()),
                  ],
                ),
              ))
            ],
          ) ,
        )
        ,),
    );
  }
}
