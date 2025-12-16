import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

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
                  child: Icon(Icons.calendar_today, size: 24),
                ),
                SizedBox(width: 12),
                Text(
                  "Booking.com",
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

  Widget MyBody() {
    return ListView(
      children: [
        Block1(),
        SizedBox(height: 45),
        Block2(),
        Block3(),
        Block4(),
        Block5(),
        Block6(),
        Block4(),
      ],
    );
  }

  //Block 1 chưa Xung quanh vị trí....
  Widget Block1() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(height: 100, color: const Color.fromARGB(255, 0, 96, 175)),
        Positioned(top: 70, left: 16, right: 16, child: block11()),
      ],
    );
  }

  Widget block11() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange, width: 3),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: const [
                Icon(Icons.arrow_back, color: Colors.black),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Xung quanh vị trí hiện tại",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Text("23 thg 10 – 24 thg 10", style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  Widget Block2() {
    return Row(
      children: [
        Flexible(child: option(Icons.sort, "Sắp xếp")),
        Flexible(child: option(Icons.tune, "Lọc")),
        Flexible(child: option(Icons.map, "Bản đồ")),
      ],
    );
  }

  Widget option(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(width: 5),
        Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget Block3() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      child: Text(
        "757 chỗ nghỉ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget Block4() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh nhà:
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text(
                        "Bao bữa sáng",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Image.network(
                      "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                      fit: BoxFit.cover,
                      height: 167,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),
            // Thông tin:
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Tên nhà:
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "aNhill Boutique",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                  SizedBox(height: 6),

                  // Số sao:
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, size: 16, color: Colors.amber),
                    ),
                  ),

                  SizedBox(height: 6),

                  // Số đánh giá:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 78, 156),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "9,5",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Xuất sắc · 95 đánh giá",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),

                  // Vị trí:
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      SizedBox(width: 4),
                      Text("Huế", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 5),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Cách bạn 0.6 km",
                          style: TextStyle(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  //Thông tin:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "1 suite riêng tư:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(" 1 giường", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 12),

                  // Giá cả:
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "US\$109",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Đã bao gồm thuế và phí",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Block5() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh ở đây:
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text(
                        "Bao bữa sáng",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Image.network(
                      "https://images.unsplash.com/photo-1505691723518-36a5ac3be353?q=80&w=1170&auto=format&fit=crop",
                      fit: BoxFit.cover,
                      height: 167,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),

            // Thông tin ở đây:
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "An Nam Hue Boutique",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, size: 16, color: Colors.amber),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 78, 156),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "9,2",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Tuyệt hảo · 34 đánh giá",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      SizedBox(width: 4),
                      Text("Cư Chinh", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 5),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Cách bạn 0.9 km",
                          style: TextStyle(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "1 phòng khách sạn:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          " 1 giường",
                          style: TextStyle(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "US\$20",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Đã bao gồm thuế và phí",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Block6() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh nhà:
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1570129477492-45c003edd2be?q=80&w=1170&auto=format&fit=crop",
                    fit: BoxFit.cover,
                    height: 285,
                  ),
                ),
              ),
            ),

            SizedBox(width: 12),

            // Thông tin:
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Hue Jade Hill Villa",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Được quản lý bởi 1 host cá nhân",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 78, 156),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "8.0",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Rất tốt · 1 đánh giá",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      SizedBox(width: 4),
                      Text("Cư Chinh", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 5),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Cách bạn 1.3 km",
                          style: TextStyle(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "1 biệt thự nguyên căn - 1000m²",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "4 giường · 3 phòng ngủ · 1 phòng khách · 3 phòng tắm",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "US\$109",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Đã bao gồm thuế và phí",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Chỉ còn 1 căn với giá này",
                          style: TextStyle(color: Colors.red),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "✓ Không cần thanh toán trước",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
