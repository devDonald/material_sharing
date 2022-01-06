import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_sharing/core/constants/contants.dart';
import 'package:material_sharing/materials/files_widget.dart';

import 'share_files.dart';

class FilesHome extends StatefulWidget {
  const FilesHome({
    Key? key,
  }) : super(key: key);

  @override
  _FilesHomeState createState() => _FilesHomeState();
}

class _FilesHomeState extends State<FilesHome> {
  bool _isAdLoaded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LectureShareContainer(
            fileTypeIcon: Icons.picture_as_pdf,
            timeStamp: '1 hr ago',
            noOfDownloads: '95',
            userName: 'Ebuga Donald',
            isSourced: false,
            course: "Computer Science",
            level: 'Undergraduate',
            topic: "Analysis of Algorithms",
            fileName: 'algorithm.pdf',
            onDownloadTap: () {
              successToastMessage(
                  msg: 'Material successfully downloaded to Device');
            },
          ),
          LectureShareContainer(
            fileTypeIcon: Icons.picture_as_pdf,
            timeStamp: '5 hrs ago',
            noOfDownloads: '20',
            userName: 'Ruth Afape',
            isSourced: true,
            course: "Physics",
            level: 'Undergraduate',
            topic: "Quantum Physics",
            fileName: 'quantum.pdf',
            onDownloadTap: () {
              successToastMessage(
                  msg: 'Material successfully downloaded to Device');
            },
          ),
          LectureShareContainer(
            fileTypeIcon: Icons.picture_as_pdf,
            timeStamp: '2 weeks ago',
            noOfDownloads: '45',
            userName: 'Ebuga Donald',
            isSourced: true,
            course: "Chemistry",
            level: 'Postgraduate',
            topic: "Organic Chemistry",
            fileName: 'organic.pdf',
            onDownloadTap: () {
              successToastMessage(
                  msg: 'Material successfully downloaded to Device');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateLectureShare(),
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class EmptyLectures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'There are currently no shared files',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15.0),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Click the ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'PLUS ',
                    style: TextStyle(color: Colors.orange, fontSize: 15),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateLectureShare(),
                            ));
                      },
                  ),
                  TextSpan(
                    text: 'to create one ',
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}

String getTimestamp(String date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  String msg = '';
  var dt = DateTime.parse(date).toLocal();

  if (DateTime.now().toLocal().isBefore(dt)) {
    return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
  }

  var dur = DateTime.now().toLocal().difference(dt);
  if (dur.inDays > 0) {
    msg = '${dur.inDays} days ago';
    return dur.inDays == 1 ? '1d ago' : DateFormat("dd MMM").format(dt);
  } else if (dur.inHours > 0) {
    msg = '${dur.inHours} hrs ago';
  } else if (dur.inMinutes > 0) {
    msg = '${dur.inMinutes} m ago';
  } else if (dur.inSeconds > 0) {
    msg = '${dur.inSeconds} s ago';
  } else {
    msg = 'now';
  }
  return msg;
}
