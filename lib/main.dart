import 'package:flutter/material.dart';
import 'package:flutter_musicplayer/theme.dart';
import 'package:flutter_musicplayer/song.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicPlayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MusicPlayer(),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayer createState() => new _MusicPlayer();
}

class _MusicPlayer extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(
            Icons.menu,
          ),
          color: const Color(0xFFDDDDDD),
          onPressed: () {},
        ),
        title: new Text(''),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.menu,
            ),
            color: const Color(0xFFDDDDDD),
            onPressed: () {},
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new Center(
              child: new Container(
                width: 125.0,
                height: 125.0,
                child: new ClipOval(
                  clipper: new CircleClipper(),
                  child: new Image.network(
                    DemoPlayList.songs[0].albumArtUrl,
                    fit: BoxFit.cover
                  ),
                ),
              ) ,
            ),
          ),
          new Container(
            width: double.infinity,
            height: 125.0,
          ),
          new Container(
              color: accentColor,
              child: new Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
                  child: new Column(
                    children: <Widget>[
                      new RichText(
                        text: new TextSpan(text: '', children: [
                          new TextSpan(
                              text: 'Song Title\n',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4.0,
                                height: 1.5,
                              )),
                          new TextSpan(
                            text: "Artist Name",
                            style: new TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              height: 1.5,
                            ),
                          ),
                        ]),
                      ),
                      new Row()
                    ],
                  ))),
          new Column(
            children: <Widget>[
              new RichText(
                text: new TextSpan(text: '', children: [
                  new TextSpan(
                      text: 'Song Title\n',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4.0,
                        height: 1.5,
                      )),
                  new TextSpan(
                    text: "Artist Name",
                    style: new TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 12.0,
                      letterSpacing: 3.0,
                      height: 1.5,
                    ),
                  ),
                ]),
              ),
              new Row(
                children: <Widget>[

                  new Expanded(child: new Container()),

                  new IconButton(
                    icon: new Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () {},
                  ),

                  new Expanded(child: new Container()),
                  new RawMaterialButton(
                    shape: new CircleBorder(),
                    fillColor: Colors.white,
                    splashColor: lightAccentColor,
                    highlightColor: lightAccentColor.withOpacity(0.5),
                    elevation: 10.0,
                    highlightElevation: 5.0,
                    onPressed: (){

                    },
                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(
                      Icons.play_arrow,
                      color: DarkAccentColor,
                      size: 35.0,
                    ),
                  ),
                  ),
                  new Expanded(child: new Container()),

                  new IconButton(
                    icon: new Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}