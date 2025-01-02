import 'package:car_app_manikanta_bizt_1039/features/login/model/login_req_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/login/model/login_respo_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/login/viewmodel/login_view_model.dart';
import 'package:car_app_manikanta_bizt_1039/routes/routes_constants.dart';
import 'package:car_app_manikanta_bizt_1039/services/navigation_services.dart';
import 'package:car_app_manikanta_bizt_1039/utils/loader_utils.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/button_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/input_text_field_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/logo_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/text_button_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/text_widget.dart';
import 'package:car_app_manikanta_bizt_1039/widgets/title_and_sub_heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const LogoWidget(
                height: 250,
              ),
              const TitleAndSubHeadingWidget(
                  title: "Welcome Back",
                  subHeading: "Log in to your account using email & password"),
              const SizedBox(
                height: 20,
              ),
              TextWidget(fieldname: "Email"),
              InputTextFieldWidget(
                hintText: "Enter Email Adderess",
                textEditingController: _emailTextController,
                prefixIcon: const Icon(Icons.email),
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(fieldname: "Password"),
              InputTextFieldWidget(
                hintText: "Enter Password",
                textEditingController: _passwordTextController,
                obscureText: true,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility_off),
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButtonWidget(
                      buttonTitle: "Forgot Password?", onPressed: () {}),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonWidget(
                    buttonTitle: "Login",
                    onPressed: () {
                      userAction();
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButtonWidget(
                      buttonTitle: "Sign Up",
                      onPressed: () {
                        NavigationServices()
                            .navigateTo(RoutesConstants.signUpScreen);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void userAction() async {
    LoginReqModel lrm = LoginReqModel(
        email: _emailTextController.text,
        password: _passwordTextController.text);

    LoginViewModel lvm = Provider.of<LoginViewModel>(context, listen: false);
    LoaderWidget.showLoader();
    final LoginRespoModel response = await lvm.loginintoApp(lrm);
    LoaderWidget.hideLoader();
    if (response.error == false) {
      NavigationServices().replaceAll(RoutesConstants.homeScreen);
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text("Invalid user name and password"),backgroundColor:Colors.redAccent));
    }
  }
}
