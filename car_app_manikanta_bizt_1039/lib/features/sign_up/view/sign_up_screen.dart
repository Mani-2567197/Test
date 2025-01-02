import 'package:car_app_manikanta_bizt_1039/features/sign_up/model/sign_up_request_model.dart';
import 'package:car_app_manikanta_bizt_1039/features/sign_up/viewmodel/sign_up_view_model.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const LogoWidget(
                height: 250,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TitleAndSubHeadingWidget(
                    title: "Welcome Back",
                    subHeading:
                        "Sign up in to your account using email , name and password"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(fieldname: "Name"),
              InputTextFieldWidget(
                  hintText: "Enter Name",
                  prefixIcon: const Icon(Icons.person),
                  textEditingController: _nameTextController),
              const SizedBox(
                height: 20,
              ),
              TextWidget(fieldname: "Email"),
              InputTextFieldWidget(
                  hintText: "Enter Email",
                  prefixIcon: const Icon(Icons.email),
                  textEditingController: _emailTextController),
              const SizedBox(
                height: 20,
              ),
              TextWidget(fieldname: "Password"),
              InputTextFieldWidget(
                hintText: "Enter Password",
                textEditingController: _passwordTextController,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonWidget(
                    buttonTitle: "Sign Up",
                    onPressed: () {
                      userAction();
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButtonWidget(
                      buttonTitle: "Login",
                      onPressed: () {
                        NavigationServices().goBack();
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
    SignUpRequestModel srm = SignUpRequestModel(
        name: _nameTextController.text,
        email: _emailTextController.text,
        password: _passwordTextController.text);
    final signUpvm = Provider.of<SignUpViewModel>(context, listen: false);
    LoaderWidget.showLoader(message: "Sign up processing");
    final response = await signUpvm.signUpTheUser(srm);
    LoaderWidget.hideLoader();
    showPopupMessage(message: response.message ?? "");
  }

  void showPopupMessage({String message = ""}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  NavigationServices().goBack();
                },
                child: const Text("Ok"))
          ],
        );
      },
    );
  }
}
