import 'package:api_with_provider/data/network/network_api_services.dart';
import 'package:api_with_provider/res/colors/colors.dart';
import 'package:api_with_provider/res/components/input_text_form_field.dart';
import 'package:api_with_provider/res/round_button.dart';
import 'package:api_with_provider/res/styles/text_styles.dart';
import 'package:api_with_provider/utils/routes/route_name.dart';
import 'package:api_with_provider/utils/utils.dart';
import 'package:api_with_provider/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool isSwitched = false;
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final authProvider = Provider.of<AuthViewModel>(context);
    print("build");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const Text(
                            "Login back into \nyour account",
                            style: AppTextStyle.bodyHeadLine,
                          ),
                          SizedBox(height: height * .06),
                          loginForm(),
                          SizedBox(height: height * .02),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, RouteName.resetPasswordScreen);
                              },
                              child: Text(
                                "Forgot Password",
                                style: AppTextStyle.bodyText2
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(height: height * .08),
                          AppRoundButton(
                            // isLoading: authProvider.loading,
                            title: "LOGIN",
                            onPress: () async {
                              if (_formKey.currentState!.validate()) {
                                print("api hit");

                                authProvider.login(
                                    _emailController.text.toString(),
                                    _passwordController.text.toString(),
                                    context);
                              }
                            },
                          ),
                          SizedBox(height: height * .02),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.signUpScreen);
                              },
                              child: Text(
                                "Dont have an account",
                                style: AppTextStyle.bodyText2
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginForm() {
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(children: [
        InputTextFormField(
          controller: _emailController,
          focusNode: _emailFocus,
          onFieldSubmitValue: (val) {
            Utils.focusField(context, _emailFocus, _passwordFocus);
          },
          validator: (val) {
            return val.isEmpty ? "Please Enter Your Email" : null;
          },
          keyBoardType: TextInputType.emailAddress,
          hintText: "Email Address",
        ),
        SizedBox(height: height * .03),
        InputTextFormField(
          controller: _passwordController,
          focusNode: _passwordFocus,
          onFieldSubmitValue: (val) {},
          validator: (val) {
            return val.isEmpty
                ? "Please Enter Your password"
                : _passwordController.text.length < 8
                    ? "Password length must be 8 character long"
                    : null;
          },
          keyBoardType: TextInputType.emailAddress,
          hintText: 'Enter your password',
          obscureText: false,
          // suffixIcon: IconButton(
          //   icon: const Icon(Icons.visibility_outlined),
          //   // : Icons.visibility_off),
          //   onPressed: () {},
          // ),
        )
      ]),
    );
  }
}
