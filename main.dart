import 'package:flutter/material.dart';
import 'package:office/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Note: You need internet to load images",
              style: TextStyle(
                  color: Colors.indigo[800], fontFamily: "ProductSans"),
            ),
            MaterialButton(
              color: Colors.indigo[800],
              onPressed: () => {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => Dashboard()))
              },
              child: Text(
                "Start",
                style:
                    TextStyle(color: Colors.white, fontFamily: "ProductSans"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
