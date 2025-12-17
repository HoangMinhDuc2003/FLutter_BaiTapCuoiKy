import 'package:bai_giua_ky/model/logins.dart';
import 'package:bai_giua_ky/model/news.dart';
import 'package:bai_giua_ky/model/product.dart';
import 'package:bai_giua_ky/model/user.dart';
import 'package:dio/dio.dart';

class APIService {
  var dio = Dio();

  //Danh sách sản phẩm bài 10:
  Future<List<Product>> getAllProduct() async {
    try {
      var response = await dio.request('https://fakestoreapi.com/products');
      List<Product> lstProduct = [];
      if (response.statusCode == 200) {
        List data = response.data;
        lstProduct = data.map((x) => Product.fromJson(x)).toList();
      } else {
        throw Exception("Lấy dữ liệu thất bại: ${response.statusCode}");
      }
      return lstProduct;
    } catch (e) {
      throw Exception("Lỗi API: $e");
    }
  }

  //Danh sách bài báo bài 11:
  Future<News> getAllNews() async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/everything?q=a&language=vix&apiKey=19882bac6ed8447a851f3826c2a7e3aa',
        options: Options(
          responseType: ResponseType.json,
          headers: {"User-Agent": "Mozilla/5.0", "Accept": "image/*"},
        ),
      );

      if (response.statusCode == 200) {
        return News.fromJson(response.data);
      } else {
        throw Exception("Lỗi kết nối: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Lỗi API: $e");
    }
  }

  //Lấy chìa khóa đăng nhập:
  Future<LoginResponse> Login(String username, String password) async {
    try {
      var response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {"username": username, "password": password, "expiresInMins": 30},
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception("Login thất bại: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Lỗi API: $e");
    }
  }

  //Lấy user với chìa khóa:
  Future<User> getUser(String accessToken) async {
    try {
      var response = await dio.get(
        "https://dummyjson.com/auth/me",
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      return User.fromMap(response.data);
    } catch (e) {
      throw Exception("Lỗi lấy thông tin user: $e");
    }
  }
}

var api = APIService();
