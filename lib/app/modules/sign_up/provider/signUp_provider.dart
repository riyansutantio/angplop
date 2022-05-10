import 'dart:convert';
import 'dart:io';

import 'package:angplop/app/models/auth/login_model.dart';
import 'package:angplop/app/models/auth/term_model.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

import '../../../data/data.dart';
import '../../../models/auth/register_model.dart';
import '../../../utils/utils.dart';

class SignUpProvider extends GetConnect {
  Map<String, String> bearerAuth({String? bearer}) => {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $bearer'
      };

  List<String>? pathSegmentTerm({String? path}) =>
      ['api', HttpService.apiVersion, 'term-condition'];
  List<String>? pathSegmentPrivacy({String? path}) =>
      ['api', HttpService.apiVersion, 'privacy-policy'];
  List<String>? pathSegmentAddUser({String? path}) =>
      ['api', HttpService.apiVersion, '$path', 'register'];

  Future<TermModel?> getTerm({String? path, String? bearer}) async {
    var baseUrl = FlavorConfig.instance.variables["baseUrl"];
    Uri _getTerm = Uri.parse(baseUrl).replace(pathSegments: pathSegmentTerm());
    logger.wtf('ini adalah baseUrl $_getTerm');
    final response =
        await http.get(_getTerm, headers: bearerAuth(bearer: bearer));
    if (response.statusCode == 200) {
      logger.wtf(response.statusCode);
      var jsonString = response.body;
      logger.wtf(jsonDecode(jsonString));
      return termModelFromJson(jsonString);
    }
    return null;
  }

  Future<TermModel?> getPrivacy({String? path, String? bearer}) async {
    var baseUrl = FlavorConfig.instance.variables["baseUrl"];
    Uri _getPrivacy =
        Uri.parse(baseUrl).replace(pathSegments: pathSegmentPrivacy());
    logger.wtf('ini adalah baseUrl $_getPrivacy');
    final response =
        await http.get(_getPrivacy, headers: bearerAuth(bearer: bearer));
    if (response.statusCode == 200) {
      logger.wtf(response.statusCode);
      var jsonString = response.body;
      logger.wtf(jsonDecode(jsonString));
      return termModelFromJson(jsonString);
    }
    return null;
  }

  Future<AddRegisterModel?> addUser(
      {required String? name,
      required String? email,
      required String? password,
      required String? passwordConfirm}) async {
    var baseUrl = FlavorConfig.instance.variables["baseUrl"];
    Uri _addUser = Uri.parse(baseUrl)
        .replace(pathSegments: pathSegmentAddUser(path: 'auth'));
    logger.wtf(_addUser);
    final response = await http.post(
      _addUser,
      headers: HttpService.headers,
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirm,
      }),
    );
    var jsonString = response.body;
    // logger.wtf(jsonEncode({
    //   "name": name,
    //   "email": email,
    //   "password": password,
    //   "password_confirmation": passwordConfirm,
    // }));
    logger.wtf(jsonDecode(jsonString));
    logger.wtf(response.statusCode);
    return addRegisterModelFromJson(jsonString);
  }
}
