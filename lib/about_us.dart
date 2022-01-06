import 'package:flutter/material.dart';
import 'package:material_sharing/core/themes/theme_colors.dart';

import 'core/themes/theme_text.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.pink,
        title: const Text('About Us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: -5.0,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.5,
          bottom: 10.0,
        ),
        padding: const EdgeInsets.only(
          left: 10.5,
          right: 23.5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(color: Colors.black26, offset: Offset(0.0, 2.5)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: const [
              ExpansionTile(
                title: Text(
                  "Our Founders",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text('Ebuga Donald Okolo',
                        style: TextStyle(
                          color: JanguAskColors.blackColor1,
                          fontWeight: JanguAskFontWeight.kBoldText,
                          fontSize: 18,
                        )),
                    subtitle: Text(
                        'Mr Ebuga Donald Okolo is a Computer Science graduate from Ahmadu Bello University Zaria. His Final undergraduate project was implementing a Web-Based Expert System for the Diagnosis and Drug Prescription of Malaria and Typhoid. He is skilled in Full Stack Mobile Application Development, HTML, CSS, Javascript, python and UI/UX design'),
                  ),
                  ListTile(
                    title: Text('Afape Ruth Temiloluwa',
                        style: TextStyle(
                          color: JanguAskColors.blackColor1,
                          fontWeight: JanguAskFontWeight.kBoldText,
                          fontSize: 18,
                        )),
                    subtitle: Text(
                        'Ms Afape Ruth Temiloluwa is a Computer Engineering graduate from Ladoke Akintola University. Her Final project was implementing a cultural algorithm for a paramilitary scheduling system. She is Skilled in Project Management and a beginner at python development '),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Our Story",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Our motivation to provide an interactive platform for material sharing is hinged upon the difficulty students most regularly encounter when it comes to getting the right learning materials. With an interactive system where students can share materials that would be beneficial in a particular course or field of study, learning becomes easy. No need to search endlessly for simplified materials online, others can share from the list of materials that benefitted them the most.",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              //Church Units
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemsCard extends StatelessWidget {
  final String text;
  const ListItemsCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              backgroundColor: Colors.pinkAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
