import 'package:bai_giua_ky/UI/Bai10_AppShoppe.dart';
import 'package:bai_giua_ky/UI/Bai11_DanhSachBaiBao.dart';
import 'package:bai_giua_ky/UI/Bai12_DangNhap.dart';
import 'package:bai_giua_ky/UI/Bai4_Booking.dart';
import 'package:bai_giua_ky/UI/Bai5_ChangeColor.dart';
import 'package:bai_giua_ky/UI/Bai2_ClassRoom.dart';
import 'package:bai_giua_ky/UI/Bai6_DemSo.dart';
import 'package:bai_giua_ky/UI/Bai1_HoangMacSahara.dart';
import 'package:bai_giua_ky/UI/Bai3_WelcomeCharlie.dart';
import 'package:bai_giua_ky/UI/Bai7_DemThoiGian.dart';
import 'package:bai_giua_ky/UI/Bai8_DangNhap.dart';
import 'package:bai_giua_ky/UI/Bai9_DangKy.dart';
import 'package:flutter/material.dart';

class List_BaiTap extends StatelessWidget {
  const List_BaiTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListBaiTap();
  }
}

Widget ListBaiTap() {
  List<Widget> baiTap = [
    HoangMacSahara(),
    ClassRoom(),
    WelcomeCharlie(),
    Booking(),
    ChangeColor(),
    DemSo(),
    DemThoiGian(),
    DangNhap(),
    DangKy(),
    AppShoppe(),
    DSBaiBao(),
    DangNhapReal(),
  ];
  List<String> tenBaiTap = [
    "Bài 1: Hoang Mạc Sahara",
    "Bài 2: Class Room",
    "Bài 3: Welcome Charlie",
    "Bài 4: Booking.com",
    "Bài 5: Change Color",
    "Bài 6: Ứng Dụng Đếm Số",
    "Bài 7: Bộ Đếm Thời Gian",
    "Bài 8: Form Đăng Nhập",
    "Bài 9: Form Đăng Ký",
    "Bài 10: App Shoppe",
    "Bài 11: Danh Sách Bài Báo",
    "Bài 12: Thông Tin Người Dùng",
  ];
  List<IconData> iconList = [
    Icons.wb_sunny,
    Icons.class_,
    Icons.waving_hand,
    Icons.calendar_today,
    Icons.change_circle,
    Icons.exposure_plus_1,
    Icons.timeline,
    Icons.login,
    Icons.how_to_reg,
    Icons.shopping_bag,
    Icons.newspaper,
    Icons.verified_user,
  ];

  return Scaffold(
    appBar: AppBar(
      //Icon của drawer:
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.segment, size: 35),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),

      //Màu cho icon:
      iconTheme: const IconThemeData(color: Colors.white),

      //Màu cho background:
      elevation: 0,
      toolbarHeight: 60,
      centerTitle: true,
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
                child: Icon(Icons.home_work_rounded, size: 24),
              ),
              SizedBox(width: 12),
              Text(
                "BÀI TẬP CUỐI KỲ",
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
    drawer: Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // ===== HEADER =====
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A73E8), Color.fromARGB(255, 255, 255, 255)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('assets/images/1.jpg'),
                ),
                SizedBox(height: 12),
                Text(
                  "Hoàng Đức",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "hoangminhduc21052003@gmail.com",
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ),

          // ===== LIST BÀI TẬP =====
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: baiTap.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),

                    // ICON
                    leading: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1A73E8), Color(0xFF4285F4)],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        iconList[index],
                        color: Colors.white,
                        size: 22,
                      ),
                    ),

                    // TITLE
                    title: Text(
                      tenBaiTap[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // TRAILING
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.grey,
                    ),

                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => baiTap[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),

    body: PageView.builder(
      itemCount: baiTap.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ICON BÀI TẬP
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconList[index], size: 70, color: Colors.blue),
                ),
                SizedBox(height: 30),

                // TÊN BÀI
                Text(
                  tenBaiTap[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),

                // MÔ TẢ NGẮN
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Vuốt sang trái hoặc phải để xem bài khác.\nNhấn nút bên dưới để vào chi tiết bài tập.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ),
                SizedBox(height: 40),

                // NÚT VÀO BÀI
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: Icon(Icons.play_arrow),
                  label: Text("VÀO BÀI", style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => baiTap[index]),
                    );
                  },
                ),

                SizedBox(height: 30),

                // GỢI Ý VUỐT
                Text(
                  "← Vuốt để chuyển bài →",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
