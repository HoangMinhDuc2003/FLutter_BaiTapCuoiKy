import 'package:flutter/material.dart';

class HoangMacSahara extends StatelessWidget {
  const HoangMacSahara({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar ở đây:
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.wb_sunny),
            SizedBox(width: 10),
            Text("Hoang Mạc Sahara"),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),

      //Body ở đây:
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                blockImage(),
                SizedBox(height: 20),
                blockTitle(),
                SizedBox(height: 25),
                blockActions(),
                SizedBox(height: 25),
                blockDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget blockImage() {
    var src =
        "https://images.unsplash.com/photo-1489573280374-2e193c63726c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        src,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget blockTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "HOANG MẠC SAHARA",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 4),
            Text(
              "Phía bắc Châu Phi",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 28),
            SizedBox(width: 4),
            Text("4.1", style: TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }

  Widget buildButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }

  Widget blockActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(Icons.phone, "CALL", Colors.blue),
        buildButton(Icons.navigation, "ROUTE", Colors.green),
        buildButton(Icons.share, "SHARE", Colors.orange),
      ],
    );
  }

  Widget blockDescription() {
    var str =
        "Trong suốt kỷ nguyên băng hà, vùng Sahara đã từng ẩm ướt hơn ngày nay rất nhiều. "
        "Và cũng đã từng có rất nhiều loài động, thực vật sinh sống nơi đây. Tuy nhiên ngày nay, "
        "ngoại trừ vùng thung lũng sông Nin là có thể trồng được nhiều rau và một số ít nơi khác "
        "như vùng cao nguyên phía Bắc, gần Địa Trung Hải là có thể trồng cây ôliu "
        "còn phần lớn vùng này không thể canh tác được.";

    return Text(
      str,
      style: TextStyle(fontSize: 16, height: 1.5),
      textAlign: TextAlign.justify,
    );
  }
}
