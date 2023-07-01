// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class ApiServices {
//   Future<Map<dynamic, dynamic>> getRequest(String url, Map<String, String> header) async {
//     try {
//       var response = await http.get(Uri.parse(url), headers: header);

//       if (response.statusCode == 200) {
//         var responsebody = jsonDecode(response.body);

//         return responsebody;
//       } else {
//         return {'error': response.statusCode};
//       }
//     } catch (e) {
//       return {"error": e};
//     }
//   }

//   Future<Map<dynamic, dynamic>> postRequest(String url, Map<String, dynamic> data, Map<String, String> header) async {
//     try {
//       var response = await http.post(Uri.parse(url), body: data, headers: header);
//       if (response.statusCode == 200) {
//         var responsebody = jsonDecode(response.body);
//         return responsebody;
//       } else {
//         return {"error": response.statusCode};
//       }
//     } catch (e) {
//       print("error +$e");

//       return {"error": e};
//     }
//   }

//   Future<Map<String, dynamic>> apiPut({
//     url,
//     body,
//   }) async {
//     try {
//       var response = await http.put(Uri.parse('$url'),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: json.encode(body));

//       if (response.statusCode == 401) {}
//       if (response.statusCode == 403) {}
//       if (response.statusCode == 200) {
//         return {'response': response.statusCode};
//       }

//       return {'error': response.body};
//     } catch (e) {
//       return {'error': e};
//     }
//   }

//   Future<Map<String, dynamic>> apiDelete(url) async {
//     try {
//       var response = await http.delete(Uri.parse('$url'), headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       });

//       if (response.statusCode == 401) {}
//       if (response.statusCode == 403) {}
//       if (response.statusCode == 200) {
//         return {'response': response.statusCode};
//       }

//       return {'error': response.statusCode};
//     } catch (e) {
//       return {'error': e};
//     }
//   }
// }
