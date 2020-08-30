import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import 'ProjectSetup.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> actions = [
    "Blank project",
    "Team tasks",
    "Social media plan",
    "Sales campaign",
    "Design process",
    "High level plan",
  ];

  List<String> urls = [
    "",
    "https://i.ibb.co/wKNLZc8/teamtasks.jpg",
    "https://i.ibb.co/TMCcXSG/socialmediaplan.jpg",
    "https://i.ibb.co/LZhqCQn/salescampaign.jpg",
    "https://i.ibb.co/YWdSd2J/designprocess.jpg",
    "https://i.ibb.co/KrHk8sC/highlevelplan.jpg"
  ];

  Container _actionChip(Icon icon, String actionName) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300],
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text(
            actionName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "ProductSans",
              color: Colors.indigo[800],
            ),
          )
        ],
      ),
    );
  }

  Widget listTile(String url, String title, int index) {
    if (index == 0) {
      return GestureDetector(
        onTap: () => {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => ProjectSetup()))
        },
        child: Container(
          child: Column(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey,
                radius: Radius.circular(12),
                dashPattern: [5, 5, 5, 5],
                child: Container(
                  width: 128,
                  height: 128,
                  child: Icon(
                    Icons.add,
                    color: Colors.indigo[800],
                    size: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProductSans",
                  color: Colors.indigo[800],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10)),
            width: 130,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(url),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "ProductSans",
              color: Colors.indigo[800],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              children: [
                IconButton(
                  color: Colors.indigo[800],
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => {Navigator.pop(context)},
                ),
                Text(
                  "Choose your template",
                  style: TextStyle(
                      color: Colors.indigo[800],
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProductSans",
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _actionChip(
                    Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.indigo[800],
                    ),
                    "Search"),
                _actionChip(
                    Icon(
                      Icons.filter_list,
                      size: 20,
                      color: Colors.indigo[800],
                    ),
                    "Sort"),
              ],
            ),
          ),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return;
              },
              child: GridView.builder(
                itemCount: actions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) =>
                    listTile(urls[index], actions[index], index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
