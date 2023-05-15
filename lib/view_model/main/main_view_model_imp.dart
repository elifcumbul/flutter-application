import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:take_me_out/models/login_result_model.dart';
import 'package:take_me_out/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:take_me_out/state/state.dart';
import 'package:take_me_out/view_model/main/main_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../network/login.dart';

class MainViewModelImp implements MainViewModel {
  @override
  void changeLoading(BuildContext context) {
    context.read().state.isLoading = !(context.read().state.isLoading);
    
  }

  @override
  Future<bool> checkToken(BuildContext context) async {
    var secure = FlutterSecureStorage();
    var token = await secure.read(key: 'TOKEN');
    if(token!.isNotEmpty){
      context.read().state.bearerToken = token;
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      return true;
    }

    return false;
  }

  @override
  Future<LoginResultModel> processLogin(BuildContext context, LoginModel loginModel) async {
    context.read().state.isLoading = false;
    var result = await login(loginModel);
    context.read().state.isLoading = true;
    
    return result;
  }

  @override
  Future<void> setToken(BuildContext context, String token) async {
    var secure = FlutterSecureStorage();
    await secure.write(key: 'TOKEN', value: token);
    context.read().state.bearerToken = token;
  }

}