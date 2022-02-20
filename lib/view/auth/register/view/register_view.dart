import 'package:blog_app/core/base/view/base_widget.dart';
import 'package:blog_app/core/extension/context_extension.dart';
import 'package:blog_app/core/extension/string_extension.dart';
import 'package:blog_app/core/init/theme/color_palette.dart';
import 'package:blog_app/view/auth/register/viewmodel/register_view_model.dart';
import 'package:flutter/material.dart';

import '../../../_product/widgets/button/custom_app_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, RegisterViewModel model) => Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: context.paddingMedium,
          child: buildBody(context, model),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        "Register",
        style: TextStyle(color: ColorPalette.instance.textColor),
      ),
    );
  }

  Column buildBody(BuildContext context, RegisterViewModel model) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: context.paddingLow,
            child: const Placeholder(),
          ),
        ),
        Expanded(
          flex: 7,
          child: Padding(
            padding: context.paddingNormalVertical,
            child: Form(
              key: model.formState,
              child: Column(
                children: [
                  buildEmail(model, context),
                  const SizedBox(height: 10),
                  buildPassword(model,context),
                  const SizedBox(height: 10),
                  buildRePassword(model,context),
                  const SizedBox(height: 10),
                  CustomAppButton(
                    title: "Register",
                    icon: Icons.login,
                    onTap: () {
                      model.isLoading ? null : model.fetchUser();
                    },
                    isBlack: true,
                  ),
                  const SizedBox(height: 10),
                  CustomAppButton(
                    title: "Login",
                    icon: Icons.login,
                    onTap: () {
                      model.navigateLoginPage();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextFormField buildEmail(RegisterViewModel model, BuildContext context) {
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

  TextFormField buildPassword(RegisterViewModel model,BuildContext context) {
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
                      borderRadius:  BorderRadius.circular(context.lowValue),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                  ),
                );
  }

  TextFormField buildRePassword(RegisterViewModel model,BuildContext context) {
    return TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: model.rePasswordController,
                  obscureText: model.isReLocked,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      if (value != model.passwordController.text) {
                        return "Şifreniz uyuşmuyor";
                      } else {
                        return "Şifreniz 6 karakterden küçük olamaz";
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Re-Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => model.changeReLocked(),
                      icon: Icon(model.isReLocked ? Icons.visibility_off_outlined : Icons.visibility),
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
