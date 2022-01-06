import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_sharing/core/constants/contants.dart';
import 'package:material_sharing/core/widgets/primary_button.dart';

class CreateNews extends StatefulWidget {
  static const String id = 'Create News';
  CreateNews({
    Key? key,
  }) : super(key: key);

  @override
  _CreateNewsState createState() => _CreateNewsState();
}

class _CreateNewsState extends State<CreateNews> {
  String userName = '', photoUrl = '', error = '';

  bool profileImage = false;
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _link = TextEditingController();

  String categoryOption = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 3.0,
        titleSpacing: -3.0,
        title: const Text(
          'Share News',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 5.0,
              offset: Offset(0.0, 2.5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.5),
              FilesPostLabel(label: 'Title'),
              SizedBox(height: 9.5),
              FilesTextField(
                capitalization: TextCapitalization.words,
                hint: 'Type news title here',
                textController: _title,
              ),
              SizedBox(height: 16.5),
              FilesPostLabel(label: 'Description'),
              SizedBox(height: 9.5),
              FilesTextField(
                capitalization: TextCapitalization.sentences,
                hint: 'Type description here',
                maxLines: 5, //fix
                textController: _description,
              ),
              SizedBox(height: 16.5),
              FilesPostLabel(label: 'Link to Source'),
              SizedBox(height: 9.5),
              FilesTextField(
                capitalization: TextCapitalization.words,
                hint: 'Type news url eg. http://',
                textController: _link,
              ),
              SizedBox(height: 16.5),
              FilesPostLabel(label: 'News Category'),
              SizedBox(height: 9.5),
              DropDown(
                items: newsCategory,
                isExpanded: true,
                hint: const Text("Select Category"),
                icon: const Icon(
                  Icons.expand_more,
                  color: Colors.pink,
                ),
                onChanged: (String? value) {
                  categoryOption = value!;
                  print('category: $categoryOption');
                },
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: PrimaryButton(
                    width: 81.5,
                    height: 36.5,
                    blurRadius: 3.0,
                    roundedEdge: 5.0,
                    color: Colors.orange,
                    buttonTitle: 'Submit',
                    onTap: () {
                      if (_title.text == '') {
                        Fluttertoast.showToast(
                            msg: "title cannot be empty",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (_description.text == '') {
                        Fluttertoast.showToast(
                            msg: "description cannot be empty",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (categoryOption == '') {
                        Fluttertoast.showToast(
                            msg: "select a category",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        successToastMessage(msg: 'News Successfully Shared');
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilesPostLabel extends StatelessWidget {
  const FilesPostLabel({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.orange,
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class FilesTextField extends StatelessWidget {
  const FilesTextField(
      {Key? key,
      this.hint,
      this.height,
      this.maxLines,
      this.textController,
      this.capitalization})
      : super(key: key);
  final String? hint;
  final double? height;
  final int? maxLines;
  final TextEditingController? textController;
  final TextCapitalization? capitalization;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: height,
      child: TextField(
        style: TextStyle(fontSize: 20),
        maxLines: maxLines,
        textCapitalization: capitalization!,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        controller: textController,
      ),
    );
  }
}
