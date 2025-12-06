// import 'dart:developer';

// import 'package:api/model.dart';
// import 'package:dio/dio.dart';

// class ApiService {
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: "https://api.escuelajs.co",
//       connectTimeout: Duration(seconds: 10),
//       receiveTimeout: Duration(seconds: 10),
//     ),
//   );
//   Future<String?> createUse(UserModel user) async {
//     try {
//       final response = await _dio.post(
//         "/api/v1/auth/login",
//         data: user.toJson(),
//       );
//       log(response.toString());
//       if (response.statusCode == 201) {
//         return response.data["access_token"];
//       }
//     } catch (e) {}
//   }

//   Future<UserModel?> getUser() async {
//     try {
//       final response = await _dio.post(
//         "/api/v1/auth/profile",
//         options: Options(
//           headers: {
//             "Authorization":
//                 "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTc2NDg2MzI2OCwiZXhwIjoxNzY2NTkxMjY4fQ.je7JW-2c6LABNPkBKOG8viAJe9XlgRoIE-iok4GpCuU",
//           },
//         ),
//       );
//       log(response.toString());
//       if ( response.statusCode== 200) {
//         return UserModel.fromJson(response.data);
//       }
//     } catch (e) {}
//   }
// }





import 'dart:developer';
import 'package:api/model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.escuelajs.co",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
  Future<String?> postData(UserModel user) async {
    try {
      final response = await dio.post(
        "/api/v1/auth/login",
        data: user.toJson(),
      );

      log(response.toString());

      if (response.statusCode == 201) {
        return response.data["access_token"];
      }
    } catch (e) {
      log("Login error: $e");
    }
    return null;
  }

  Future<UserModel?> getUser(String token) async {
    try {
      final response = await dio.get(
        "/api/v1/au th/profile",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      // log(response.data.toString());

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      // log("Profile error: $e");
    }
    return null;
  }
}
