
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gowawe/tab_bar_view/tab_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:gowawe/model/storeModel.dart' as storeModel;
/*final queryParameters = {
  'type': 'index',
  'storeId': 858,
};
final uri =
Uri.https('gowawe.com/api/member-store-main', '/api/v1/test/$', queryParameters); // buraya kendi endpoint'ini girersin
final response = await https.get(uri, headers: {
HttpHeaders.contentTypeHeader: 'application/json',
});*/

Future<Object> apiCall() async {
  final response = await http.get('https://gowawe.com/api/member-store-main?type=index&storeId=501');
  storeModel.StoreModel model = storeModel.storeModelFromJson(response.body);
  if (response.statusCode == 200) {
    return model;
  } else {
    throw Exception('Bir hata oluştu');
  }
}

double size = 0;

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String dropdownvalue = 'Ürünler';

  ScrollController _scrollController = ScrollController();
  Timer _timer;
  double _itemExtent = 100.0;
  Duration _scrollDuration = Duration(milliseconds: 300);
  Curve _scrollCurve = Curves.easeInOut;
  int _autoScrollIncrement = 1;
  int _currentScrollIndex = 0;

  List<Tab> tabs = <Tab>[
    const Tab(text: 'Zeroth'),
    const Tab(text: 'First'),
    const Tab(text: 'Second'),
  ];

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
    'item1',
    'item1',
    'item1',
    'item1',
    'item1',
  ];
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      _autoScrollIncrement = _currentScrollIndex == 0
          ? 1
          : _currentScrollIndex == imgList.length - 1
          ? -1
          : _autoScrollIncrement;
      _currentScrollIndex += _autoScrollIncrement;
      //_animateToIndex(_currentScrollIndex);
      setState(() {});
    });
  }

  bool success= false;

  @override
  Widget build(BuildContext context) {
    size = sqrt((MediaQuery.of(context).size.height *
            MediaQuery.of(context).size.height) +
        (MediaQuery.of(context).size.width *
            MediaQuery.of(context).size.width));




    return Scaffold(
      backgroundColor: Colors.white,

       // var snapshot: b,

      body: FutureBuilder(

          future: apiCall(),
          builder: (context, snapshot) {
            storeModel.StoreModel a = snapshot.data;
                if (snapshot.connectionState != ConnectionState.done) {
                  return  NestedScrollView(
                    headerSliverBuilder: (BuildContext context,
                        bool innerBoxScrolled) {
                      return [
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          expandedHeight: size * 0.36,
                          floating: false,
                          elevation: 0,
                          flexibleSpace: LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {

                                return FlexibleSpaceBar(
                                  collapseMode: CollapseMode.parallax,
                                  background: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size * 0.2, //BACKGROUND IMAGE
                                          child: Image.network(
                                            a.data.store.coverPhoto ??
                                                "https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.gergitavan.com%2Fwp-content%2Fuploads%2F2017%2F07%2Fdefault-placeholder-1024x1024-570x321.png&imgrefurl=http%3A%2F%2Fwww.gergitavan.com%2Fwp-content%2Fuploads%2F2017%2F07%2F%3FMA&tbnid=SnP4az_cMMS8AM&vet=12ahUKEwjzk-7qsZP2AhUGOhQKHS3EBjYQMygAegUIARC2AQ..i&docid=FhbfYfTIeklG9M&w=570&h=321&itg=1&q=default%20image&ved=2ahUKEwjzk-7qsZP2AhUGOhQKHS3EBjYQMygAegUIARC2AQ",
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: size * 0.01),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            //crossAxisAlignment:  CrossAxisAlignment.center,
                                            children: [
                                              ClipOval(
                                                child: SizedBox(
                                                  width: size * 0.1,
                                                  height: size * 0.1,
                                                  child: Image.network(
                                                    a.data.store.contactPhoto ??
                                                        "https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.gergitavan.com%2Fwp-content%2Fuploads%2F2017%2F07%2Fdefault-placeholder-1024x1024-570x321.png&imgrefurl=http%3A%2F%2Fwww.gergitavan.com%2Fwp-content%2Fuploads%2F2017%2F07%2F%3FMA&tbnid=SnP4az_cMMS8AM&vet=12ahUKEwjzk-7qsZP2AhUGOhQKHS3EBjYQMygAegUIARC2AQ..i&docid=FhbfYfTIeklG9M&w=570&h=321&itg=1&q=default%20image&ved=2ahUKEwjzk-7qsZP2AhUGOhQKHS3EBjYQMygAegUIARC2AQ",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ), //CIRCLE AVATARRRRR
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 20.0),
                                                    child: Row(
                                                      children:  [
                                                        Padding(
                                                          padding: EdgeInsets.only(left: 8.0),
                                                          child: Text(
                                                            a.data.store.companyName,//Firma Adı
                                                            style: TextStyle(
                                                              fontSize: size*0.02,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        Padding(
                                                          //CHECK ICON
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Icon(
                                                            Icons.check_circle,
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    //a.data.store.selectedInfos.
                                                    a.data.store.businessCategories[0].translations.tr,    //Şirket sektörü
                                                    style: TextStyle(
                                                      fontSize: size*0.02,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    width: size * 0.2,
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                          flex: 3,
                                                          child: Padding(
                                                            padding: EdgeInsets.all(size * 0.01),
                                                            child: Container(
                                                              width: size * 0.2,
                                                              decoration: BoxDecoration(
                                                                color: Colors.yellow,
                                                                borderRadius: BorderRadius.circular(
                                                                    5),
                                                              ),
                                                              // width: size * 0.2,
                                                              height: size * 0.03,
                                                              //witdh: size*0.04,
                                                              child: Center(
                                                                child: Text(
                                                                  "${a.data.visitsCount} Ziyaretçi",
                                                                  //"123 Ziyaretçi",
                                                                  style: TextStyle(
                                                                    fontSize: size*0.015,
                                                                    fontWeight: FontWeight.w300,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 2,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.yellow,
                                                              borderRadius: BorderRadius.circular(
                                                                  5),
                                                            ),
                                                            // width: size * 0.2,
                                                            height: size * 0.03,
                                                            child:  Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  left: 6.0, right: 6.0),
                                                              child: Center(
                                                                child: Text(
                                                                  "${a.data.productCount} Ürün",               //ÜRÜNNN
                                                                  //"18 Ürün",
                                                                  style: TextStyle(
                                                                    fontSize: size*0.015,
                                                                    fontWeight: FontWeight.w300,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              /* Padding(
                            padding:  EdgeInsets.only(left: size*0.008),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: size*0.01, left: size*0.02),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(
                                              50),
                                        ),
                                        child: IconButton(
                                            onPressed: () {
                                              launch("tel://05078590490");
                                            },
                                            icon: Icon(Icons.call)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size*0.01, left: size*0.02),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          //TIKLANDIĞINDA
                                          launch(
                                              "mail://erogluduyguduygu@gmail.com");
                                        },
                                        icon: Icon(Icons.email)),
                                  ),
                                ),
                              ],
                            ),
                          ),  */ //arama mail
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: size * 0.34,
                                              height: size * 0.046,
                                              child: ElevatedButton(
                                                style: myButtonStyle(Colors.blue),
                                                child: const Icon(
                                                  Icons.thumb_up_alt_outlined,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),
                                                onPressed: () {
                                                  //TIKLANDIĞINDAAA
                                                },
                                              ),
                                            ), // Beğen Butonu
                                            Container(
                                              width: size * 0.18,
                                              height: size * 0.046,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black,width: size*0.001),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: ElevatedButton(
                                                style: myButtonStyle(Colors.white),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("${a.data.followerCount}",style: TextStyle(color: Colors.black,fontSize: size*0.024),),          //Artı Butonu Takipci sayısı
                                                    const Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  //TIKLANDIĞINDAAA
                                                },
                                              ),
                                            ), //Artı ikonu
                                          ],
                                        ), //butonlar

                                      ],
                                    ),
                                  ),
                                );
                              }),

                        ),
                        //createSilverAppBar2()
                      ];
                    },
                    body: MyTabBar(a: a),
                  );

                } else {
                  return  NestedScrollView(
                    headerSliverBuilder: (BuildContext context,
                        bool innerBoxScrolled) {
                      return [
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          expandedHeight: size * 0.36,
                          floating: false,
                          elevation: 0,
                          flexibleSpace: LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {

                                return FlexibleSpaceBar(
                                  collapseMode: CollapseMode.parallax,
                                  background: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size * 0.2, //BACKGROUND IMAGE
                                          child: Image.network(
                                            a.data.store.coverPhoto ??
                                                "https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.gergitavan.com%2Fwp-content%2Fuploads%2F2017%2F07%2Fdefault-placeholder-1024x1024-570x321.png&imgrefurl=http%3A%2F%2Fwww.gergitavan.com%2Fwp-content%2Fuploads%2F2017%2F07%2F%3FMA&tbnid=SnP4az_cMMS8AM&vet=12ahUKEwjzk-7qsZP2AhUGOhQKHS3EBjYQMygAegUIARC2AQ..i&docid=FhbfYfTIeklG9M&w=570&h=321&itg=1&q=default%20image&ved=2ahUKEwjzk-7qsZP2AhUGOhQKHS3EBjYQMygAegUIARC2AQ",
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: size * 0.01),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            //crossAxisAlignment:  CrossAxisAlignment.center,
                                            children: [
                                              ClipOval(
                                                child: SizedBox(
                                                  width: size * 0.1,
                                                  height: size * 0.1,
                                                  child: Image.network(
                                                    a.data.store.contactPhoto ??
                                                        "https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.gergitavan.com%2Fwp-content%2Fuploads%2F2017%2F07%2Fdefault-placeholder-1024x1024-570x321.png&imgrefurl=http%3A%2F%2Fwww.gergitavan.com%2Fwp-content%2Fuploads%2F2017%2F07%2F%3FMA&tbnid=SnP4az_cMMS8AM&vet=12ahUKEwjzk-7qsZP2AhUGOhQKHS3EBjYQMygAegUIARC2AQ..i&docid=FhbfYfTIeklG9M&w=570&h=321&itg=1&q=default%20image&ved=2ahUKEwjzk-7qsZP2AhUGOhQKHS3EBjYQMygAegUIARC2AQ",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ), //CIRCLE AVATARRRRR
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 20.0),
                                                    child: Row(
                                                      children:  [
                                                        Padding(
                                                          padding: EdgeInsets.only(left: 8.0),
                                                          child: Text(
                                                            a.data.store.companyName,//Firma Adı
                                                            style: TextStyle(
                                                              fontSize: size*0.02,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        Padding(
                                                          //CHECK ICON
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Icon(
                                                            Icons.check_circle,
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    //a.data.store.selectedInfos.
                                                    a.data.store.businessCategories[0].translations.tr,    //Şirket sektörü
                                                    style: TextStyle(
                                                      fontSize: size*0.02,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    width: size * 0.2,
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                          flex: 3,
                                                          child: Padding(
                                                            padding: EdgeInsets.all(size * 0.01),
                                                            child: Container(
                                                              width: size * 0.2,
                                                              decoration: BoxDecoration(
                                                                color: Colors.yellow,
                                                                borderRadius: BorderRadius.circular(
                                                                    5),
                                                              ),
                                                              // width: size * 0.2,
                                                              height: size * 0.03,
                                                              //witdh: size*0.04,
                                                              child: Center(
                                                                child: Text(
                                                                  "${a.data.visitsCount} Ziyaretçi",
                                                                  //"123 Ziyaretçi",
                                                                  style: TextStyle(
                                                                    fontSize: size*0.015,
                                                                    fontWeight: FontWeight.w300,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 2,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.yellow,
                                                              borderRadius: BorderRadius.circular(
                                                                  5),
                                                            ),
                                                            // width: size * 0.2,
                                                            height: size * 0.03,
                                                            child:  Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  left: 6.0, right: 6.0),
                                                              child: Center(
                                                                child: Text(
                                                                  "${a.data.productCount} Ürün",               //ÜRÜNNN
                                                                  //"18 Ürün",
                                                                  style: TextStyle(
                                                                    fontSize: size*0.015,
                                                                    fontWeight: FontWeight.w300,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              /* Padding(
                            padding:  EdgeInsets.only(left: size*0.008),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: size*0.01, left: size*0.02),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(
                                              50),
                                        ),
                                        child: IconButton(
                                            onPressed: () {
                                              launch("tel://05078590490");
                                            },
                                            icon: Icon(Icons.call)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size*0.01, left: size*0.02),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          //TIKLANDIĞINDA
                                          launch(
                                              "mail://erogluduyguduygu@gmail.com");
                                        },
                                        icon: Icon(Icons.email)),
                                  ),
                                ),
                              ],
                            ),
                          ),  */ //arama mail
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: size * 0.34,
                                              height: size * 0.046,
                                              child: ElevatedButton(
                                                style: myButtonStyle(Colors.blue),
                                                child: const Icon(
                                                  Icons.thumb_up_alt_outlined,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),
                                                onPressed: () {
                                                  //TIKLANDIĞINDAAA
                                                },
                                              ),
                                            ), // Beğen Butonu
                                            Container(
                                              width: size * 0.18,
                                              height: size * 0.046,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black,width: size*0.001),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: ElevatedButton(
                                                style: myButtonStyle(Colors.white),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("${a.data.followerCount}",style: TextStyle(color: Colors.black,fontSize: size*0.024),),          //Artı Butonu Takipci sayısı
                                                    const Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  //TIKLANDIĞINDAAA
                                                },
                                              ),
                                            ), //Artı ikonu
                                          ],
                                        ), //butonlar

                                      ],
                                    ),
                                  ),
                                );
                              }),

                        ),
                        //createSilverAppBar2()
                      ];
                    },
                    body: MyTabBar(a: a),
                  );
                }
          }
      )
    );
  }
}

ButtonStyle myButtonStyle(Color back) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(back),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        //side: BorderSide(width: size * 0.0032,color: Colors.black54)
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

/* SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: size*0.36,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size * 0.18, //BACKGROUND IMAGE
                      child: Image.asset(
                        "assets/images/indir.png",
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size*0.01),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment:  CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: SizedBox(
                              width: size * 0.1,
                              height: size * 0.1,
                              child: Image.asset(
                                "assets/images/indir.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),   //CIRCLE AVATARRRRR
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: size*0.02),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: size*0.02),
                                      child: Text(
                                        "Bowin Mould ",
                                        style: TextStyle(
                                          fontSize: size*0.024, fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      //CHECK ICON
                                      padding: EdgeInsets.all(size*0.01),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Ticaret Şirketi, Fabrika",
                                style: TextStyle(
                                  fontSize: size*0.018,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: size * 0.2,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Padding(
                                        padding:  EdgeInsets.all(size*0.01),
                                        child: Container(
                                          width: size*0.2,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.circular(
                                                5),
                                          ),
                                          // width: size * 0.2,
                                          height: size*0.03,
                                          //witdh: size*0.04,
                                          child: Center(
                                            child: Text(
                                              "123 Ziyaretçi",
                                              style: TextStyle(
                                                fontSize: size*0.015,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(
                                              5),
                                        ),
                                       // width: size * 0.2,
                                        height: size*0.03,
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(
                                              left: 6.0, right: 6.0),
                                          child: Center(
                                            child: Text(
                                              "18 Ürün",
                                              style: TextStyle(
                                                fontSize: size*0.015,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                         /* Padding(
                            padding:  EdgeInsets.only(left: size*0.008),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: size*0.01, left: size*0.02),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(
                                              50),
                                        ),
                                        child: IconButton(
                                            onPressed: () {
                                              launch("tel://05078590490");
                                            },
                                            icon: Icon(Icons.call)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size*0.01, left: size*0.02),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          //TIKLANDIĞINDA
                                          launch(
                                              "mail://erogluduyguduygu@gmail.com");
                                        },
                                        icon: Icon(Icons.email)),
                                  ),
                                ),
                              ],
                            ),
                          ),  */ //arama mail
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size * 0.3,
                          height: size * 0.042,
                          child: ElevatedButton(
                            style: myButtonStyle(Colors.blue),
                            child: const Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              //TIKLANDIĞINDAAA
                            },
                          ),
                        ),   // Beğen Butonu
                        SizedBox(
                          width: size * 0.22,
                          height: size * 0.042,
                          child: ElevatedButton(
                            style: myButtonStyle(Colors.blue),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              //TIKLANDIĞINDAAA
                            },
                          ),
                        ), //Artı ikonu
                      ],
                    ), //butonlar

                  ],
                ),
              ),
            );
          }),
    );
  }*/
