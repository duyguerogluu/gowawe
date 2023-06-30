import 'dart:math';

import 'package:gowawe/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gowawe/tab_bar_view/tab_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/storeModel.dart' as storeModel;

double size = 0;

class duygu extends StatefulWidget {
  storeModel.StoreModel anasayfaData;
  duygu({Key key, @required this.anasayfaData}) : super(key: key);

  @override
  _duyguState createState() => _duyguState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<String> items = [
  'duygu',
  'duygu',
  'duygu',
  'duygu',
  'duygu',
  'duygu',
  'duygu',
  'duygu',
];

class _duyguState extends State<duygu> with TickerProviderStateMixin {
  bool _isExpanded = false;
  DateTime _selectedDate = new DateTime.now();
  AnimationController _expandAnimationController;
  Animation<Size> _bottomSize;

  get index => null;

  @override
  Widget build(BuildContext context) {
    size = sqrt((MediaQuery.of(context).size.height *
            MediaQuery.of(context).size.height) +
        (MediaQuery.of(context).size.width *
            MediaQuery.of(context).size.width));

    return Scaffold(
      body: FutureBuilder(
          future: apiCall(),
          builder: (context, snapshot) {
            storeModel.StoreModel a = snapshot.data;
            if (snapshot.connectionState != ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    /* ExpansionTile(
              title: Text('Kategoriler',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54
                ),
              ),
             // subtitle: Text('Leading expansion arrow icon'),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[

                 SingleChildScrollView(
                   child: SizedBox(
                     height: size*0.2,
                     child: ListView.builder(itemCount: items.length,itemBuilder: (BuildContext context, int index) {
                      return Center(
                          child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('${items[index]}',
                             style: TextStyle(
                                    fontSize: 18,
                                     fontWeight: FontWeight.w600,
                                     color: Colors.black54
                        ),
                        ),
                      ));
                }),
                   ),
                 ),
              ],
            ), //KATEGORİLER BUTONU*/

                    Padding(
                      padding: EdgeInsets.only(top: size * 0.01),
                      child: Container(
                        height: size * 0.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          //border: Border.all()
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            autoPlay: true,
                          ),
                          items: imgList
                              .map((item) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size * 0.03),
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ), //SLİDERRRRR

                    Padding(
                      padding: EdgeInsets.all(size * 0.01),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(width: 6.0, color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: size * 0.01),
                              child: Text(
                                "Şirket Bilgileri",
                                style: TextStyle(
                                    fontSize: size * 0.024,
                                    fontWeight: FontWeight.w600
                                    // color: Colors.black38
                                    ),
                              ),
                            ), //ŞİRKET BİLGİERİ başlık

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Kayıtlı Şirket Adı",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ), //kayıtlı şirket adı
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Şirket Sektörü",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Kayıt Yılı",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ), //Kayıt Yılı
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Toplam Personel Sayısı",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ), //Toplam Personel Sayısı

                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        a.data.store.companyName,
                                        style: TextStyle(
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        a.data.store.businessCategories[0].translations.tr+","+a.data.store.businessCategories[1].translations.tr,
                                        style: TextStyle(
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        a.data.store.member.createdAt.toString(),   //kayıt tarihi sadece yıl çek
                                        style: TextStyle(
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        a.data.store.employeesCountId??
                                        "-",
                                        style: TextStyle(
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: size * 0.02),
                              child: Text(
                                "İlgili Kişi",
                                style: TextStyle(
                                    fontSize: size * 0.024,
                                    fontWeight: FontWeight.w600
                                    // color: Colors.black38
                                    ),
                              ),
                            ), //İLGİLİ KİŞİ

                            Padding(
                              padding: EdgeInsets.only(bottom: size * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size * 0.02),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.yellow,
                                      radius: 40.0,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            a.data.store.contactPhoto ??
                                            "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"),
                                        radius: 36.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size * 0.02),
                                    child: Column(
                                      children: [
                                        Text(
                                          a.data.store.member.firstName+" "+a.data.store.member.lastName,
                                          style: TextStyle(
                                              fontSize: size * 0.024,
                                              fontWeight: FontWeight.w400
                                              // color: Colors.black38
                                              ),
                                        ),
                                        Text(
                                          "Genel Müdür",
                                          style: TextStyle(
                                              fontSize: size * 0.020,
                                              fontWeight: FontWeight.w400
                                              // color: Colors.black38
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ), // CIRCLE AVATAR
                          ],
                        ),
                      ),
                    ), //ŞİRKET BİLGİLERİ

                    Padding(
                      padding: EdgeInsets.only(top: size * 0.01),
                      child: Text(
                        "İletişim Detayları",
                        style: TextStyle(
                            fontSize: size * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02,
                          left: size * 0.02,
                          top: size * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   Mobil  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+905078590490",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size * 0.018,
                                color: Color.fromRGBO(241, 203, 104, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02,
                          left: size * 0.02,
                          top: size * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   Mobil  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+905078590490",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size * 0.018,
                                color: Color.fromRGBO(241, 203, 104, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02, left: size * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   Bizi Bulun  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.facebook,
                                  color: Color.fromRGBO(241, 203, 104, 1),
                                ),
                                iconSize: size * 0.028,
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.youtube,
                                  color: Color.fromRGBO(241, 203, 104, 1),
                                ),
                                iconSize: size * 0.028,
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Color.fromRGBO(241, 203, 104, 1),
                                ),
                                iconSize: size * 0.028,
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), //Bizi Bulun

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02, left: size * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   İnternet Sitesi  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+905078590490",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size * 0.018,
                                color: Color.fromRGBO(241, 203, 104, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), //İnternet sitesi

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02,
                          left: size * 0.02,
                          top: size * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   E-Posta  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+905078590490",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size * 0.018,
                                color: Color.fromRGBO(241, 203, 104, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02,
                          left: size * 0.02,
                          top: size * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   E-Posta  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+9050785",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size * 0.018,
                                  color: Color.fromRGBO(241, 203, 104, 1)),
                            ),
                          ),
                        ],
                      ),
                    ), //ADRESSSSSSSS
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    /* ExpansionTile(
              title: Text('Kategoriler',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54
                ),
              ),
             // subtitle: Text('Leading expansion arrow icon'),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[

                 SingleChildScrollView(
                   child: SizedBox(
                     height: size*0.2,
                     child: ListView.builder(itemCount: items.length,itemBuilder: (BuildContext context, int index) {
                      return Center(
                          child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('${items[index]}',
                             style: TextStyle(
                                    fontSize: 18,
                                     fontWeight: FontWeight.w600,
                                     color: Colors.black54
                        ),
                        ),
                      ));
                }),
                   ),
                 ),
              ],
            ), //KATEGORİLER BUTONU*/

                    Padding(
                      padding: EdgeInsets.only(top: size * 0.01),
                      child: Container(
                        height: size * 0.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          //border: Border.all()
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            autoPlay: true,
                          ),
                          items: imgList
                              .map((item) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size * 0.03),
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ), //SLİDERRRRR

                    Padding(
                      padding: EdgeInsets.all(size * 0.01),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(width: 6.0, color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: size * 0.01),
                              child: Text(
                                "Şirket Bilgileri",
                                style: TextStyle(
                                    fontSize: size * 0.024,
                                    fontWeight: FontWeight.w600
                                    // color: Colors.black38
                                    ),
                              ),
                            ), //ŞİRKET BİLGİERİ başlık

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Kayıtlı Şirket Adı",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ), //kayıtlı şirket adı
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Şirket Sektörü",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Kayıt Yılı",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ), //Kayıt Yılı
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Toplam Personel Sayısı",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ), //Toplam Personel Sayısı
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Ana Ürünler",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Bowin Mould",
                                        style: TextStyle(
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "Bowin Mould",
                                        style: TextStyle(
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "2008",
                                        style: TextStyle(
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Text(
                                        "201-300",
                                        style: TextStyle(
                                          fontSize: size * 0.018,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size * 0.01),
                                      child: Flexible(
                                        child: Container(
                                          width: size * 0.2,
                                          child: Text(
                                            "tkrhjgowkjrmmmmmmmmmmv jrıgm m vjrgeoıp",
                                            style: TextStyle(
                                              fontSize: size * 0.018,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: size * 0.02),
                              child: Text(
                                "İlgili Kişi",
                                style: TextStyle(
                                    fontSize: size * 0.024,
                                    fontWeight: FontWeight.w600
                                    // color: Colors.black38
                                    ),
                              ),
                            ), //İLGİLİ KİŞİ

                            Padding(
                              padding: EdgeInsets.only(bottom: size * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size * 0.02),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.yellow,
                                      radius: 40.0,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"),
                                        radius: 36.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size * 0.02),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Sophia Wang",
                                          style: TextStyle(
                                              fontSize: size * 0.024,
                                              fontWeight: FontWeight.w400
                                              // color: Colors.black38
                                              ),
                                        ),
                                        Text(
                                          "Genel Müdür",
                                          style: TextStyle(
                                              fontSize: size * 0.020,
                                              fontWeight: FontWeight.w400
                                              // color: Colors.black38
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ), // CIRCLE AVATAR
                          ],
                        ),
                      ),
                    ), //ŞİRKET BİLGİLERİ

                    Padding(
                      padding: EdgeInsets.only(top: size * 0.01),
                      child: Text(
                        "İletişim Detayları",
                        style: TextStyle(
                            fontSize: size * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02,
                          left: size * 0.02,
                          top: size * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   Mobil  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+905078590490",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size * 0.018,
                                color: Color.fromRGBO(241, 203, 104, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02,
                          left: size * 0.02,
                          top: size * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   Mobil  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+905078590490",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size * 0.018,
                                color: Color.fromRGBO(241, 203, 104, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02, left: size * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   Bizi Bulun  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.facebook,
                                  color: Color.fromRGBO(241, 203, 104, 1),
                                ),
                                iconSize: size * 0.028,
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.youtube,
                                  color: Color.fromRGBO(241, 203, 104, 1),
                                ),
                                iconSize: size * 0.028,
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Color.fromRGBO(241, 203, 104, 1),
                                ),
                                iconSize: size * 0.028,
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), //Bizi Bulun

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02, left: size * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   İnternet Sitesi  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+905078590490",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size * 0.018,
                                color: Color.fromRGBO(241, 203, 104, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), //İnternet sitesi

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02,
                          left: size * 0.02,
                          top: size * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   E-Posta  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+905078590490",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size * 0.018,
                                color: Color.fromRGBO(241, 203, 104, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: size * 0.02,
                          left: size * 0.02,
                          top: size * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // bu dıştaki row
                        children: [
                          Row(
                            children: [
                              Container(
                                height: size * 0.036,
                                width: size * 0.036,
                                //color: Colors.yellow,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 229, 128, 1),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: size * 0.0024,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Icon(Icons.phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.02),
                                child: Text(
                                  "   E-Posta  :   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size * 0.018,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              "+9050785",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size * 0.018,
                                  color: Color.fromRGBO(241, 203, 104, 1)),
                            ),
                          ),
                        ],
                      ),
                    ), //ADRESSSSSSSS
                  ],
                ),
              );
            }
          }),
    );
  }
}
