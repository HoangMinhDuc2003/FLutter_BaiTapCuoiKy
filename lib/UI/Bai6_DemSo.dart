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
                  child: Icon(Icons.add_circle, size: 24),
                ),
                SizedBox(width: 12),
                Text(
                  "Ứng Dụng Đếm Số",
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
      body: SafeArea(child: MyBody()),
    );
  }

  bool _pressedGiam = false;
  bool _pressedReset = false;
  bool _pressedTang = false;

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
          children: [
            _buildActionButton(
              label: "Giảm",
              icon: Icons.remove,
              colors: [Colors.redAccent, Colors.red],
              pressed: _pressedGiam,
              onTapDown: () => setState(() => _pressedGiam = true),
              onTapUp: () {
                setState(() => _pressedGiam = false);
                Giam();
              },
            ),

            SizedBox(width: 12),

            _buildActionButton(
              label: "Reset",
              icon: Icons.refresh,
              colors: [Colors.grey, Colors.black54],
              pressed: _pressedReset,
              onTapDown: () => setState(() => _pressedReset = true),
              onTapUp: () {
                setState(() => _pressedReset = false);
                Reset();
              },
            ),

            SizedBox(width: 12),

            _buildActionButton(
              label: "Tăng",
              icon: Icons.add,
              colors: [Colors.greenAccent, Colors.green],
              pressed: _pressedTang,
              onTapDown: () => setState(() => _pressedTang = true),
              onTapUp: () {
                setState(() => _pressedTang = false);
                Tang();
              },
            ),
          ],
        ),
      ],
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
