import 'package:bai_giua_ky/UI/Bai11_ChiTietBaiBao.dart';
import 'package:bai_giua_ky/api/api_service.dart';
import 'package:bai_giua_ky/model/news.dart';
import 'package:flutter/material.dart';

class DSBaiBao extends StatefulWidget {
  const DSBaiBao({super.key});

  @override
  State<DSBaiBao> createState() => _DSBaiBaoState();
}

class _DSBaiBaoState extends State<DSBaiBao> {
  TextEditingController searchController = TextEditingController();
  List<Articles> allArticles = [];
  List<Articles> filteredArticles = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getAllNews();
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
                  child: Icon(Icons.newspaper, size: 24),
                ),
                SizedBox(width: 12),
                Text(
                  "Danh Sách Bài Báo",
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
    allArticles = res.articles;

    if (filteredArticles.isEmpty) {
      filteredArticles = allArticles;
    }
    return Column(
      children: [
        buildSearchBox(),
        Expanded(child: buildList()),
      ],
    );
  }

  Widget buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
      child: TextField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          setState(() {
            filteredArticles = allArticles.where((article) {
              return article.title.toLowerCase().contains(value.toLowerCase());
            }).toList();
          });
        },
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: "Tìm bài báo...",
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      filteredArticles = allArticles;
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildList() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: filteredArticles.length,
      itemBuilder: (context, index) {
        var item = filteredArticles[index];

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.urlToImage,
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 120,
                        height: 90,
                        color: Colors.grey[300],
                        child: Icon(Icons.image_not_supported),
                      ),
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
