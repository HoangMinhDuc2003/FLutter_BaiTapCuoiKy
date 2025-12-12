import 'package:bai_giua_ky/Bai12_ThongTin.dart';
import 'package:bai_giua_ky/api_service.dart';
import 'package:bai_giua_ky/model/logins.dart';
import 'package:flutter/material.dart';

class DangNhapReal extends StatefulWidget {
  const DangNhapReal({super.key});

  @override
  State<DangNhapReal> createState() => _DangNhapState();
}

class _DangNhapState extends State<DangNhapReal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(Icons.login), SizedBox(width: 5), Text("Đăng Nhập")],
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(child: MyBody()),
    );
  }

  //Lấy thông tin từ khung:
  final txtUser = TextEditingController();
  final txtPass = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  Widget MyBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(right: 100, left: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Khung nhập tài khoản:
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: txtUser,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Nhập tài khoản',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tài khoản!';
                  }
                  return null;
                },
              ),
            ),
            //Khung nhập mật khẩu:
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: txtPass,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Nhập mật khẩu',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
            ),
            //Nút đăng nhập:
            ElevatedButton.icon(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    LoginResponse lr = await api.Login(
                      txtUser.text.trim(),
                      txtPass.text.trim(),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ThongTin(lr: lr)),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Đăng nhập thất bại, sai tài khoản hoặc mật khẩu",
                        ),
                      ),
                    );
                  }
                }
              },
              icon: Icon(Icons.person, size: 22),
              label: Text(
                "Đăng nhập",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
