import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_sharing/core/themes/theme_text.dart';

import 'core/constants/contants.dart';

class UserProfileInfo extends StatefulWidget {
  const UserProfileInfo({
    Key? key,
  }) : super(key: key);
  //final String name, profileImage, country, email, phone, userId;
  //final Widget flag;

  @override
  State<UserProfileInfo> createState() => _UserProfileInfoState();
}

class _UserProfileInfoState extends State<UserProfileInfo> {
  late File pickedImage;

  late String _uploadedImageURL;

  final _picker = ImagePicker();

  getImageFile(ImageSource source) async {
    //Clicking or Picking from Gallery

    var image = await _picker.getImage(source: source);

    //Cropping the image

    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: image!.path,
      maxWidth: 512,
      maxHeight: 512,
    );

    setState(() {
      pickedImage = croppedFile!;
      print(pickedImage.lengthSync());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Stack(fit: StackFit.loose, children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.22,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/user.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 140.0, right: 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            await getImageFile(ImageSource.gallery);
                            successToastMessage(
                                msg: 'Profile picture changed Successfully');
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 20.0,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )),
              ]),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Change Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: JanguAskFontWeight.kBoldText,
                    fontSize: 23,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
