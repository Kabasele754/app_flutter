import 'package:app_flutter/example_widjet_layout/pages/gallery.pages.dart';
import 'package:app_flutter/example_widjet_layout/widget_sceen/home.screen.dart';
import 'package:app_flutter/example_widjet_layout/widget_sceen/message.screen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tutorials',
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the Main widget.
          '/': (context) => const HomeMain(),
          '/gallery': (context) => const GalleryPages(),
          // '/settings': (context) => Settings()
        },
        // home: HomeMain()
    //

    );
  }
}

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(

          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home",),
              Tab(icon: Icon(Icons.message),text: "Disc",),
              Tab(icon: Icon(Icons.group), text: "Droup",),
            ],
          ),
          //leading: Icon(Icons.menu),
          title: const Text('My app'),

          actions: [
            // Icon(Icons.search),
            // Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {print("Hello search");}),
            // Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
            Icon(Icons.more_vert),

          ],
        ),
        body: TabBarView(
          children: [
            // Icon(Icons.home, size: 350),
            // partial home
            HomeScreen(),
            // Icon(Icons.message, size: 350),
            const Message(),
            const Icon(Icons.group, size: 350),
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
             const DrawerHeader(
               decoration: BoxDecoration(
                 color: Colors.blue,
               ), //BoxDecoration
               child: UserAccountsDrawerHeader(
                 decoration: BoxDecoration(color: Colors.blue),
                 accountName: Text(
                   "University Philip Lemon",
                   style: TextStyle(fontSize: 18),
                 ),
                 accountEmail: Text("plu@gmail.com"),
                 currentAccountPictureSize: Size.square(50),
                 currentAccountPicture: CircleAvatar(
                   backgroundColor: Color.fromARGB(255, 165, 255, 137),
                   child: Text(
                     "P",
                     style: TextStyle(fontSize: 30.0, color: Colors.blue),
                   ), //Text
                 ), //circleAvatar
               ), //UserAccountDrawerHeader
             ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: const Text('Gallery'),
                onTap: () {

                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/gallery');
                },
              ),
            ],
          ),
        ), //Drawer
      ),
    );
  }
}


