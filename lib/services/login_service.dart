
// import 'package:http/http.dart' as http;

// import '../models/login/login_request_model.dart';
// import '../models/login/login_response_model.dart';

// abstract class LoginService {
//   Future login(LoginRequestModel loginRequestModel);
// }

// class LoginServiceImp extends LoginService {
//   @override
//   Future login(LoginRequestModel loginRequestModel) async {
//     final response =
//         await http.post(Uri.parse("https://localhost:7179/api/Auths/login"), body: loginRequestModel.toJson());

//     if (response.statusCode == 200) {
//       return loginResponseModelFromJson(response.body);
//     } else {
//       return '';
//     }
//   }
// }