import 'package:flutter/material.dart';
import 'package:material_sharing/core/widgets/other_widgets.dart';
import 'package:material_sharing/core/widgets/profile_picture.dart';

// ignore: must_be_immutable
class LectureShareContainer extends StatefulWidget {
  LectureShareContainer({
    Key? key,
    this.isSourced = false,
    this.origin,
    this.course,
    this.level,
    this.topic,
    this.fileTypeIcon,
    this.fileName,
    this.noOfDownloads,
    this.timeStamp,
    this.userName,
    this.onDownloadTap,
    this.onuserTap,
    this.postId,
    this.isOwner = false,
    this.filePath,
    this.ownerId,
    this.userImage,
    this.onsourcedTap,
    this.onFileTaP,
  }) : super(key: key);
  final String? course;
  final String? level;
  final String? origin;
  final bool? isSourced;
  final String? topic;
  final IconData? fileTypeIcon;
  final String? fileName;
  final String? noOfDownloads;
  final String? timeStamp;
  final bool isOwner;
  final String? userName, filePath;
  final String? ownerId, postId;
  final ImageProvider? userImage;
  final Function()? onDownloadTap, onFileTaP;
  final Function()? onuserTap;
  final Function()? onsourcedTap;

  @override
  _LectureShareContainerState createState() => _LectureShareContainerState();
}

class _LectureShareContainerState extends State<LectureShareContainer>
    with SingleTickerProviderStateMixin {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 15.0,
        right: 15.0,
        bottom: 10.0,
      ),
      padding: EdgeInsets.only(
        left: 8.5,
        right: 13.0,
        top: 12.0,
        bottom: 10.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(
              0.0,
              2.5,
            ),
            blurRadius: 8.0,
            color: Colors.black26,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.course ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 13.0,
                ),
              ),
              Text(
                widget.level ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
          Divider(
            height: 3.0,
            color: Colors.grey,
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.topic ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              widget.isOwner
                  ? DeleteEditPopUp(
                      isOwner: widget.isOwner,
                      isEditable: false,
                      delete: () async {
                        Navigator.pop(context);
                      },
                      edit: () {},
                    )
                  : Container(),
            ],
          ),
          SizedBox(height: 8.5),
          Container(
            padding: EdgeInsets.only(
              left: 11.0,
              top: 12.0,
              bottom: 12.3,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: widget.onFileTaP,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    widget.fileTypeIcon,
                    size: 29.0,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 9.7),
                  Expanded(
                    child: Text(
                      widget.fileName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.5),
          SizedBox(height: 8.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: widget.onDownloadTap,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.preview_sharp,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    SizedBox(width: 4.7),
                    Text(
                      '${widget.noOfDownloads} Views' ?? '0',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        size: 15.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.7),
                      Text(
                        widget.timeStamp ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 14.7),
          Divider(
            height: 3.0,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: widget.onuserTap,
                child: Row(
                  children: <Widget>[
                    const ProfilePicture(
                      image: AssetImage('images/user.png'),
                      width: 30.0,
                      height: 29.5,
                    ),
                    SizedBox(width: 8.5),
                    Text(
                      widget.userName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.download,
                color: Colors.green,
              )
            ],
          ),
          SizedBox(height: 9.7),
        ],
      ),
    );
  }
}
