import 'package:bai_giua_ky/UI/Bai12_DangNhap.dart';
import 'package:bai_giua_ky/api/api_service.dart';
import 'package:bai_giua_ky/model/logins.dart';
import 'package:bai_giua_ky/model/user.dart';
import 'package:flutter/material.dart';

class ThongTin extends StatefulWidget {
  final LoginResponse lr;
  const ThongTin({super.key, required this.lr});

  @override
  State<ThongTin> createState() => _ThongTinState();
}

class _ThongTinState extends State<ThongTin> {
  late Future<User> userFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userFuture = api.getUser(widget.lr.accessToken);
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

        title: Row(
          children: [
            Icon(Icons.verified_user),
            SizedBox(width: 5),
            Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _logout(context);
            },
            icon: Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: userFuture,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            } else if (snap.hasError) {
              return Center(child: Text("Lỗi kết nối!: ${snap.error}"));
            } else if (!snap.hasData) {
              return Center(child: Text("Không có dữ liệu!"));
            } else {
              return MyHome(snap.data!);
            }
          },
        ),
      ),
    );
  }

  Widget MyHome(User user) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar + tên
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.image),
                ),
                SizedBox(height: 16),
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  user.email,
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Card thông tin cá nhân
          _buildCard(
            title: "Thông tin cá nhân",
            icon: Icons.person,
            children: [
              _infoRow("Tuổi", "${user.age}"),
              _infoRow("Giới tính", user.gender),
              _infoRow("SĐT", user.phone),
              _infoRow("Nhóm máu", user.bloodGroup),
            ],
          ),

          SizedBox(height: 20),

          _buildCard(
            title: "Sức khỏe",
            icon: Icons.monitor_heart,
            children: [
              _infoRow("Chiều cao", "${user.height} cm"),
              _infoRow("Cân nặng", "${user.weight} kg"),
            ],
          ),

          SizedBox(height: 20),

          _buildCard(
            title: "Địa chỉ",
            icon: Icons.location_on,
            children: [
              Text(
                "${user.address.address}, ${user.address.city}, ${user.address.state}, ${user.address.country}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),

          SizedBox(height: 20),

          _buildCard(
            title: "Công ty",
            icon: Icons.work,
            children: [
              Text(user.company.name, style: TextStyle(fontSize: 16)),
              Text(
                "${user.company.title} - ${user.company.department}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Card UI đẹp
  Widget _buildCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.orange),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  // Dòng thông tin
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(flex: 3, child: Text(value, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  // Hàm logout
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Đăng xuất"),
        content: Text("Bạn có chắc muốn đăng xuất không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DangNhapReal()),
              );
            },
            child: Text("Đăng xuất", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
