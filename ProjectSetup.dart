import 'package:flutter/material.dart';

class ProjectSetup extends StatefulWidget {
  @override
  _ProjectSetupState createState() => _ProjectSetupState();
}

class _ProjectSetupState extends State<ProjectSetup> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                    "Project info",
                    style: TextStyle(
                        color: Colors.indigo[800],
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProductSans",
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.title,
            //         color: Colors.indigo[800],
            //       ),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       Text(
            //         "Project title",
            //         style: TextStyle(
            //             fontFamily: 'ProductSans',
            //             fontSize: 16,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.indigo[800]),
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                cursorColor: Colors.indigo[800],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Your project title'),
                style: TextStyle(fontFamily: 'ProductSans', fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.indigo[800],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Start and end date",
                    style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[800]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                cursorColor: Colors.indigo[800],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: IconButton(
                      onPressed: () => {
                        showDatePicker(
                                context: context,
                                initialDate: _selectedDate,
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101))
                            .then((value) => null)
                      },
                      icon: Icon(
                        Icons.calendar_today,
                        size: 16,
                      ),
                      color: Colors.indigo[800],
                    ),
                    hintText: 'Start date - End date'),
                style: TextStyle(fontFamily: 'ProductSans', fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.indigo[800],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Project description",
                    style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[800]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                maxLines: 5,
                cursorColor: Colors.indigo[800],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Add a description'),
                style: TextStyle(fontFamily: 'ProductSans', fontSize: 16),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              color: Colors.indigo[800],
              onPressed: () => {},
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontFamily: 'ProductSans',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
}
