import 'package:blog_app/core/base/model/base_view_model.dart';
import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/view/auth/login/model/login_model.dart';
import 'package:blog_app/view/auth/login/service/ILoginService.dart';
import 'package:blog_app/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class LoginViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late ILoginService loginService;
  bool isLocked = true;
  bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey();
  @override
  void init() {
    checkToken();
    loginService = LoginService(NetworkManager.instance!);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
  void changeLocked(){
    isLocked = !isLocked;
    notifyListeners();
  }

  void checkToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get("token");
    if(token != null && token.toString() != ""){
      navigateHomePage();
    }
  }

  void setToken(String response) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = response;
    preferences.setString("token", token);
  }

  Future<void> fetchUser() async{
    changeLoading();
    if (formState.currentState!.validate()){
      final response = await loginService.fetchUserControl(LoginModel(Email: emailController.text, Password: passwordController.text));
      if(response != null && response != ""){
        setToken(response);
      }
      changeLoading();
      navigateHomePage();
    }
  }

  void navigateHomePage(){
    NavigationService.instance.navigateToPageClear(
      path: NavigationConstants.home,
    );
  }

  void navigateRegisterPage(){
    NavigationService.instance.navigateToPageClear(
      path: NavigationConstants.register,
    );
  }
}