import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_sharing/home_screen.dart';
import 'package:material_sharing/register_screen.dart';
import 'package:material_sharing/reset_password.dart';

import 'core/constants/contants.dart';
import 'core/themes/theme_colors.dart';
import 'core/themes/theme_images.dart';
import 'core/widgets/flat_primary_button.dart';
import 'core/widgets/flat_secodary_button.dart';
import 'core/widgets/primary_button.dart';
import 'core/widgets/screen_title.dart';
import 'core/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
        title: const Text('Login Screen'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              // key: _formKey,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 39.8),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'images/logo.png',
                            width: 220,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 31.1),
                    const ScreenTitleIndicator(
                      title: 'LOGIN',
                    ),
                    const SizedBox(height: 25.9),
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: JanguAskColors.whiteColor,
                        borderRadius: BorderRadius.circular(2.5),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 7.5,
                            offset: Offset(0.0, 2.5),
                            color: JanguAskColors.shadowColor,
                          )
                        ],
                      ),
                      width: double.infinity,
                      // width: double.infinity,
                      // height: 40.0,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        controller: _email,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.newline,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: JanguAskColors.whiteColor,
                        borderRadius: BorderRadius.circular(2.5),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 7.5,
                            offset: Offset(0.0, 2.5),
                            color: JanguAskColors.shadowColor,
                          )
                        ],
                      ),
                      width: double.infinity,
                      // height: 40.0,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        controller: _password,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.newline,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatSecondaryButton(
                        title: 'Forgot Password? Click Here!',
                        color: JanguAskColors.primaryColor,
                        onTap: () {
                          Get.to(() => const ResetPassword());
                        },
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    PrimaryButton(
                      width: double.infinity,
                      height: 45.0,
                      buttonTitle: 'Login',
                      color: JanguAskColors.primaryColor,
                      blurRadius: 7.0,
                      roundedEdge: 10,
                      onTap: () async {
                        if (validateLogin(_email.text, _password.text)) {
                          successToastMessage(
                              msg: 'User authentication Successful');
                          Get.to(() => const HomeScreen());
                        }
                      },
                    ),
                    const SizedBox(height: 25.0),
                    SocialButton(
                      platformName: 'Continue with Google',
                      platformIcon: JanguAskImages.googleLogo,
                      color: JanguAskColors.redColor,
                      onTap: () async {
                        //controller.googleLogin();
                        successToastMessage(
                            msg: 'Google authentication Successful');
                        Get.to(() => const HomeScreen());
                      },
                    ),
                    const SizedBox(height: 10.0),
                    SocialButton(
                      platformName: 'Continue with Facebook',
                      platformIcon: JanguAskImages.fbLogo,
                      color: JanguAskColors.blueColor,
                      onTap: () async {
                        //controller.googleLogin();
                        successToastMessage(
                            msg: 'Facebook authentication Successful');
                        Get.to(() => const HomeScreen());
                      },
                    ),
                    const SizedBox(height: 15.0),
                    Center(
                      child: FlatPrimaryButton(
                        info: 'Dont\'t Have an Account? ',
                        title: 'Register',
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 23.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
