import 'dart:developer';

import 'package:clean_architecture/core/base/api_service.dart';
import 'package:clean_architecture/core/config/locator.dart';
import 'package:clean_architecture/data/entities/login_request_model.dart';
import 'package:clean_architecture/data/entities/login_response_model.dart';
import 'package:clean_architecture/presentation/home/bloc/home_bloc.dart';
import '/core/utils/enum/request_type.dart';

class LoginService extends ApiService {
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final dynamic result;
    final value = getIt<HomeBloc>().email;
    log("$value");
    final data = LoginRequestModel(email: email, password: password).toJson();
    result = await handleRawRequest(
      endpoint: 'login',
      requestType: RequestType.post,
      data: data,
    );
    final token = LoginResponseModel.fromJson(result);
    log(token.token);
  }
}
