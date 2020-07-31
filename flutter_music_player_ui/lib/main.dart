import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player UI',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MusicPlayer(),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  MusicPlayer({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool isPress = false;
  bool isPressPlaylist = false;
  bool isPressLoop = false;
  double value = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      iconSize: 40,
                      onPressed: () {},
                      icon: Icon(Icons.chevron_left),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert), 
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x46000000),
                      offset: Offset(0, 28),
                      spreadRadius: 0,
                      blurRadius: 30,
                    ),
                    BoxShadow(
                      color: Color(0x11000000),
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/2170387/pexels-photo-2170387.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Album title",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text("Singer Name, Label"),
              SizedBox(height: 50),
              Slider(
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v;
                  });
                },
                max: 100,
                min: 0,
                activeColor: Color(0xFF5E3581),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    color: isPressLoop ? Colors.deepPurpleAccent : Colors.black,
                    iconSize: 35,
                    onPressed: () {
                      setState(() {
                        isPressLoop = !isPressLoop;
                      });
                    },
                    icon: isPressLoop ? Icon(Icons.repeat_one) : Icon(Icons.repeat) ,
                  ),
                  IconButton(
                    iconSize: 35,
                    onPressed: () {},
                    icon: Icon(Icons.skip_previous),
                  ),
                  IconButton(
                    color: Color(0xFF5E3581),
                    iconSize: 80,
                    onPressed: () {
                      setState(() {
                        isPress = !isPress;
                      });
                    },
                    icon: this.isPress
                        ? Icon(Icons.play_circle_outline)
                        : Icon(Icons.pause_circle_outline),
                  ),
                  IconButton(
                    iconSize: 35,
                    onPressed: () {},
                    icon: Icon(Icons.skip_next),
                  ),
                  IconButton(
                    color: this.isPressPlaylist
                        ? Colors.deepPurpleAccent
                        : Colors.black,
                    iconSize: 35,
                    onPressed: () {
                      setState(() {
                        isPressPlaylist = !isPressPlaylist;
                      });
                    },
                    icon: Icon(Icons.playlist_play),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
