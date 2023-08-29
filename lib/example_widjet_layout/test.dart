// import 'package:flutter/material.dart';
// import 'package:my_apptest/widget_sceen/home.screen.dart';
// import 'package:my_apptest/widget_sceen/message.screen.dart';
//
// void main(){
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: DefaultTabController(
//           length: 3,
//           child: Scaffold(
//
//             appBar: AppBar(
//
//               bottom: TabBar(
//                 tabs: [
//                   Tab(icon: Icon(Icons.home), text: "Home",),
//                   Tab(icon: Icon(Icons.message),text: "Disc",),
//                   Tab(icon: Icon(Icons.group), text: "Droup",),
//                 ],
//               ),
//               leading: Icon(Icons.menu),
//               title: Text('Tabs Demo'),
//
//               actions: [
//                 Icon(Icons.search),
//                 Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
//                 Icon(Icons.more_vert),
//
//               ],
//             ),
//             body: TabBarView(
//               children: [
//                 // Icon(Icons.home, size: 350),
//                 // partial home
//                 HomeScreen(),
//                 // Icon(Icons.message, size: 350),
//                 Message(),
//                 Icon(Icons.group, size: 350),
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }