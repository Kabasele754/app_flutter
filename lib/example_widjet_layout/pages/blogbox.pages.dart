import 'package:flutter/material.dart';

import '../model/blog.model.dart';


class BlogBox extends StatelessWidget {
  BlogBox({Key? key, this.item}): super(key: key);
  final Blog? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 180,
      // width: 200,

      child: Card(
        elevation: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Image.asset("assets/images/"+ this.item!.image),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(this.item!.name,
                        style: TextStyle(fontWeight: FontWeight.bold),

                      ),
                      Text(this.item!.description),
                      Text("Price" +this.item!.price.toString()),


                    ],

                  ),
                )

            ),
          ],
        ),
      ),
    );


  }
}
