import 'package:flutter/material.dart';

class ClassRoom extends StatelessWidget {
  const ClassRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.class_),
            SizedBox(width: 10),
            Text("Class Room"),
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
      scrollDirection: Axis.vertical,
      children: [block1(), block2(), block3(), block4(), block5()],
    );
  }

  Widget block1() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16, right: 16, left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1511919884226-fd3cad34687c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "XML và ứng dụng - Nhóm 1",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
          Text(
            "2025-2026.1.TIN4583.001",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "58 học viên",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget block2() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16, right: 16, left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1633507104446-8e94340c8ea3?q=80&w=2052&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lập trình ứng dụng cho các t...",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
          Text(
            "2025-2026.1.TIN4403.006",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "55 học viên",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16, right: 16, left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1756034198936-4df9d581d39c?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lập trình ứng dụng cho các t...",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
          Text(
            "2025-2026.1.TIN4403.005",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "52 học viên",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget block4() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16, right: 16, left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1580654712603-eb43273aff33?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "XML và ứng dụng - Nhóm 3",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
          Text(
            "2025-2026.1.TIN4583.001",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "58 học viên",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget block5() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1570829174962-38c53efc5e5a?q=80&w=1163&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "XML và ứng dụng - Nhóm 2",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
          Text(
            "2025-2026.1.TIN4583.001",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "50 học viên",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
