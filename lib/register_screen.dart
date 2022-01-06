import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:get/get.dart';
import 'package:material_sharing/login_screen.dart';

import 'core/constants/contants.dart';
import 'core/themes/theme_colors.dart';
import 'core/themes/theme_images.dart';
import 'core/widgets/flat_primary_button.dart';
import 'core/widgets/primary_button.dart';
import 'core/widgets/social_button.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _university = TextEditingController();

  final TextEditingController _course = TextEditingController();

  final TextEditingController _phoneNumber = TextEditingController();

  String _dialCode = '+234',
      _country = 'Nigeria',
      _code = 'NG',
      gender = '',
      level = '',
      marital = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Registration Screen'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
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
                        SizedBox(height: 22.1),

                        //full name
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
                            controller: _fullName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            maxLength: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Full Name',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        //university
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
                            controller: _university,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            maxLength: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'University',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        //course of study
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
                            controller: _course,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            maxLength: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Course of Study',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.5),
                        const PostLabel(label: 'Level'),
                        const SizedBox(height: 9.5),
                        DropDown(
                          items: levelOptions,
                          isExpanded: true,
                          hint: const Text("Select Level"),
                          icon: const Icon(
                            Icons.expand_more,
                            color: Colors.pink,
                          ),
                          onChanged: (String? value) {
                            level = value!;
                            print('category: $level');
                          },
                        ),

                        const SizedBox(height: 16.5),
                        const PostLabel(label: 'Gender'),
                        const SizedBox(height: 9.5),
                        DropDown(
                          items: genderOptions,
                          isExpanded: true,
                          hint: const Text("Select Gender"),
                          icon: const Icon(
                            Icons.expand_more,
                            color: Colors.pink,
                          ),
                          onChanged: (String? value) {
                            gender = value!;
                            print('category: $gender');
                          },
                        ),
                        const SizedBox(height: 16.5),
                        const PostLabel(label: 'Marital Status'),
                        const SizedBox(height: 9.5),
                        DropDown(
                          items: maritalOptions,
                          isExpanded: true,
                          hint: const Text("Select Marital Status"),
                          icon: const Icon(
                            Icons.expand_more,
                            color: Colors.pink,
                          ),
                          onChanged: (String? value) {
                            marital = value!;
                            print('category: $marital');
                          },
                        ),

                        //email
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email Id',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                        //password
                        const SizedBox(height: 15),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
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
                                width:
                                    MediaQuery.of(context).size.width / 2.3 + 1,
                                // width: double.infinity,
                                // height: 40.0,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 20),
                                  controller: _password,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.newline,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.none,
                                  maxLength: null,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                ),
                              ),
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
                                width:
                                    MediaQuery.of(context).size.width / 2.3 + 1,
                                // width: double.infinity,
                                // height: 40.0,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 20),
                                  controller: _confirmPassword,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.newline,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.none,
                                  maxLength: null,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Confirm Password',
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        PrimaryButton(
                          height: 45.0,
                          width: double.infinity,
                          color: JanguAskColors.primaryColor,
                          buttonTitle: 'Register',
                          blurRadius: 7.0,
                          roundedEdge: 2.5,
                          onTap: () async {
                            if (validateForm(
                                _email.text,
                                _fullName.text,
                                _password.text,
                                _university.text,
                                _course.text,
                                level,
                                gender,
                                _confirmPassword.text)) {
                              successToastMessage(
                                  msg: 'Registration Successful');
                              Get.to(() => const HomeScreen());
                            }
                          },
                        ),
                        const SizedBox(height: 25.0),

                        SocialButton(
                          platformName: 'Sign up with Google',
                          platformIcon: JanguAskImages.googleLogo,
                          color: JanguAskColors.redColor,
                          onTap: () async {
                            successToastMessage(
                                msg: 'Google Registration Successful');
                            Get.to(() => const HomeScreen());
                          },
                        ),
                        const SizedBox(height: 10.0),

                        SocialButton(
                          platformName: 'Sign up with Facebook',
                          platformIcon: JanguAskImages.fbLogo,
                          color: JanguAskColors.blueColor,
                          onTap: () async {
                            successToastMessage(
                                msg: 'Facebook Registration Successful');
                            Get.to(() => const HomeScreen());
                          },
                        ),
                        //
                        const SizedBox(height: 15.0),
                        Center(
                          child: FlatPrimaryButton(
                            info: 'Already Registered? ',
                            title: 'Login!',
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 23.5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PostTextFeild extends StatelessWidget {
  const PostTextFeild(
      {Key? key,
      required this.hint,
      required this.height,
      required this.maxLines,
      required this.textController,
      required bool isBorder,
      required this.capitalization})
      : super(key: key);
  final String hint;
  final double height;
  final int maxLines;
  final TextEditingController textController;
  final TextCapitalization capitalization;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextField(
        maxLines: maxLines,
        textCapitalization: capitalization,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        controller: textController,
      ),
    );
  }
}

class PostLabel extends StatelessWidget {
  const PostLabel({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
