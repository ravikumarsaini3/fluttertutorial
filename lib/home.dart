import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:installitaion_class_datatype_variable_theme_route/login.dart';
import 'package:installitaion_class_datatype_variable_theme_route/models/model.dart';
import 'package:installitaion_class_datatype_variable_theme_route/widget/itemview.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final url =
      'https://m.media-amazon.com/images/I/61PumHSySxL._AC_UF1000,1000_QL80_.jpg';

  final url2 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh3TlKxGJVcODV6qUQvl7XOYdYL0MSDE_8TT87-07-RQ&s";

  final url3 =
      "https://cdn.pixabay.com/photo/2023/06/23/08/51/lord-krishna-8083043_640.png";

  final url4 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBliaJgqG1AmFjx8ISlGS9l7y8BMM0wmwFy0wTWb1LdRV1rLt_p0j-1rx7_b4JMB1ciVw&usqp=CAU";
  @override
  void initState() {
    super.initState();

    loadjson();
  }

  void loadjson() async {
    Future.delayed(const Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/product.json");
    final decodedata = jsonDecode(catalogjson);
    var productdata = decodedata["products"];
    catalogModel.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    // print(productdata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //  final dummylist = List.generate(30, (index) => itemmodel.items[0]);
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          ' Home Screen ',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        drawer: Drawer(
          backgroundColor: Colors.teal.shade800,
          elevation: 10,
          shadowColor: Colors.teal,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 1),
                ),
                margin: const EdgeInsets.all(1),
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.teal.shade800),
                  margin: EdgeInsets.zero,
                  accountName: const Text(
                    'Ravi saini',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: const Text(
                    'ravik392320@gmail.com',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(url3),
                    minRadius: 30,
                  ),
                  arrowColor: Colors.black,
                  onDetailsPressed: () {},
                  /*  otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(url),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(url2),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(url3),
                  )
                ],*/
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Loginpage();
                    },
                  ));
                },
                // autofocus: true,
                // enabled: true,
                trailing: const Icon(Icons.arrow_right_sharp),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(url2),
                  //   foregroundImage: NetworkImage(url),
                ),
                title: const Text(
                  'Shri Krishna',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Divider(
                  // thickness: 400,
                  ),
              ListTile(
                autofocus: true,
                enabled: true,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(url4),
                  //   foregroundImage: NetworkImage(url),
                ),
                title: const Text(
                  'Shri Radha Rani',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        ),
        body: (catalogModel.items.isNotEmpty)
            ? GridView.builder(
                itemCount: catalogModel.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final item = catalogModel.items[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: GridTile(
                        child: Image.network(item.image),
                        header: Text(item.name),
                        footer: Text("R${item.price.toString()}"),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
