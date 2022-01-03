import 'package:flutter/material.dart';
import 'package:newsapp/model/news_papers.dart';
import 'package:newsapp/screens/webview/webview_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Bd All NewsPapers"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, WebviewScreen.routeName,
                    arguments: NewsPaper.newsPaper[index]);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    color: Colors.white),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Image(
                    image: AssetImage("asset/images/" +
                        NewsPaper.newsPaper[index].imageName!)),
              ),
            );
          },
          itemCount: NewsPaper.newsPaper.length,
        ));
  }
}
