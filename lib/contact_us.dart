import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/themes/theme_colors.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    super.initState();
    //checkInGroup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: JanguAskColors.primaryColor,
        title: const Text('Contact Us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: -5.0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ContactButtonWithICon(
              icon: Icons.call,
              title: '+23408036795246',
              onTap: () {
                launch("tel: +23408036795246");
              },
              description: 'Our call center is open to you 24/7'),
          ContactButtonWithICon(
              icon: Icons.email,
              title: 'contact@materialsharingapp.com',
              onTap: () {
                launch(
                    "mailto:contact@materialsharingapp.com?subject=Feedback and Enquiry=New%20plugin");
              },
              description: 'email us for any feedback'),
          ContactButtonWithICon(
              icon: FontAwesomeIcons.instagram,
              title: 'Material Sharing App',
              onTap: () {
                launch("https://www.instagram.com/donaldebuga/?hl=en");
              },
              description: 'Follow us on Instagram'),
          ContactButtonWithICon(
              icon: FontAwesomeIcons.facebook,
              title: 'Material Sharing App',
              onTap: () {
                launch("https://web.facebook.com/debuga");
              },
              description: 'Follow our facebook page'),
          ContactButtonWithICon(
              icon: FontAwesomeIcons.internetExplorer,
              title: 'Contact Website',
              onTap: () {
                launch("https://www.sisterhoodglobal.org");
              },
              description:
                  'Check our website\n(www.materialsharingapp.com)\n for more information'),
          ContactButtonWithICon(
              icon: FontAwesomeIcons.locationArrow,
              title: 'Ruth Afape/Ebuga Donald',
              onTap: () {},
              description:
                  'Computer Science Department,\n University of Ibadan')
        ],
      ),
    );
  }
}

class ContactButtonWithICon extends StatelessWidget {
  const ContactButtonWithICon({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.description,
  }) : super(key: key);
  final IconData icon;
  final String title, description;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height * 0.120,
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      padding: EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: const [
          BoxShadow(
            color: JanguAskColors.pinkishGreyColor,
            offset: Offset(0.0, 2.5),
            blurRadius: 7.5,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: JanguAskColors.primaryColor,
              ),
              SizedBox(width: 9.2),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 5.2),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      color: JanguAskColors.blackColor1,
                      fontSize: 14.0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
