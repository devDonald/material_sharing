import 'package:flutter/material.dart';
import 'package:material_sharing/core/constants/contants.dart';
import 'package:material_sharing/core/themes/theme_text.dart';
import 'package:material_sharing/core/widgets/primary_button.dart';
import 'package:material_sharing/user_profile_info.dart';

import 'core/themes/theme_colors.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text(
                'My Profile',
                style: TextStyle(
                  color: JanguAskColors.primaryColor,
                  fontSize: 20,
                ),
              ),
              pinned: true,
              floating: true,
              iconTheme: IconThemeData(color: JanguAskColors.primaryGreyColor),
              backgroundColor: JanguAskColors.whiteColor,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SizedBox(height: 20),
                    UserProfileInfo(),
                  ],
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height / 3 + 5,
            )
          ];
        },
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(9),
              margin: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: JanguAskColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8.0,
                    offset: Offset(
                      0.0,
                      4.0,
                    ),
                    color: JanguAskColors.shadowColor,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: JanguAskColors.blackColor1,
                          fontWeight: JanguAskFontWeight.kBoldText,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Ebuga Donald Okolo',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: JanguAskColors.primaryGreyColor,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: JanguAskColors.blackColor1,
                      fontWeight: JanguAskFontWeight.kBoldText,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  const Text(
                    'okoloebuga@gmail.com',
                    style: TextStyle(
                      color: JanguAskColors.primaryGreyColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'University',
                    style: TextStyle(
                      color: JanguAskColors.blackColor1,
                      fontWeight: JanguAskFontWeight.kBoldText,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'University of Ibadan',
                    style: TextStyle(
                      color: JanguAskColors.primaryGreyColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Level',
                    style: TextStyle(
                      color: JanguAskColors.blackColor1,
                      fontWeight: JanguAskFontWeight.kBoldText,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Postgraduate',
                    style: TextStyle(
                      color: JanguAskColors.primaryGreyColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Course',
                    style: TextStyle(
                      color: JanguAskColors.blackColor1,
                      fontWeight: JanguAskFontWeight.kBoldText,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Computer Science',
                    style: TextStyle(
                      color: JanguAskColors.primaryGreyColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Gender',
                    style: TextStyle(
                      color: JanguAskColors.blackColor1,
                      fontWeight: JanguAskFontWeight.kBoldText,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Male',
                    style: TextStyle(
                      color: JanguAskColors.primaryGreyColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Marital Status',
                    style: TextStyle(
                      color: JanguAskColors.blackColor1,
                      fontWeight: JanguAskFontWeight.kBoldText,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Married',
                    style: TextStyle(
                      color: JanguAskColors.primaryGreyColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: PrimaryButton(
                        buttonTitle: 'Update Profile',
                        blurRadius: 5,
                        roundedEdge: 5,
                        color: Colors.pink,
                        onTap: () {
                          successToastMessage(msg: 'Profile Update Successful');
                        },
                        height: 50,
                        width: 150),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem {
  static const String EditProfile = 'Edit Profile';

  static const List<String> choices = <String>[EditProfile];
}
