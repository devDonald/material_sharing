import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

const profilePHOTO =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s';

successToastMessage({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

errorToastMessage({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

warningToastMessage({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.yellow,
      textColor: Colors.white,
      fontSize: 16.0);
}

bool validateForm(String email, String name, String password, String university,
    String course, String level, String gender, String confirmPassword) {
  if (email.isEmpty) {
    errorToastMessage(msg: 'email cannot be empty');
    return false;
  } else if (!email.contains('.')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else if (!email.contains('@')) {
    errorToastMessage(msg: 'invalid email id, @ is missing');
    return false;
  } else if (name.isEmpty) {
    errorToastMessage(msg: 'name cannot be empty');
    return false;
  } else if (university.isEmpty) {
    errorToastMessage(msg: 'university cannot be empty');
    return false;
  } else if (gender.isEmpty) {
    errorToastMessage(msg: 'gender cannot be empty');
    return false;
  } else if (level.isEmpty) {
    errorToastMessage(msg: 'level is empty, please select again');
    return false;
  } else if (password.isEmpty || password.length < 8) {
    errorToastMessage(msg: 'provide a password with 8 or more characters');
    return false;
  } else if (password != confirmPassword) {
    errorToastMessage(msg: 'password mismatch');
    return false;
  } else {
    return true;
  }
}

bool validateProfileEdit(
  String email,
  String name,
  String country,
  String dialCode,
  String code,
  String phone,
) {
  if (email.isEmpty) {
    errorToastMessage(msg: 'email cannot be empty');
    return false;
  } else if (!email.contains('.')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else if (!email.contains('@')) {
    errorToastMessage(msg: 'invalid email id, @ is missing');
    return false;
  } else if (name.isEmpty) {
    errorToastMessage(msg: 'name cannot be empty');
    return false;
  } else if (country.isEmpty) {
    errorToastMessage(msg: 'country not selected');
    return false;
  } else if (phone.isEmpty) {
    errorToastMessage(msg: 'phone number cannot be empty');
    return false;
  } else if (code.isEmpty) {
    errorToastMessage(msg: 'country code is empty, please select again');
    return false;
  } else {
    return true;
  }
}

bool validateLogin(String email, String password) {
  if (email.isEmpty) {
    errorToastMessage(msg: 'email cannot be empty');
    return false;
  } else if (!email.contains('.')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else if (!email.contains('@')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else if (password.isEmpty || password.length < 8) {
    errorToastMessage(msg: 'provide a password with 8 or more characters');
    return false;
  } else {
    return true;
  }
}

bool validateEmail(String email) {
  if (email.isEmpty) {
    errorToastMessage(msg: 'email cannot be empty');
    return false;
  } else if (!email.contains('.')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else if (!email.contains('@')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else {
    return true;
  }
}

bool validateEvent(
  String title,
  String description,
  String date,
  String venue,
  String photoUrl,
) {
  if (title.isEmpty) {
    errorToastMessage(msg: 'title of event cannot be empty');
    return false;
  } else if (description.isEmpty) {
    errorToastMessage(msg: 'description of event cannot be empty');
    return false;
  } else if (date.isEmpty) {
    errorToastMessage(msg: 'date of event cannot be empty');
    return false;
  } else if (venue.isEmpty) {
    errorToastMessage(msg: 'venue of event cannot be empty');
    return false;
  } else if (photoUrl.isEmpty) {
    errorToastMessage(msg: 'You did not pick an image, try again');
    return false;
  } else {
    return true;
  }
}

bool validateQuestion(
  String body,
  String category,
) {
  if (body.isEmpty) {
    errorToastMessage(msg: 'your thoughts cannot be empty');
    return false;
  } else if (category.isEmpty) {
    errorToastMessage(msg: 'category cannot be empty');
    return false;
  } else {
    return true;
  }
}

class Constants {
  Constants._();
  static const double padding = 10;
  static const double avatarRadius = 45;
}

const APIKEY = 'AIzaSyBwtUGqZTCqrko-e6KCo2S1bGQsraAkmOQ';

List<String> eventTypes = ["Video Event", "Picture Event"];
List<String> genderOptions = ["Male", "Female"];
List<String> maritalOptions = ["Single", "Married", "Divorced"];
List<String> levelOptions = ["Undergraduate", "Postgraduate"];
List<String> newsCategory = [
  'Scholarship',
  'Internship',
  'Grant',
  'Education',
  'Excursion',
  'Politics',
  'Agriculture',
  'Jobs',
  'Business',
  'Others'
];
List<String> questionCategory = [
  "Finances",
  "Relationship",
  "Family",
  "Education",
  "Spirituality",
  "Health"
];

final createdAt = DateTime.now().toUtc().toString();

int getLikeCount(likes) {
  // if no likes, return 0
  if (likes == null) {
    return 0;
  }
  int count = 0;
  // if the key is explicitly set to true, add a like
  likes.values.forEach((val) {
    if (val == true) {
      count += 1;
    }
  });
  return count;
}

int getViews(views) {
  // if no likes, return 0
  if (views == null) {
    return 0;
  }
  int count = 0;
  // if the key is explicitly set to true, add a like
  views.values.forEach((val) {
    if (val == true) {
      count += 1;
    }
  });
  return count;
}

String getCount(int count) {
  String _stPosts = "0";
  double _dbPosts = 0.0;

  if (count < 1000) {
    _stPosts = count.toString() + " ";
  } else if (count >= 1000 && count < 1000000) {
    _dbPosts = count / 1000;
    _stPosts = _dbPosts.toStringAsFixed(1) + "K";
  } else if (count >= 1000000 && count < 1000000000) {
    _dbPosts = count / 1000000;
    _stPosts = _dbPosts.toStringAsFixed(1) + "M";
  } else {
    _dbPosts = count / 1000000000;
    _stPosts = _dbPosts.toStringAsFixed(1) + "B";
  }
  return _stPosts;
}

int getCommentCount(comments) {
  // if no likes, return 0
  if (comments == null) {
    return 0;
  }
  int count = 0;
  // if the key is explicitly set to true, add a like
  comments.values.forEach((val) {
    if (val == true) {
      count += 1;
    }
  });
  return count;
}

String getTimestamp(String date) {
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

dynamic fromDateTimeToJson(DateTime date) {
  return date.toUtc();
}

showDownloadProgress(received, total) {
  if (total != -1) {
    print((received / total * 100).toStringAsFixed(0) + "%");
  }
}
