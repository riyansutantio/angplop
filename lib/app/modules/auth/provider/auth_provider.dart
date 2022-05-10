import 'dart:convert';
import 'dart:io';

import 'package:angplop/app/models/auth/forgot_password_model.dart';
import 'package:angplop/app/models/auth/login_model.dart';
import 'package:angplop/app/models/auth/logout_model.dart';
import 'package:angplop/app/models/auth/reset_password_model.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

import '../../../data/data.dart';
import '../../../utils/utils.dart';

class AuthProvider extends GetConnect {
  Map<String, String> bearerAuth({String? bearer}) => {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $bearer'
      };

  List<String>? pathSegmentLogin({String? path}) =>
      ['api', HttpService.apiVersion, '$path', 'login'];

  List<String>? pathSegmentLogOut({String? path}) =>
      ['api', HttpService.apiVersion, '$path', 'logout'];

  List<String>? pathSegmentForgotPassword({String? path}) =>
      ['api', HttpService.apiVersion, '$path', 'forgot-password'];

  List<String>? pathSegmentResetPassword({String? path}) =>
      ['api', HttpService.apiVersion, 'password', 'reset', '$path'];

  Future<LoginModel?> login({required String? email, String? password}) async {
    var baseUrl = FlavorConfig.instance.variables["baseUrl"];
    Uri _loginUri = Uri.parse(baseUrl)
        .replace(pathSegments: pathSegmentLogin(path: 'auth'));
    logger.wtf(_loginUri);
    final response = await http.post(_loginUri,
        headers: HttpService.headers,
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    logger.wtf(response.body);
    var jsonString = response.body;
    logger.wtf(jsonDecode(jsonString));
    return loginModelFromJson(jsonString);
  }

  Future<LogOutModel?> logOut(
      {required String? email, String? password, String? bearer}) async {
    var baseUrl = FlavorConfig.instance.variables["baseUrl"];
    Uri _logOutUri = Uri.parse(baseUrl)
        .replace(pathSegments: pathSegmentLogOut(path: 'auth'));
    logger.wtf(_logOutUri);
    final response = await http.post(_logOutUri,
        headers: bearerAuth(bearer: bearer),
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    logger.wtf(response.body);
    var jsonString = response.body;
    logger.wtf(bearerAuth(bearer: bearer));
    logger.wtf(jsonDecode(jsonString));
    return logOutModelFromJson(jsonString);
  }

  Future<ForgotPasswordModel?> forgotPassword({required String? email}) async {
    var baseUrl = FlavorConfig.instance.variables["baseUrl"];
    Uri _forgotPasswordUri = Uri.parse(baseUrl)
        .replace(pathSegments: pathSegmentForgotPassword(path: 'password'));
    logger.wtf(_forgotPasswordUri);
    final response = await http.post(_forgotPasswordUri,
        headers: HttpService.headers,
        body: jsonEncode({
          "email": email,
        }));
    logger.wtf(response.body);
    var jsonString = response.body;
    logger.wtf(jsonDecode(jsonString));
    return forgotPasswordModelFromJson(jsonString);
  }

  Future<ResetPasswordModel?> resetPassword({
    String? password,
    String? password_confirmation,
    String? token,
  }) async {
    var baseUrl = FlavorConfig.instance.variables["baseUrl"];
    Uri _forgotPasswordUri = Uri.parse(baseUrl)
        .replace(pathSegments: pathSegmentResetPassword(path: token));
    logger.wtf(_forgotPasswordUri);
    final response = await http.post(_forgotPasswordUri,
        headers: HttpService.headers,
        body: jsonEncode({
          "password": password,
          "password_confirmation": password_confirmation,
        }));
    logger.wtf(response.body);
    var jsonString = response.body;
    logger.wtf(jsonDecode(jsonString));
    return resetPasswordModelFromJson(jsonString);
  }
}
