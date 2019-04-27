import 'package:clonewhatsapp/popmenu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      theme: ThemeData(primaryColor: Colors.teal[700]),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List<PopMenu> choices = <PopMenu>[
  PopMenu(title: "New group"),
  PopMenu(title: "New broadcast"),
  PopMenu(title: "WhatsApp Web"),
  PopMenu(title: "Starred Messages"),
  PopMenu(title: "Settings"),
];

class _MyAppState extends State<MyApp> {
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsSelected) {
            return <Widget>[
              SliverAppBar(
                title: Text("WhatsApp"),
                pinned: true,
                floating: true,
                actions: <Widget>[
                  Icon(Icons.search),
                  PopupMenuButton<PopMenu>(
                    initialValue: choices[1],
                    itemBuilder: (BuildContext context) {
                      return choices.map((PopMenu choice) {
                        return PopupMenuItem<PopMenu>(
                          value: choice,
                          child: Text(choice.title),
                        );
                      }).toList();
                    },
                  )
                ],
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.photo_camera),
                    ),
                    Tab(
                      text: "CHAT",
                    ),
                    Tab(
                      text: "STATUS",
                    ),
                    Tab(
                      text: "CALLS",
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
