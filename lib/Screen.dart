import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
      
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
          title: Container(
              height: 100,
              width: 100,
              child: Image.asset("images/youtubelogo.png")),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.videocam,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.search,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black,
                child: Icon(Icons.person),
                // backgroundImage: AssetImage("images/youtubelogo.png"),
              ),
            )
          ],
        ),
          // Container(
          //   height: 100,
          //   color: Colors.red,
          // ),
        
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context,index)=>Column(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  height: 100,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            )
          )
        )
        
        ],
      ),
      
    );
  }
}