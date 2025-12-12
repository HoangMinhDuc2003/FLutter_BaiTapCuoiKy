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
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.timeline),
            SizedBox(width: 10),
            Text("Bộ Đếm Thời Gian"),
          ],
        ),
        centerTitle: true,
        elevation: 2,
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
