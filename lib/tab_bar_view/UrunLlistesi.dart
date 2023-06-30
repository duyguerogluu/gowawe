import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gowawe/tab_bar_view/tab_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gowawe/model/LoadData.dart';

Future<Object> apiCall() async {
  final response = await http.get('https://gowawe.com/api/products');
  ProductModel model = productModelFromJson(response.body);
  if (response.statusCode == 200) {
    return model;
  } else {
    throw Exception('Bir hata oluştu');
  }
}

class urunListesi extends StatefulWidget {
  const urunListesi({Key key}) : super(key: key);

  @override
  _urunListesiState createState() => _urunListesiState();
}

class _urunListesiState extends State<urunListesi>    {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiCall(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProductModel a = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: size * 0.01, right: size * 0.01),
                child: Column(children: [
                  GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(a.data.length, (index) {
                        return Padding(
                          padding: EdgeInsets.all(size * 0.01),
                          child: Card(
                            shadowColor: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Image.network(
                                          a.data[index].photo ??
                                              "http://openmart.online/frontend/imgs/no_image.png?v=1",
                                          // fit: BoxFit.fitWidth,
                                          //height: size*0.9,
                                        ),
                                      ),
                                      //const SizedBox(height: 2),
                                    ],
                                  ),

                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      a.data[index].title,
                                      style: TextStyle(
                                        fontSize: size * 0.018,
                                        //fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ), //Ürün Adı

                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                a.data[0].currencyId == 156
                                                    ? "\$"
                                                    : "seda",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: size * 0.024,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ), //Dolar İşareti

                                              Text(
                                                a.data[0].priceLower,
                                                style: TextStyle(
                                                  fontSize: size * 0.028,
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
                                              Text(
                                                a.data[0].currencyId == 156
                                                    ? "\$"
                                                    : "seda",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: size * 0.024,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),

                                              Text(
                                                a.data[0].priceUpper,
                                                style: TextStyle(
                                                  fontSize: size * 0.028,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              //Fiyat Bilgisi
                                              const SizedBox(height: 80),
                                            ],
                                          ),
                                        ), //2. Ücret
                                      ],
                                    ),
                                  ),

                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Text(
                                              "${a.data[0].minOrder} / Parça",
                                              style: TextStyle(
                                                fontSize: size * 0.02,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Text(
                                              "(min. sipariş)",
                                              style: TextStyle(
                                                fontSize: size * 0.016,
                                                //fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ), //Min. Sipariş
                                      ],
                                    ),
                                  ), //Parça Sayısı
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ]),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
