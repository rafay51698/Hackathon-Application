import 'package:flutter/material.dart';
import 'package:hackathonapp/model/all_data.dart';
import 'package:hackathonapp/screens/cart.dart';
import 'package:hackathonapp/screens/navappbars/appbar.dart';

import 'package:hackathonapp/screens/drawer/drawer.dart';
import 'package:hackathonapp/theme/colors.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: primary,
        title: Text(
          'Favourites',
          style: const TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.red,
              )),
          action(context),
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: const Footer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: favoritelist.length,
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
                            alignment: const Alignment(0, 0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Image.asset(
                                favoritelist[index].img,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  favoritelist.removeAt(index);
                                  vertItems[index].isFav = false;
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(1, -1),
                            child: discount(),
                          ),
                          Align(
                            alignment: Alignment(-1.1, 1),
                            child: vertItemName(favoritelist[index].name),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cartlist.add(favoritelist[index]);
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
            ),
          ],
        ),
      ),
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

  Widget action(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(cartlist.length.toString()),
          ),
          Align(
            // alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
