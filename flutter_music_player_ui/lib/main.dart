import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player UI',
      theme: ThemeData(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
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
                    image: NetworkImage("https://images.pexels.com/photos/2170387/pexels-photo-2170387.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.width*0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Albuns title",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text("Singer Name, Label"),
              SizedBox(height: 20),
              Slider(
                value: 10,
                onChanged: (v) {},
                max: 100,
                min: 0,
                activeColor: Color(0xFF5E3581),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.repeat),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_previous),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow),
                    iconSize: 80,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_next),
                  ),
                  IconButton(
                    onPressed: () {},
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
