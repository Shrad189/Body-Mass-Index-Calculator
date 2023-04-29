import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wt = TextEditingController();
  var ht = TextEditingController();
  String w = "";
  String h = "";
  String res = "Your result is: ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(120, 210, 190, 140),
          child: ListView(
            children: [
              _buildDrawerLayout(),
              ListTile(
                leading: Icon(
                  Icons.bar_chart,
                  size: 35,
                ),
                title: Text(
                  'Charts',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.update,
                  size: 35,
                ),
                title: Text('Progress', style: TextStyle(fontSize: 20)),
              ),
              ListTile(
                title: Text('Diet', style: TextStyle(fontSize: 20)),
                leading: Icon(
                  Icons.food_bank,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Body Mass Index',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'Schyler',
            color: Color.fromARGB(220, 74, 4, 4),
          ),
        ),
        backgroundColor: Color.fromARGB(120, 210, 190, 140),
      ),
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BMI',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: wt,
                decoration: const InputDecoration(
                    icon: Icon(Icons.line_weight),
                    label: Text(
                      'Enter weight (lb)',
                      style: TextStyle(fontSize: 15),
                    )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ht,
                decoration: InputDecoration(
                    icon: Icon(Icons.height),
                    label: const Text(
                      'Enter height (inches)',
                      style: TextStyle(fontSize: 15),
                    )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                      elevation: MaterialStateProperty.all(10),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(120, 210, 190, 140)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)))),
                  onPressed: () {
                    debugPrint('This is a method');
                    w = wt.text;
                    h = ht.text;
                    debugPrint(w);
                    debugPrint(h);
                    if (w != "" && h != "") {
                      var wtt = double.parse(w);
                      var htt = double.parse(h);

                      double bmi = (wtt / htt) * 703;
                      setState(() {
                        res = "Your BMI: (${bmi.toStringAsPrecision(2)})";
                      });
                    } else {
                      setState(() {
                        res = "Enter Details";
                      });
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 17, color: Colors.brown),
                  )),
              Text(res)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerLayout() {
    return DrawerHeader(
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.brown,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(' Profile', style: TextStyle(fontSize: 20))],
            )
          ],
        ),
      ),
    );
  }
}
