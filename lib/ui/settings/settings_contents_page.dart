import 'package:flutter/material.dart';
import 'package:duit.in/theme/theme.dart';

class ContentsPage extends StatefulWidget{
  const ContentsPage({Key? key}) : super(key: key);

  @override
  State<ContentsPage> createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage>{
  Widget openingPlate(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 28,
              color: black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            child: Text('Contents', style: defaultTextTheme.copyWith(
              fontSize: 32,
              fontWeight: light,
            )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: openingPlate(),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                ],
              ),
            )
          ],
        )
    );
  }
}
