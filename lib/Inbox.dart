import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Row(
              children: <Widget>[
                Container(
                    height: 50,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-7aESnILCSqMgBCAkbmUYFMGbLxe59WPTirEFTMTX2jSlgGm&s"),
                      ),
                    )),
                Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 170,
                      child: Wrap(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              "Dynamo Gaming is line:PUBG MOBILE LIVE WITH DYNAMO|FINALLLY ACE|ROAD ON CONQUEROR",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 166,
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Text(
                          "7 hours ago",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 60,
                    width: 99,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, left: 15),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHVzrU76bDZaO6YwxmrH9G_OJQVA_rkTV4A84S1Ed32CqT_YDf&s"),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
            childCount: 10
          ),
        )
      ],
    ));
  }
}
