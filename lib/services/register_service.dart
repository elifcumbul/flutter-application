
// import 'package:http/http.dart' as http;

// import '../models/register/register_request_model.dart';
// import '../models/register/register_response_model.dart';

// abstract class RegisterService {
//   Future register(RegisterRequestModel registerRequestModel);
// }

// class RegisterServiceImp extends RegisterService {
//   @override
//   Future register(RegisterRequestModel registerRequestModel) async {
//     final response = await http.post(Uri.parse('https://localhost:7179/api/Auths/register'),
//         body: registerRequestModel.toJson());

//     if (response.statusCode == 200) {
//       return registerResponseModelFromJson(response.body);
//     } else {
//       // ignore: avoid_print
//       return '';
//     }
//   }
// }


