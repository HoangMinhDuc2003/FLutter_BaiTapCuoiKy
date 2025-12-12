import 'package:bai_giua_ky/Bai10_AppShoppe.dart';
import 'package:bai_giua_ky/Bai11_DanhSachBaiBao.dart';
import 'package:bai_giua_ky/Bai12_DangNhap.dart';
import 'package:bai_giua_ky/Bai4_Booking.dart';
import 'package:bai_giua_ky/Bai5_ChangeColor.dart';
import 'package:bai_giua_ky/Bai2_ClassRoom.dart';
import 'package:bai_giua_ky/Bai6_DemSo.dart';
import 'package:bai_giua_ky/Bai1_HoangMacSahara.dart';
import 'package:bai_giua_ky/Bai3_WelcomeCharlie.dart';
import 'package:bai_giua_ky/Bai7_DemThoiGian.dart';
import 'package:bai_giua_ky/Bai8_DangNhap.dart';
import 'package:bai_giua_ky/Bai9_DangKy.dart';
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
      title: Row(
        children: [
          Icon(Icons.home_work),
          SizedBox(width: 10),
          Text("Bài Tập Cuối Kỳ"),
        ],
      ),
      centerTitle: true,
      elevation: 2,
    ),
    drawer: Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
              ),
            ),
            accountName: Text(
              "Hoàng Đức",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("hoangminhduc21052003@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/1.jpg'),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: baiTap.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(iconList[index], color: Colors.blue),
                    ),
                    title: Text(
                      tenBaiTap[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
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
    body: Center(
      child: Text("Chọn bài tập trong Drawer", style: TextStyle(fontSize: 18)),
    ),
  );
}
