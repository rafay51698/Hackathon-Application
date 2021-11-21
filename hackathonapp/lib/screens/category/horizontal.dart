import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/model/all_data.dart';
import 'package:hackathonapp/theme/colors.dart';

class HorView extends StatefulWidget {
  const HorView({Key? key}) : super(key: key);

  @override
  _HorViewState createState() => _HorViewState();
}

class _HorViewState extends State<HorView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //given height of listview.builder
      margin: const EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: horItems.length,
          itemBuilder: (context, index) {
            return horizontal(horItems[index].img, horItems[index].name);
          }),
    );
  }

  Widget horizontal(img, horitemname) {
    return Container(
      //main container with picture and text
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.8), blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(10)),

      width: MediaQuery.of(context).size.width * 0.50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: double.infinity,
            width: 50,
            child: Image.asset(img),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                horitemname,
                style: TextStyle(color: black, fontWeight: FontWeight.w700),
              ),
              Text(
                "10 Pieces left",
                style: TextStyle(color: secondary, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ],
      ),
    );
  }
}
