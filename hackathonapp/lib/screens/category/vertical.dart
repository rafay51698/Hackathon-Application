import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/model/all_data.dart';
import 'package:hackathonapp/theme/colors.dart';

class VertView extends StatefulWidget {
  const VertView({Key? key}) : super(key: key);

  @override
  _VertViewState createState() => _VertViewState();
}

class _VertViewState extends State<VertView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: vertItems.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.5,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset.fromDirection(2, 2)),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Image.asset(
                        vertItems[index].img,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (vertItems[index].isFav) {
                            vertItems[index].isFav = false;
                            favoritelist.removeAt(index);
                          } else {
                            vertItems[index].isFav = true;
                            favoritelist.insert(0, vertItems[index]);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: vertItems[index].isFav ? Colors.red : black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(1, -1),
                    child: discount(),
                  ),
                  Align(
                    alignment: Alignment(-1.1, 1),
                    child: vertItemName(vertItems[index].name),
                  ),
                  Align(
                    alignment: const Alignment(1.2, 1.2),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Column(
                        children: [
                          const Text(
                            "\$50",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cartlist.add(vertItems[index]);
                                counter++;
                              });
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget discount() {
    return Container(
      height: 20,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: secondary),
      child: Center(
        child: Text(
          "30% off",
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget vertItemName(String vertitemname) {
    return Container(
      height: 20,
      width: 100,
      child: Center(
        child: Text(
          vertitemname,
          style: TextStyle(fontWeight: FontWeight.bold, color: secondary),
        ),
      ),
    );
  }
}
