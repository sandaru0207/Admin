import 'dart:convert';
import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/config/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class overview extends StatefulWidget {
  overview({super.key});

  @override
  State<overview> createState() => _overviewState();
}

class _overviewState extends State<overview> {
  int oveg_count = 0;
  int oveg_price = 0;
  int oegg_count = 0;
  int oegg_price = 0;
  int ochicken_count = 0;
  int ochicken_price = 0;
  int orice_count = 0;
  int orice_price = 0;
  int okottu_count = 0;
  int okottu_price = 0;
  int ofish_count = 0;
  int ofish_price = 0;

  int dveg_count = 0;
  int dveg_price = 0;
  int degg_count = 0;
  int degg_price = 0;
  int dchicken_count = 0;
  int dchicken_price = 0;
  int drice_count = 0;
  int drice_price = 0;
  int dkottu_count = 0;
  int dkottu_price = 0;
  int dfish_count = 0;
  int dfish_price = 0;

  int cveg_count = 0;
  int cveg_price = 0;
  int cegg_count = 0;
  int cegg_price = 0;
  int cchicken_count = 0;
  int cchicken_price = 0;
  int crice_count = 0;
  int crice_price = 0;
  int ckottu_count = 0;
  int ckottu_price = 0;
  int cfish_count = 0;
  int cfish_price = 0;

  int users = 0;

  @override
  void initState() {
    super.initState();
    updatelist();
    updatedeliverlist();
    updatecompletedlist();
    getUserCounts();
  }

  void getUserCounts() async {
    var response = await http.get(Uri.parse(getUserCount));

    var json = jsonDecode(response.body);
    print(json);

    if (json['status']) {
      setState(() {
        users = json['userCount'];
      });
    } else {
      print("not susces");
    }
  }

  void updatelist() async {
    var response = await http.get(Uri.parse(getoverview));

    var json = jsonDecode(response.body);

    if (json['status']) {
      setState(() {
        oveg_count = json['totalVegCount'];
        oveg_price = json['vegPrice'];
        oegg_count = json['totalEggCount'];
        oegg_price = json['eggPrice'];
        ochicken_count = json['totalChickenCount'];
        ochicken_price = json['chickenPrice'];
        orice_count = json['totalRiceCount'];
        orice_price = json['ricePrice'];
        okottu_count = json['totalKottuCount'];
        okottu_price = json['kottuPrice'];
        ofish_count = json['totalFishCount'];
        ofish_price = json['fishPrice'];
      });
    } else {
      print("not susces");
    }
  }

  void updatedeliverlist() async {
    var response = await http.get(Uri.parse(getdeliveroverview));

    var json = jsonDecode(response.body);

    if (json['status']) {
      setState(() {
        dveg_count = json['totalVegCount'];
        dveg_price = json['vegPrice'];
        degg_count = json['totalEggCount'];
        degg_price = json['eggPrice'];
        dchicken_count = json['totalChickenCount'];
        dchicken_price = json['chickenPrice'];
        drice_count = json['totalRiceCount'];
        drice_price = json['ricePrice'];
        dkottu_count = json['totalKottuCount'];
        dkottu_price = json['kottuPrice'];
        dfish_count = json['totalFishCount'];
        dfish_price = json['fishPrice'];
      });
    } else {
      print("not susces");
    }
  }

  void updatecompletedlist() async {
    var response = await http.get(Uri.parse(getcompletedoverview));

    var json = jsonDecode(response.body);

    if (json['status']) {
      setState(() {
        cveg_count = json['totalVegCount'];
        cveg_price = json['vegPrice'];
        cegg_count = json['totalEggCount'];
        cegg_price = json['eggPrice'];
        cchicken_count = json['totalChickenCount'];
        cchicken_price = json['chickenPrice'];
        crice_count = json['totalRiceCount'];
        crice_price = json['ricePrice'];
        ckottu_count = json['totalKottuCount'];
        ckottu_price = json['kottuPrice'];
        cfish_count = json['totalFishCount'];
        cfish_price = json['fishPrice'];
      });
    } else {
      print("not susces");
    }
  }

  @override
  Widget build(BuildContext context) {
    int vegPrice = oveg_price != 0 ? oveg_price : (dveg_price != 0 ? dveg_price : cveg_price);
    int eggPrice = oegg_price != 0 ? oegg_price : (degg_price != 0 ? degg_price : cegg_price);
    int chickenPrice = ochicken_price != 0 ? ochicken_price : (dchicken_price != 0 ? dchicken_price : cchicken_price);
    int fishPrice = ofish_price != 0 ? ofish_price : (dfish_price != 0 ? dfish_price : cfish_price);
    int ricePrice = orice_price != 0 ? orice_price : (drice_price != 0 ? drice_price : crice_price);
    int kottuPrice = okottu_price != 0 ? okottu_price : (dkottu_price != 0 ? dkottu_price : ckottu_price);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Background(
            child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            newMethod(size, vegPrice, eggPrice, chickenPrice, fishPrice, ricePrice, kottuPrice),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  top: size.width * 0.02,
                  bottom: size.width * 0.02,
                  right: size.width * 0.03),
              alignment: Alignment.center,
              width: size.width * 0.9,
              height: size.height * 0.07,
              margin: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.width * 0.03,
                  right: size.width * 0.03),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(119, 187, 162, 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    (((dveg_count + oveg_count + cveg_count) * vegPrice) +
                            ((oegg_count + degg_count + cegg_count) * eggPrice) +
                            ((ofish_count + dfish_count + cfish_count) * fishPrice) +
                            ((ochicken_count + dchicken_count + cchicken_count) *
                                chickenPrice) +
                            ((orice_count + drice_count + crice_count) * ricePrice) +
                            ((okottu_count + dkottu_count + ckottu_count) * kottuPrice))
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  top: size.width * 0.02,
                  bottom: size.width * 0.02,
                  right: size.width * 0.03),
              alignment: Alignment.center,
              width: size.width * 0.9,
              height: size.height * 0.07,
              margin: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.width * 0.03,
                  right: size.width * 0.03),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(119, 187, 162, 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Users",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    users.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                ],
              ),
            ),
          ]),
        )),
      ),
    );
  }

  Column newMethod(
    Size size,
    int vegPrice,
    int eggPrice,
    int chickenPrice,
    int fishPrice,
    int ricePrice,
    int kottuPrice,
  ) {
    return Column(
      children: <Widget>[
        summery(
            name: "Veg",
            oveg_count: oveg_count,
            dveg_count: dveg_count,
            cveg_count: cveg_count,
            oveg_price: vegPrice),
        summery(
            name: "Egg",
            oveg_count: oegg_count,
            dveg_count: degg_count,
            cveg_count: cegg_count,
            oveg_price: eggPrice),
        summery(
            name: "Chicken",
            oveg_count: ochicken_count,
            dveg_count: dchicken_count,
            cveg_count: cchicken_count,
            oveg_price: chickenPrice),
        summery(
            name: "Fish",
            oveg_count: ofish_count,
            dveg_count: dfish_count,
            cveg_count: cfish_count,
            oveg_price: fishPrice),
        summery(
            name: "Rice",
            oveg_count: orice_count,
            dveg_count: drice_count,
            cveg_count: crice_count,
            oveg_price: ricePrice),
        summery(
            name: "Kottu",
            oveg_count: okottu_count,
            dveg_count: dkottu_count,
            cveg_count: ckottu_count,
            oveg_price: kottuPrice)
      ],
    );
  }
}

class summery extends StatelessWidget {
  const summery({
    super.key,
    required this.name,
    required this.oveg_count,
    required this.dveg_count,
    required this.cveg_count,
    required this.oveg_price,
  });
  final String name;
  final int oveg_count;
  final int dveg_count;
  final int cveg_count;
  final int oveg_price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.03,
          top: size.width * 0.02,
          bottom: size.width * 0.02,
          right: size.width * 0.03),
      alignment: Alignment.center,
      width: size.width * 0.9,
      height: size.height * 0.20,
      margin: EdgeInsets.only(
          left: size.width * 0.03,
          bottom: size.width * 0.03,
          right: size.width * 0.03),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(119, 187, 162, 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.04,
                color: const Color.fromRGBO(60, 121, 98, 1.0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text(oveg_count.toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Deliver",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text(dveg_count.toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Completed",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text(cveg_count.toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name + " Total",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text((dveg_count + oveg_count + cveg_count).toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Rs",
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0))),
              Text(((dveg_count + oveg_count + cveg_count) * oveg_price).toString(),
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)))
            ],
          )
        ],
      ),
    );
  }
}
