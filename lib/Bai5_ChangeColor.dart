import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  Color bgColor = Colors.black;
  List<Color> lsColor = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.pink,
    Colors.teal,
    Colors.teal,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      var random = Random();
      bgColor = lsColor[random.nextInt(lsColor.length)];
    });
  }

  void _ChangeRandomColor() {
    setState(() {
      var random = Random();
      bgColor = lsColor[random.nextInt(lsColor.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar ở đây:
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.change_circle),
            SizedBox(width: 10),
            Text("Change Colors"),
          ],
        ),
        centerTitle: true,
      ),

      //Body ở đây:
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: bgColor),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Column(
                      children: [
                        Text(
                          "Bấm vào đây để đổi màu: ",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _ChangeRandomColor,
                          child: Text("Change"),
                        ),
                      ],
                    ),
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
