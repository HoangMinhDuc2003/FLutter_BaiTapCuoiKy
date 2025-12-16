import 'dart:async';

import 'package:flutter/material.dart';

class DemThoiGian extends StatefulWidget {
  const DemThoiGian({super.key});

  @override
  State<DemThoiGian> createState() => _DemThoiGianState();
}

class _DemThoiGianState extends State<DemThoiGian> {
  final TextEditingController txtSoGiay = TextEditingController();
  Timer? _timer;
  int _soGiayConLai = 0;
  bool _dangDem = false;

  @override
  void dispose() {
    _timer?.cancel();
    txtSoGiay.dispose();
    super.dispose();
  }

  void batDauDem() {
    if (_dangDem) return;

    final nhap = txtSoGiay.text.trim();
    if (nhap.isEmpty || int.tryParse(nhap) == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Vui lòng nhập số giây hợp lệ!")));
      return;
    }

    setState(() {
      _soGiayConLai = int.parse(nhap);
      _dangDem = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_soGiayConLai > 0) {
        setState(() {
          _soGiayConLai--;
        });
      } else {
        timer.cancel();
        setState(() {
          _dangDem = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("⏰ Đếm xong!")));
      }
    });
  }

  void datLai() {
    _timer?.cancel();
    setState(() {
      _dangDem = false;
      _soGiayConLai = 0;
      txtSoGiay.clear();
    });
  }

  String dinhDangThoiGian(int giay) {
    final phut = (giay ~/ 60).toString().padLeft(2, '0');
    final giayCon = (giay % 60).toString().padLeft(2, '0');
    return "$phut:$giayCon";
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
                  child: Icon(Icons.timeline, size: 24),
                ),
                SizedBox(width: 12),
                Text(
                  "Bộ Đếm Thời Gian",
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
      body: SafeArea(child: MyBody()),
    );
  }

  Widget MyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Nhập số giây cần đếm"),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: txtSoGiay,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nhập số giây...",
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            dinhDangThoiGian(_soGiayConLai),
            style: TextStyle(
              fontSize: 70,
              color: _soGiayConLai > 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: batDauDem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                icon: Icon(Icons.play_arrow),
                label: Text("Bắt đầu"),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: datLai,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                icon: Icon(Icons.refresh),
                label: Text("Đặt lại"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
