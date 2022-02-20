import 'package:blog_app/core/base/model/base_view_model.dart';
import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/view/auth/register/model/register_model.dart';
import 'package:blog_app/view/auth/register/service/IRegisterService.dart';
import 'package:blog_app/view/auth/register/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class RegisterViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late IRegisterService registerService;

  bool isLocked = true;
  bool isReLocked = true;
  bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey();

  void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
  void changeLocked(){
    isLocked = !isLocked;
    notifyListeners();
  }

  void changeReLocked(){
    isReLocked = !isReLocked;
    notifyListeners();
  }
  void setToken(String response) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = response;
    preferences.setString("token", token);
  }
  @override
  void init() {
    registerService = RegisterService(NetworkManager.instance!);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  Future<void> fetchUser() async{
    changeLoading();
    if (formState.currentState!.validate()){
      final response = await registerService.fetchUserControl(RegisterModel(Email: emailController.text, Password: passwordController.text,PasswordRetry: passwordController.text));
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
  void navigateLoginPage(){
    NavigationService.instance.navigateToPageClear(
      path: NavigationConstants.login,
    );
  }
}