import 'dart:convert';
//import 'dart:html';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gowawe/tab_bar_view/Anasayfa.dart';
import 'package:gowawe/tab_bar_view/SirketProfili.dart';
import 'package:gowawe/tab_bar_view/UrunLlistesi.dart';
import 'package:gowawe/tab_bar_view/SaticiGeriBildirimi.dart';
import 'package:gowawe/tab_bar_view/Iletisim.dart';

double size = 0;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class MyTabBar extends StatefulWidget {
  var a;
  MyTabBar({Key key, children, @required this.a}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

//final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

var items = [
  'item1',
  'item2',
  'item3',
  'item4',
  'item5',
  'item6',
];

final item = [
  'item1',
  'item2',
  'item3',
  'item4',
  'item5',
];

String dropdownValue = 'One';
// List of items in our dropdown menu

/*@override
Widget build(BuildContext context) {
  size = sqrt((MediaQuery.of(context).size.height *
      MediaQuery.of(context).size.height) +
      (MediaQuery.of(context).size.width *
          MediaQuery.of(context).size.width));*/

 List<Tab> tabs = <Tab>[
  Tab(text: "Anasayfa",),
  Tab(text: 'Sirket Profil'),
  Tab(text: 'Ürünler Listesi'),
  Tab(text: 'Satıcı Geri\nBildirimi'),
  Tab(text: 'İletişim'),
];

class _MyTabBarState extends State<MyTabBar> {
  var data;
  var result;

  Future _fetchPost() async {
    http.Response response = await http.get('https://gowawe.com/api/products');

    if (response.statusCode == 200)
      print(response.statusCode);
    else
      print(response.statusCode);

    setState(() {
      String jsonsDataString = response.body
          .toString(); // toString of Response's body is assigned to jsonDataString
      result = response.body;
      data = jsonDecode(jsonsDataString).toString();
      print("JSON VERİSİ->> " + data.toString());
      print("JSON AYRIŞTIRMA->> " + data[3]);
      //print("json->>> " + _data.toString());
    });

    return "Success";
  }

  @override
  void initState() {
    _fetchPost();

    super.initState();
  }

  /* @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  ProductsService _productsService = ProductsService();
  ProductModel? products;

  getProduct() async {
    products = (await _productsService.getProducts()) as ProductModel?;
  }*/

  @override
  Widget build(BuildContext context) {
    size = sqrt((MediaQuery.of(context).size.height *
            MediaQuery.of(context).size.height) +
        (MediaQuery.of(context).size.width *
            MediaQuery.of(context).size.width));


    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,

              ),
            );

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF484848),
            shadowColor: Colors.white,
            toolbarHeight: size * 0.04,
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(vertical: size * 0.01),
              child: TabBar(
                tabs: tabs,
                isScrollable: true,
                physics: BouncingScrollPhysics(),
                labelStyle:  TextStyle(
                  fontSize: size*0.014,
                  color: Colors.red,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(size * 0.016)),
                  border: Border.all(width: size * 0.003, color: Colors.amber),
                  color: Color.fromRGBO(251, 229, 128, 1),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child: tab.text == "Anasayfa"
                    ? Anasayfa()
                    : tab.text == "Sirket Profil"
                    ? SirketProfili()
                    : tab.text == "Ürünler Listesi"
                    ? UrunListesi()
                    : tab.text == "Satıcı Geri\nBildirimi"
                    ? SaticiGeriBildirimi()
                    : tab.text == "İletişim"
                    ? Iletisim()
                    : Anasayfa(),
              );
            }).toList(),
          ),
        );

    }));
  }

  Widget Anasayfa() {
    return duygu(anasayfaData: widget.a);
  }

  Widget SirketProfili() {
    return Sirketprofili();
  }

  Widget UrunListesi() {
    return urunListesi();
  }

  Widget SaticiGeriBildirimi() {
    return saticigeribildirim();
  }

  Widget Iletisim() {
    return iletisim();
  }

  iconView() {
    int secondColumn = 0;

    if (secondColumn == 0) {
      return Text("-");
    } else {
      return Icon(
        Icons.check_circle,
        color: Colors.blue,
        size: 18,
      );
    }
  }

 /* List<Widget> UrunList() {
    int UrunLength = 6;
    List<Widget> requests = List.filled(
        UrunLength /*Urun Sayısı JSON formatından gelecek*/, Container());
    List<Widget> requests2 = List.filled(
        1,
        Container(
            //text yaz
            ));

    if (UrunLength == 0) {
      return requests2;
    } else {
      if (UrunLength % 2 == 1) {
        for (int i = 0; i <= (UrunLength / 2).toInt(); i++) {
          print("Sonuc->> " +
              i.toString() +
              " -- " +
              (((UrunLength / 2) - 1).toInt()).toString() +
              " MOD->>" +
              (UrunLength % 2).toString());
          requests[i] = i == ((UrunLength - 1) / 2).toInt() &&
                  UrunLength % 2 == 1
              ? Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/indir.png",
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, top: 4, bottom: 4),
                              child: Text(
                                "Ürün adı Ürün Adı Ürün  ",
                                style: TextStyle(
                                  fontSize: size * 0.018,
                                  //fontWeight: FontWeight.w600,
                                ),
                              ),
                            ), //Ürün Adı

                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.black,
                                          size: size * 0.03,
                                        ),

                                        Text(
                                          "860",
                                          style: TextStyle(
                                            fontSize: size * 0.03,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        //Fiyat Bilgisi
                                      ],
                                    ),
                                  ), //1.Ücret
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.black,
                                          size: size * 0.03,
                                        ),

                                        Text(
                                          "890",
                                          style: TextStyle(
                                            fontSize: size * 0.03,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        //Fiyat Bilgisi
                                      ],
                                    ),
                                  ), //2. Ücret
                                ],
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "1 /Parça",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "(min. sipariş)",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        //fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ), //Min. Sipariş
                              ],
                            ), //Parça Sayısı
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/indir.png",
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, top: 4, bottom: 4),
                              child: Text(
                                "Ürün adı Ürün Adı Ürün  ",
                                style: TextStyle(
                                  fontSize: size * 0.018,
                                  //fontWeight: FontWeight.w600,
                                ),
                              ),
                            ), //Ürün Adı

                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.black,
                                          size: size * 0.03,
                                        ),

                                        Text(
                                          "860",
                                          style: TextStyle(
                                            fontSize: size * 0.03,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        //Fiyat Bilgisi
                                      ],
                                    ),
                                  ), //1.Ücret
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.black,
                                          size: size * 0.03,
                                        ),

                                        Text(
                                          "890",
                                          style: TextStyle(
                                            fontSize: size * 0.03,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        //Fiyat Bilgisi
                                      ],
                                    ),
                                  ), //2. Ücret
                                ],
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "1 /Parça",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "(min. sipariş)",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        //fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ), //Min. Sipariş
                              ],
                            ), //Parça Sayısı
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/indir.png",
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, top: 4, bottom: 4),
                              child: Text(
                                "Ürün adı Ürün Adı Ürün  ",
                                style: TextStyle(
                                  fontSize: size * 0.018,
                                  //fontWeight: FontWeight.w600,
                                ),
                              ),
                            ), //Ürün Adı

                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.black,
                                          size: size * 0.03,
                                        ),

                                        Text(
                                          "860",
                                          style: TextStyle(
                                            fontSize: size * 0.03,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        //Fiyat Bilgisi
                                      ],
                                    ),
                                  ), //1.Ücret
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.black,
                                          size: size * 0.03,
                                        ),

                                        Text(
                                          "890",
                                          style: TextStyle(
                                            fontSize: size * 0.03,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        //Fiyat Bilgisi
                                      ],
                                    ),
                                  ), //2. Ücret
                                ],
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "1 /Parça",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "(min. sipariş)",
                                      style: TextStyle(
                                        fontSize: size * 0.02,
                                        //fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ), //Min. Sipariş
                              ],
                            ), //Parça Sayısı
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        }
      } else {
        for (int i = 1; i <= (UrunLength / 2).toInt(); i++) {
          print("Sonuc->> " +
              i.toString() +
              " -- " +
              (((UrunLength / 2) - 1).toInt()).toString() +
              " MOD->>" +
              (UrunLength % 2).toString());
          requests[i] = Row(
            children: [
              Flexible(
                flex: 1,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/indir.png",
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            right: 20, left: 20, top: 4, bottom: 4),
                        child: Text(
                          "Ürün adı Ürün Adı Ürün  ",
                          style: TextStyle(
                            fontSize: size * 0.018,
                            //fontWeight: FontWeight.w600,
                          ),
                        ),
                      ), //Ürün Adı

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.black,
                                    size: size * 0.03,
                                  ),

                                  Text(
                                    "860",
                                    style: TextStyle(
                                      fontSize: size * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  //Fiyat Bilgisi
                                ],
                              ),
                            ), //1.Ücret
                            Flexible(
                              flex: 1,
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontSize: size * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.black,
                                    size: size * 0.03,
                                  ),

                                  Text(
                                    "890",
                                    style: TextStyle(
                                      fontSize: size * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  //Fiyat Bilgisi
                                ],
                              ),
                            ), //2. Ücret
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "1 /Parça",
                                style: TextStyle(
                                  fontSize: size * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "(min. sipariş)",
                                style: TextStyle(
                                  fontSize: size * 0.02,
                                  //fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ), //Min. Sipariş
                        ],
                      ), //Parça Sayısı
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/indir.png",
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            right: 20, left: 20, top: 4, bottom: 4),
                        child: Text(
                          "Ürün adı Ürün Adı Ürün  ",
                          style: TextStyle(
                            fontSize: size * 0.018,
                            //fontWeight: FontWeight.w600,
                          ),
                        ),
                      ), //Ürün Adı

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.black,
                                    size: size * 0.03,
                                  ),

                                  Text(
                                    "860",
                                    style: TextStyle(
                                      fontSize: size * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  //Fiyat Bilgisi
                                ],
                              ),
                            ), //1.Ücret
                            Flexible(
                              flex: 1,
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontSize: size * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.black,
                                    size: size * 0.03,
                                  ),

                                  Text(
                                    "890",
                                    style: TextStyle(
                                      fontSize: size * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  //Fiyat Bilgisi
                                ],
                              ),
                            ), //2. Ücret
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "1 /Parça",
                                style: TextStyle(
                                  fontSize: size * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "(min. sipariş)",
                                style: TextStyle(
                                  fontSize: size * 0.02,
                                  //fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ), //Min. Sipariş
                        ],
                      ), //Parça Sayısı
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }
      return requests;
    }
  }*/

  ButtonStyle myButtonStyle(Color back) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(back),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.5)),
      shadowColor: MaterialStateProperty.all<Color>(Colors.yellow),
    );

    /*Widget build(BuildContext context) {        CARD TRANSFORMATİONS
      return Card(
        color: Colors.white,
        elevation: 2.0,
        child: OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          closedColor: Theme.of(context).cardColor,
          closedElevation: 0.0,
          openElevation: 4.0,
          transitionDuration: Duration(milliseconds: 1500),
          openBuilder: (BuildContext context, VoidCallback _) => THENEXTSCREEN(),
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return ListTile(
              leading: Icon(Icons.album),
              title: Text("ITEM NAME"),
            );
          },
        ),
      );
    }*/
  }

  Widget myIletisimCard() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 860,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xED090A3B),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: Text(
                "İletişim Bilgileri",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
            ),

            CircleAvatar(
              backgroundColor: Colors.yellow,
              radius: 105.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"),
                radius: 100.0,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "Hakan Aydın",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Text(
                "Genel Müdür",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        //Tıklandığında
                      },
                      icon: Icon(Icons.phone)),
                ),
              ),
            ), //TELEFON ICONU

            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                "+90 507 859 04 90",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        //Tıklandığında
                      },
                      icon: Icon(Icons.mail)),
                ),
              ),
            ), //ZARF ICONU

            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                "info@noftheritage.com",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 20, left: 20),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                //Tıklandığında
                              },
                              icon: Icon(Icons.facebook)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 20, left: 20),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                //Tıklandığında
                              },
                              icon: Icon(Icons.linked_camera)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 20, left: 20),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                //Tıklandığında
                              },
                              icon: Icon(Icons.facebook)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), //SOSYAL MEDYA ICONLARI
          ],
        ),
      ),
    );
  }

  myButtonList() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 6.0, color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.business,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Şirkete Genel Bakış",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.sync_alt_rounded,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Ticari Kabiliyetler",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.room_preferences_outlined,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Üretim Kabiliyetleri",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.fact_check_outlined,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Kalilte Kontrol",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.saved_search,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Araştırma Geliştirme Kabiliyeti",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.flight_takeoff_rounded,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "İhalat Kabiliyeti",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.apartment_sharp,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Fuarlar",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.fact_check,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Sertifikalar ve Marka Tescil",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.photo_library_outlined,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Şirket Fotoğrafları",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //TIKLANDIĞINDAAA
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black12,
              indent: 10,
              endIndent: 10,
            ),

            TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: size * 0.5,
                  height: size * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.contact_phone,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "İletişim",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white54.withOpacity(0.5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
              ),
              onPressed: () {
                //Navigator.push(
                //  context,
                //MaterialPageRoute(builder: (context) => Iletisim()),
                //);
              },
            ), //iletişim
          ],
        ),
      ),
    );
  }
}
