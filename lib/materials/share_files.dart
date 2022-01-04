import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:material_sharing/core/constants/contants.dart';
import 'package:material_sharing/core/widgets/primary_button.dart';
import 'package:material_sharing/news/create_news.dart';

enum Sourced { original, sourced }
enum ShareWith { public, followers }

class CreateLectureShare extends StatefulWidget {
  static const String id = 'CreateLectureShare';
  CreateLectureShare({
    Key? key,
  }) : super(key: key);
  @override
  _CreateLectureShareState createState() => _CreateLectureShareState();
}

class _CreateLectureShareState extends State<CreateLectureShare> {
  Sourced sourced = Sourced.original;
  bool isSourced = false, isPdf = false;
  final _topic = TextEditingController();
  final _course = TextEditingController();
  final _source = TextEditingController();
  final _description = TextEditingController();

  String _level = '', error = '';
  File? pickedDocument;

  String? extensionName, fileName;
  File? _document;
  List<String> extensions = [
    'pdf',
    'txt',
    'docx',
    'doc',
    'rtf',
    'xls',
    'xlsm',
    'xlsx'
  ];

  Future<FilePickerResult> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
    );
    if (result != null) {
      String documentPath = result.files.first.path!;
      pickedDocument = File(documentPath);
    }
    return result!;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          titleSpacing: -5.0,
          title: const Text(
            'Share Material',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 2.5),
                ),
              ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FilesPostLabel(label: 'Title'),
                  SizedBox(height: 9.5),
                  FilesTextField(
                    textController: _topic,
                    capitalization: TextCapitalization.sentences,
                    hint: 'Type title',
                  ),
                  SizedBox(height: 16.5),
                  FilesPostLabel(label: 'Course'),
                  SizedBox(height: 9.5),
                  FilesTextField(
                    textController: _course,
                    capitalization: TextCapitalization.sentences,
                    hint: 'Type Course',
                  ),
                  SizedBox(height: 14.0),
                  FilesPostLabel(label: 'Level'),
                  SizedBox(height: 9.5),
                  DropDown(
                    items: levelOptions,
                    isExpanded: true,
                    hint: const Text("Select Level"),
                    icon: const Icon(
                      Icons.expand_more,
                      color: Colors.pink,
                    ),
                    onChanged: (String? value) {
                      _level = value!;
                      print('category: $_level');
                    },
                  ),
                  SizedBox(height: 16.5),
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult result = await pickDocument();
                      _document = File(result.files.first.path!);
                      extensionName = result.files.first.extension;
                      fileName = result.files.first.name;

                      if (extensionName == 'pdf') {
                        isPdf = true;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Text(
                          'Click to pick Files',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.0,
                            decorationColor: Colors.orange,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                          size: 13.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.5),
                  const FilesPostLabel(label: 'Description'),
                  const SizedBox(height: 9.5),
                  FilesTextField(
                    maxLines: 3,
                    textController: _description,
                    capitalization: TextCapitalization.sentences,
                    hint: 'Type Description',
                  ),
                  const SizedBox(height: 16.5),
                  Row(
                    children: <Widget>[
                      const FilesPostLabel(
                        label: 'Link to Original File:',
                      ),
                      const SizedBox(height: 41.5),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(height: 32.5),
                    ],
                  ),
                  SizedBox(height: 11.5),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: FilesTextField(
                      textController: _source,
                      capitalization: TextCapitalization.sentences,
                      hint: 'type or paste original link   ',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: PrimaryButton(
                      width: 105.5,
                      height: 36.0,
                      roundedEdge: 5.0,
                      blurRadius: 8.0,
                      color: Colors.pink,
                      buttonTitle: 'Share'.toUpperCase(),
                      onTap: () {
                        if (_topic.text != '' && _course.text != '') {
                        } else {
                          setState(() {
                            error = 'Topic, and Course cannot be empty';
                          });
                        }
                      }, //add a dialog here
                    ),
                  ),
                ]),
          ),
        ));
  }
}
