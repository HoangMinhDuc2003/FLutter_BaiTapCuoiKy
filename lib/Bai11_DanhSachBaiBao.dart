import 'package:bai_giua_ky/Bai11_ChiTietBaiBao.dart';
import 'package:bai_giua_ky/api_service.dart';
import 'package:bai_giua_ky/model/news.dart';
import 'package:flutter/material.dart';

class DSBaiBao extends StatefulWidget {
  const DSBaiBao({super.key});

  @override
  State<DSBaiBao> createState() => _DSBaiBaoState();
}

class _DSBaiBaoState extends State<DSBaiBao> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar ở đây:
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.newspaper),
            SizedBox(width: 5),
            Text("Danh sách bài báo"),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),

      //Body ở đây:
      body: SafeArea(
        child: FutureBuilder(
          future: api.getAllNews(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            } else if (snap.hasError) {
              return Center(child: Text("Lỗi kết nối!"));
            } else if (!snap.hasData) {
              return Center(child: Text("Không có dữ liệu"));
            } else {
              return MyBody(snap.data!);
            }
          },
        ),
      ),
    );
  }

  Widget MyBody(News res) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: res.articles.length,
      itemBuilder: (context, index) {
        var item = res.articles[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChiTietBaiBao(article: item),
              ),
            );
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  // ẢNH BÊN TRÁI
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.urlToImage,
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) {
                        return Container(
                          width: 120,
                          height: 90,
                          color: Colors.grey[300],
                          child: Icon(Icons.image_not_supported, size: 40),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          item.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                        SizedBox(height: 6),
                        Text(
                          formatDate(item.publishedAt),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String formatDate(String dateStr) {
    try {
      DateTime date = DateTime.parse(dateStr);
      return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
    } catch (e) {
      return "";
    }
  }
}
