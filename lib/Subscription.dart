import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube/PlayVideos.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  var url = "http://userapi.tk/youtube/subscription";
  var data;
  Future<String> getjsondata() async {
    var responese = await http.get(Uri.encodeFull(url));
    if (mounted) {
      setState(() {
        var convertdata = json.decode(responese.body);
        data = convertdata;
        print(data);
      });
    }
  }

  spin() {
    return SpinKitHourGlass(color: Colors.red);
  }

  @override
  void initState() {
    getjsondata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: data != null
            ? CustomScrollView(
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
                      (context, index) => Column(
                        children: <Widget>[
                          Container(
                              height: 200,
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlayVideos(data, index)),
                                  );
                                },
                                child: Image.network(
                                  data[index]["ThumbmnilURL"],
                                  fit: BoxFit.fitWidth,
                                ),
                              )),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 13, bottom: 20),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundImage: NetworkImage(
                                      data[index]["ProfileiconURL"]),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.77,
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Wrap(
                                          children: <Widget>[
                                            Text(
                                              data[index]["Title"],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          data[index]["Name"],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text("•${data[index]["Name"]}",
                                            style: TextStyle(fontSize: 12)),
                                      ),
                                      Text("•${data[index]["Day"]}",
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Icon(Icons.more_vert))
                            ],
                          ),
                        ],
                      ),
                      childCount: 10,
                    ),
                  ),
                ],
              )
            : spin());
  }
}
