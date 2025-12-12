import 'package:bai_giua_ky/model/news.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChiTietBaiBao extends StatelessWidget {
  final Articles article;

  const ChiTietBaiBao({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.newspaper),
            SizedBox(width: 5),
            Text("Chi tiết bài viết"),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ảnh lớn
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.urlToImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stack) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported, size: 50),
                    );
                  },
                ),
              ),

              SizedBox(height: 12),

              // Tiêu đề
              Text(
                article.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),
              Text(
                formatDate(article.publishedAt),
                style: TextStyle(color: Colors.grey[600]),
              ),

              SizedBox(height: 12),
              Text(article.description, style: TextStyle(fontSize: 16)),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse(article.url);

                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception("Không mở được link $url");
                  }
                },
                child: Text(
                  "Xem chi tiết tại nguồn",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm format ngày:
  String formatDate(String dateStr) {
    try {
      DateTime date = DateTime.parse(dateStr);
      return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
    } catch (e) {
      return "";
    }
  }
}
