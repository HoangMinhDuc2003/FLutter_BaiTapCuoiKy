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

  /// 🔔 Dialog hiện đại khi đếm xong
  void _showDoneDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.timer_off_rounded, size: 70, color: Colors.green),
                SizedBox(height: 16),
                Text(
                  "Hoàn thành!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Thời gian đã kết thúc",
                  style: TextStyle(color: Colors.grey[600], fontSize: 15),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          ),
        );
      },
    );
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

        // 🌟 Hiện dialog thay cho SnackBar
        _showDoneDialog();
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

  bool _pressedStart = false;
  bool _pressedResetTimer = false;

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
              _buildActionButton(
                label: "Bắt đầu",
                icon: Icons.play_arrow,
                colors: [Colors.greenAccent, Colors.green],
                pressed: _pressedStart,
                onTapDown: () => setState(() => _pressedStart = true),
                onTapUp: () {
                  setState(() => _pressedStart = false);
                  batDauDem();
                },
              ),

              SizedBox(width: 20),

              _buildActionButton(
                label: "Đặt lại",
                icon: Icons.refresh,
                colors: [Colors.orangeAccent, Colors.orange],
                pressed: _pressedResetTimer,
                onTapDown: () => setState(() => _pressedResetTimer = true),
                onTapUp: () {
                  setState(() => _pressedResetTimer = false);
                  datLai();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required List<Color> colors,
    required bool pressed,
    required VoidCallback onTapDown,
    required VoidCallback onTapUp,
  }) {
    return GestureDetector(
      onTapDown: (_) => onTapDown(),
      onTapUp: (_) => onTapUp(),
      onTapCancel: () => setState(() {}),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        transform: Matrix4.identity()..scale(pressed ? 0.95 : 1.0),
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: colors),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.4),
              blurRadius: pressed ? 5 : 14,
              offset: Offset(0, pressed ? 3 : 8),
            ),
          ],
        ),
        child: Row(
          children: [
            AnimatedRotation(
              turns: pressed ? 0.05 : 0,
              duration: Duration(milliseconds: 150),
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
