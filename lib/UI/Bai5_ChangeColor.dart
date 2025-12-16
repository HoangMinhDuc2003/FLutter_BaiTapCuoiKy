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
        //Màu cho icon:
        iconTheme: const IconThemeData(color: Colors.white),

        //Màu cho background:
        elevation: 0,
        toolbarHeight: 60,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A73E8), Color.fromARGB(255, 255, 255, 255)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        //Title nằm ở đây nè:
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.change_circle, size: 24),
                ),
                SizedBox(width: 12),
                Text(
                  "Change Colors",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
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
