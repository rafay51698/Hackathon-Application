import 'package:flutter/material.dart';
import 'package:hackathonapp/theme/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(top: 18, bottom: 20),
          height: MediaQuery.of(context).size.height * 0.070,
          width: MediaQuery.of(context).size.width * 0.92,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: foreground.withOpacity(0.1)),
          child: const TextField(
            style: TextStyle(color: Colors.grey),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 17)),
          ),
        ),
      ),
    );
  }
}
