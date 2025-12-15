import 'package:flutter/material.dart';

class DemSo extends StatefulWidget {
  const DemSo({super.key});

  @override
  State<DemSo> createState() => _DemSoState();
}

class _DemSoState extends State<DemSo> {
  var x = 0;
  void Tang() {
    setState(() {
      x += 1;
    });
  }

  void Giam() {
    setState(() {
      x -= 1;
    });
  }

  void Reset() {
    setState(() {
      x = 0;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar ở đây:
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.add_circle),
            SizedBox(width: 10),
            Text("Ứng dụng Đếm Số"),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),

      //Body ở đây:
      body: SafeArea(child: MyBody()),
    );
  }

  Widget MyBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Giá trị hiện tại:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          x.toString(),
          style: TextStyle(
            fontSize: 100,
            color: const Color.fromARGB(255, 255, 17, 0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: Giam,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(Icons.remove),
                    SizedBox(width: 5),
                    Text("Giảm"),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: Reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 99, 99, 99),
                foregroundColor: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.refresh),
                  SizedBox(width: 5),
                  Text("Reset"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                onPressed: Tang,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  children: [Icon(Icons.add), SizedBox(width: 5), Text("Tăng")],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
