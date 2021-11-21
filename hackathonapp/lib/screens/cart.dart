import 'package:flutter/material.dart';
import 'package:hackathonapp/model/all_data.dart';
import 'package:hackathonapp/screens/drawer/drawer.dart';
import 'package:hackathonapp/screens/fav.dart';
import 'package:hackathonapp/theme/colors.dart';
import 'package:hackathonapp/screens/navappbars/appbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: primary,
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
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
                  itemCount: cartlist.length,
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
                                cartlist[index].img,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-1, -1),
                            child: discount(),
                          ),
                          Align(
                            alignment: Alignment(-1.1, 0.7),
                            child: vertItemName(cartlist[index].name),
                          ),
                          Align(
                            alignment: Alignment(-1, 1),
                            child: Container(
                              width: 80,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Check Out',
                                  style:
                                      TextStyle(color: primary, fontSize: 10),
                                ),
                              ),
                            ),
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
                                        cartlist.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: black,
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
