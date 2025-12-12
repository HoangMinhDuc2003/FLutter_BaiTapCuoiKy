import 'package:bai_giua_ky/api_service.dart';
import 'package:bai_giua_ky/model/product.dart';
import 'package:flutter/material.dart';

class AppShoppe extends StatefulWidget {
  const AppShoppe({super.key});

  @override
  State<AppShoppe> createState() => _AppShoppeState();
}

class _AppShoppeState extends State<AppShoppe> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // //Appbar ở đây:
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SizedBox(width: 5),
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 5),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Áo phông nam",
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt_outlined, color: Colors.grey),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(3.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.message_outlined, color: Colors.white),
            ),
          ),
        ],
      ),

      //body ở đây
      body: SafeArea(
        child: FutureBuilder(
          future: api.getAllProduct(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            } else if (snap.hasError) {
              return Center(child: Text("Lỗi kết nối!"));
            } else if (!snap.hasData || snap.data!.isEmpty) {
              return Center(child: Text("Không có dữ liệu!"));
            } else {
              return myListProduct(snap.data!);
            }
          },
        ),
      ),

      //bottomNavigationBar ở đây:
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_outlined, color: Colors.black),
            label: "Xu hướng",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
            label: "Mall",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv_outlined, color: Colors.black),
            label: "Live",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            label: "Thông báo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined, color: Colors.black),
            label: "Tôi",
          ),
        ],
      ),
    );
  }

  Widget myListProduct(List<Product> lstProduct) {
    final width = MediaQuery.of(context).size.width;
    final itemWidth = (width - 30) / 2;
    final itemHeight = itemWidth + 90;
    final ratio = itemWidth / itemHeight;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: ratio,
        ),
        itemCount: lstProduct.length,
        itemBuilder: (context, index) {
          Product product = lstProduct[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Ảnh của sản phẩm
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image.network(product.image, fit: BoxFit.contain),
                  ),
                ),

                //Tên sản phẩm
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    child: Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                //Gía và đánh giá số sao sản phẩm
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 8,
                    left: 8,
                    bottom: 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${product.price} đ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      Spacer(), //để đẩy sao với đã bán sang bên phải
                      Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.yellow),
                          Text(
                            product.rating.rate.toString(),
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            " | ",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            "Đã bán ${product.rating.count}",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
