import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeCharlie extends StatelessWidget {
  const WelcomeCharlie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.waving_hand),
            SizedBox(width: 10),
            Text("Welcome Charlie"),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(child: MyBody()),
    );
  }

  Widget MyBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Block1(),
          SizedBox(height: 50),
          Block2(),
          SizedBox(height: 20),
          Block3(),
          SizedBox(height: 50),
          Block4(),
          SizedBox(height: 10),
          Block5(),
        ],
      ),
    );
  }

  Widget Block1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.puzzlePiece)),
      ],
    );
  }

  Widget Block2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "WELCOME,\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              TextSpan(text: "Charlie", style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
      ],
    );
  }

  Widget Block3() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      ),
    );
  }

  Widget Block4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Saved Places",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Widget Block5() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1.4,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/1.png', fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/3.png', fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/4.png', fit: BoxFit.cover),
        ),
      ],
    );
  }
}
