import 'package:blog_app/core/base/view/base_widget.dart';
import 'package:blog_app/core/extension/context_extension.dart';
import 'package:blog_app/core/extension/string_extension.dart';
import 'package:blog_app/core/init/theme/color_palette.dart';
import 'package:blog_app/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

import '../../../_product/widgets/button/custom_app_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, LoginViewModel model) => Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: context.paddingMedium,
          child: Column(
            children: [
              buildLogo(context),
              buildBody(model, context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        "Login",
        style: TextStyle(color: ColorPalette.instance.textColor),
      ),
    );
  }

  Expanded buildLogo(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: context.paddingLow,
        child: const Placeholder(),
      ),
    );
  }

  Expanded buildBody(LoginViewModel model, BuildContext context) {
    return Expanded(
      flex: 7,
      child: Padding(
        padding: context.paddingNormalVertical,
        child: Form(
          key: model.formState,
          child: Column(
            children: [
              buildMailFormField(model, context),
              const SizedBox(height: 10),
              buildPasswordFormField(model, context),
              const SizedBox(height: 10),
              CustomAppButton(
                title: "Login",
                icon: Icons.login,
                onTap: () {
                  model.isLoading ? null : model.fetchUser();
                },
                isBlack: true,
              ),
              const SizedBox(height: 10),
              CustomAppButton(
                title: "Register",
                icon: Icons.login,
                onTap: () {
                  model.navigateRegisterPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildMailFormField(LoginViewModel model, BuildContext context) {
    return TextFormField(
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      controller: model.emailController,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      validator: (value) {
        if (value != null) {
          return value.isValidEmail() ? null : "Lütfen geçerli bir email giriniz";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Email",
        prefixIcon: const Icon(Icons.email),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.lowValue),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField(LoginViewModel model, BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      controller: model.passwordController,
      obscureText: model.isLocked,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      validator: (value) {
        if (value != null && value.length < 6) {
          return "Şifreniz 6 karakterden az olamaz";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () => model.changeLocked(),
          icon: Icon(model.isLocked ? Icons.visibility_off_outlined : Icons.visibility),
        ),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.lowValue),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
