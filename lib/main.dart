import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube/Inbox.dart';
import 'package:youtube/Library.dart';
import 'package:youtube/MainPage.dart';
import 'package:youtube/Subscription.dart';
import 'package:youtube/Trending.dart';

main() {
  runApp(DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
            primaryColor: Colors.white,
            brightness: brightness,
          ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: new MyApp(),
        );
      }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex=0;

  var barcount=[MainPage(),Trending(),Subscription(),Inbox(),Library()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: barcount[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (int index){
             setState(() {
               currentIndex=index;
             }); 
            },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.whatshot,
            ),
            title: Text(
              'Treading',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions,
            ),
            title: Text(
              'Subscriptions',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
            ),
            title: Text(
              "Inbox",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library,
            ),
            title: Text(
              'Library',
            ),
          ),
        ],
      ),


    );
  }
}
