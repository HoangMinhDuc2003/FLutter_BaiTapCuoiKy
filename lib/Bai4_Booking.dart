import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.calendar_today),
            SizedBox(width: 10),
            Text("Booking,com"),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),
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
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.black),
              SizedBox(width: 10),
              Text(
                "Xung quanh vị trí hiện tại",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text("23 thg 10 – 24 thg 10"),
        ],
      ),
    );
  }

  Widget Block2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(Icons.sort),
            SizedBox(width: 5),
            Text("Sắp xếp", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.tune),
            SizedBox(width: 5),
            Text("Lọc", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.map),
            SizedBox(width: 5),
            Text("Bản đồ", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
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
            // ================= LEFT: IMAGE =================
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 130,
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

            // ================= RIGHT: INFO =================
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + heart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "aNhill Boutique",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.favorite_border),
                    ],
                  ),

                  SizedBox(height: 6),

                  // ⭐⭐⭐⭐⭐
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber.shade600,
                      ),
                    ),
                  ),

                  SizedBox(height: 6),

                  // Rating
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 78, 156),
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
                      Row(
                        children: [
                          Text(
                            "Xuất sắc",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            " · 95 đánh giá",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 6),

                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      SizedBox(width: 4),
                      Text("Huế", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 5),
                      SizedBox(width: 6),
                      Text("Cách bạn 0.6 km", style: TextStyle(fontSize: 15)),
                    ],
                  ),

                  SizedBox(height: 8),

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

                  // Price
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
            // ================= LEFT: IMAGE =================
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 130,
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
                      "https://images.unsplash.com/photo-1505691723518-36a5ac3be353?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      fit: BoxFit.cover,
                      height: 167,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 12),

            // ================= RIGHT: INFO =================
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + heart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "An Nam Hue Boutique",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                  SizedBox(height: 6),

                  // Rating
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 78, 156),
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
                      Row(
                        children: [
                          Text(
                            "Tuyệt hảo",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            " · 34 đánh giá",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 6),

                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      SizedBox(width: 4),
                      Text("Cư Chinh", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 5),
                      SizedBox(width: 6),
                      Text("Cách bạn 0.9 km", style: TextStyle(fontSize: 15)),
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
                      Text(" 1 giường", style: TextStyle(fontSize: 15)),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Price
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
            // ================= LEFT: IMAGE =================
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 130,
                child: Image.network(
                  "https://images.unsplash.com/photo-1570129477492-45c003edd2be?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
            ),

            SizedBox(width: 12),

            // ================= RIGHT: INFO =================
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + heart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Hue Jade Hill Villa",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.favorite_border),
                    ],
                  ),

                  SizedBox(height: 6),

                  Text("Được quản lý bởi 1 host cá nhân"),

                  SizedBox(height: 6),

                  // Rating
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 78, 156),
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
                      Row(
                        children: [
                          Text(
                            "Rất tốt",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(" · 1 đánh giá", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 6),

                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      SizedBox(width: 4),
                      Text("Cư Chinh", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 5),
                      SizedBox(width: 6),
                      Text("Cách bạn 1.3 km", style: TextStyle(fontSize: 15)),
                    ],
                  ),

                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "1 biệt thư nguyên căn - 1000m2",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            " 4 giường · 3 phòng ngủ · 1 phòng",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "khách · 3 phòng tắm",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Price
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Đã bao gồm thuế và phí",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Chỉ còn 1 căn với giá này trên Booking.com",
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(
                                  "v Không cần thanh toán trước",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
