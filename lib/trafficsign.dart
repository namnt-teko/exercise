import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrafficSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Các biển báo";

    List<TrafficSignData> trafficItems = [
      TrafficSignData.fillData("title", "iconUrl", "description"),
      TrafficSignData.fillData("title1", "iconUrl1", "description1"),
      TrafficSignData.fillData("title2", "iconUrl2", "description2"),
      TrafficSignData.fillData("title3", "iconUrl3", "description3"),
    ];

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.green,
          toolbarHeight: 70,
          leading: IconButton(
            icon: const Icon(IconData(0xe5a7,
                fontFamily: 'MaterialIcons', matchTextDirection: true)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TrafficsSignBody(trafficItems),
        // body: ,
      ),
    );
  }
}

class TrafficsSignBody extends StatelessWidget {
  List<TrafficSignData> data = new List<TrafficSignData>();

  TrafficsSignBody(List<TrafficSignData> data) {
    this.data = data;
  }

  List<TrafficSignItem> buildItems(BuildContext context) {
    List<TrafficSignItem> items = new List<TrafficSignItem>();
    this.data.forEach((element) {
      items.add(TrafficSignItem(element));
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: buildItems(context),
      ),
    );
  }
}

class TrafficSignData {
  String title;
  String iconUrl;
  String description;

  TrafficSignData() {
    this.title = "";
    this.iconUrl = "";
    this.description = "";
  }

  TrafficSignData.fillData(String title, String iconUrl, String description) {
    this.title = title;
    this.iconUrl = iconUrl;
    this.description = description;
  }
}

class TrafficSignItem extends StatelessWidget {
  TrafficSignData data;

  TrafficSignItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1, child: Icon(IconData(59495, fontFamily: 'MaterialIcons'))),
        Expanded(
          flex: 4,
          child: Column(
            children: <Widget>[
              Text(
                data.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                data.description,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
            height: 50,
          ),
        )
      ],
    );
  }
}
