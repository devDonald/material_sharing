import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  final String categroy;
  SubCategory({Key? key, required this.categroy}) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.pink,
        title: Text('${widget.categroy} News',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: -5.0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CategoryList(
              title: "Federal Government Scholarship 2022",
              description:
                  'The federal government of Nigeria has open the portal for the 2022 bilateral scholarship',
              onTap: () {}),
          CategoryList(
              title: "PTDF Scholarship 2022",
              description:
                  'The Portal is open for PTDF overseas scholarship. interested participants should kindly apply now',
              onTap: () {})
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final String title, description;
  final Function() onTap;

  const CategoryList(
      {Key? key,
      required this.title,
      required this.description,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenSize.width,
        height: 100.0,
        margin: EdgeInsets.only(top: 2.5, bottom: 2.0, left: 7.0, right: 7.0),
        //padding: EdgeInsets.only(left: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 2.5),
              blurRadius: 10.5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.blue),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    softWrap: false,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}
