import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideos extends StatefulWidget {
  var data1, index1;
  PlayVideos(this.data1, this.index1);
  @override
  _PlayVideosState createState() => _PlayVideosState(data1, index1);
}

class _PlayVideosState extends State<PlayVideos> {
  var data, index;
  _PlayVideosState(this.data, this.index);
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
      data[index]["VideoURL"],
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: (data == null)
          ? CircularProgressIndicator()
          : Column(
              children: <Widget>[
                Container(
                  height: 230,
                  width: double.infinity,
                  child: SafeArea(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                                  child: ListView(
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                data[index]["Title"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.5,
                                ),
                              ),
                            ),
                            trailing:
                                Icon(Icons.arrow_drop_down, color: Colors.grey),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1.5),
                              child: Text(data[index]["Views"]),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Icon(Icons.thumb_up, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "65M",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: Icon(Icons.thumb_down, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("3.8K",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child:
                                    Icon(Icons.screen_share, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "share",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child:
                                    Icon(Icons.file_download, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Download",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child:
                                    Icon(Icons.library_add, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 2,
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            backgroundImage:
                                NetworkImage(data[index]["ProfileiconURL"])),
                        title: Text(data[index]["Name"]),
                        subtitle: Text("12.6M subscriber"),
                        trailing: Text(
                          "SUBSCRIBE",
                          style: TextStyle(
                            color: Colors.red[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Container(
                        
                        child: ListView.builder(
                          shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  Container(
                                      child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlayVideos(data, index)));
                                    },
                                    child: Image(
                                      width: double.infinity,
                                      image: NetworkImage(
                                          data[index]['ThumbmnilURL']),
                                    ),
                                  )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(
                                                data[index]['ProfileiconURL']),
                                          )),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 72,
                                                            bottom: 6,
                                                            top: 10),
                                                    child: Text(
                                                      "${(data[index]['Title'])}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Text(
                                                        "${data[index]['Name']}  ·  ${data[index]['Views']}  ·  ${data[index]['Day']}"),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        color: Colors.grey,
                                        icon: Icon(Icons.more_vert),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    ));
  }
}
