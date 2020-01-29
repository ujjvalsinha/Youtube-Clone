import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

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
            delegate: SliverChildListDelegate(<Widget>[
              ListTile(
                leading: Icon(
                  Icons.history,
                  size: 28,
                ),
                title: Text("History", style: TextStyle(fontSize: 16)),
              ),
              ListTile(
                leading: Icon(
                  Icons.file_download,
                  size: 28,
                ),
                title: Text(
                  "Download",
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text("31 recommendations"),
              ),
              ListTile(
                leading: Icon(
                  Icons.play_circle_outline,
                  size: 28,
                ),
                title: Text(
                  "My Videos",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.local_offer,
                  size: 28,
                ),
                title: Text(
                  "Purchases",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.watch_later,
                  size: 28,
                ),
                title: Text(
                  "Watch Later",
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text("76 unwatched videos"),
              ),
              ListTile(
                leading: Icon(
                  Icons.brightness_4,
                  size: 28,
                ),
                title: Text(
                  "Change Theme",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  changeBrightness();
                },
              ),
              Container(
                height: 0.60,
                width: double.infinity,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Playlists"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Recently added "),
                  )
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.add,
                  color: Colors.blue[800],
                ),
                title: Text(
                  "Liked Videos",
                  style: TextStyle(
                      color: Colors.blue[800], fontWeight: FontWeight.bold),
                ),
                subtitle: Text("680 Videos"),
              ),
              ListTile(
                leading: Image(
                  height: 150,
                  width: 80,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXGEF62UOSrh5Ph3KA_MI7Mf9LO9vXgVwyWWJ3Mqk5f4817UW6_w&s"),
                ),
                title: Text(
                    "Kamaal Song|Uchana Amit|ft.|Badshah|Alina|New Hindi Song|Punjabi Songs 2019"),
                subtitle: Text("T-Series - 34 Videos"),
              ),
              ListTile(
                leading: Image(
                  height: 150,
                  width: 80,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv-_c-M-RxF_wGRnaYHZ4-WzT_a5BaqyTb24QyT61KUX0Wwp-dSw&s"),
                ),
                title: Text("Best New Songs of the Week - January 25, 2020"),
                subtitle: Text("T-Series - 34 Videos"),
              ),
              ListTile(
                leading: Image(
                  height: 150,
                  width: 80,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXGEF62UOSrh5Ph3KA_MI7Mf9LO9vXgVwyWWJ3Mqk5f4817UW6_w&s"),
                ),
                title: Text("Vilen - Ek Raat (Official Video"),
                subtitle: Text("GeetMp3 - 19 Videos"),
              ),
              ListTile(
                leading: Image(
                  height: 150,
                  width: 80,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv-_c-M-RxF_wGRnaYHZ4-WzT_a5BaqyTb24QyT61KUX0Wwp-dSw&s"),
                ),
                title: Text("Vilen - Ek Raat (Official Video"),
                subtitle: Text("Vilen - 19 Videos"),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
