import 'package:exercise/trafficsign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

void navigateToTrafficSigns(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TrafficSign()),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Thi bằng lái xe';
    final listText = [
      "Thi theo đề",
      "Đề ngẫu nhiên",
      "Các biển báo",
      "Option",
      "Option",
      "Option"
    ];
    final listColor = [
      Colors.blue,
      Colors.deepPurpleAccent,
      Colors.redAccent,
      Colors.lightBlueAccent,
      Colors.greenAccent,
      Colors.yellowAccent
    ];
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.green,
          toolbarHeight: 70,
          leading: IconButton(
            icon: const Icon(IconData(59495, fontFamily: 'MaterialIcons')),
            onPressed: () => navigateToTrafficSigns(context),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return MainFeature(listColor[index], listText[index]);
          }),
        ),
      ),
    );
  }
}

class MainFeature extends StatelessWidget {
  MainFeature(ColorSwatch color, String text) {
    this._color = color;
    this._text = text;
  }

  ColorSwatch _color;
  String _text;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => navigateToTrafficSigns(context),
      child: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.all(
                Radius.circular(15)
            )
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 100,
            ),
            Text(
              _text,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
