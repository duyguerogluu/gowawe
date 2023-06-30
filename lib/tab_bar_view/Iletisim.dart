import 'package:gowawe/model/iletisimModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gowawe/tab_bar_view/tab_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gowawe/model/iletisimModel.dart' as contactModel;
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';




Future<Object> apiCall() async {
  final response = await http.get('https://gowawe.com/api/member-store-main?type=contact&storeId=501');
  contactModel.ContactModel model = contactModelFromJson(response.body);
  if (response.statusCode == 200) {
    return model;
  } else {
    throw Exception('Bir hata oluştu');
  }
}


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class iletisim extends StatefulWidget {
  const iletisim({Key key}) : super(key: key);

  @override
  _iletisimState createState() => _iletisimState();
}

class _iletisimState extends State<iletisim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: FutureBuilder(
          future: apiCall(),
        builder: (context, snapshot) {
           contactModel.ContactModel a = snapshot.data;
           if (snapshot.connectionState != ConnectionState.done) {
        return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white70, Colors.white70]),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: size*0.02),
                  child: Text(
                    "İletişim Detayları",
                    style: TextStyle(fontSize: size*0.022, fontWeight: FontWeight.w600),
                  ),
                ), //İLETİŞİM DETAYLARIIIII

                Padding(
                  padding: EdgeInsets.only(right: size*0.02, left: size*0.02, top: size*0.01),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // bu dıştaki row
                    children: [
                      Container(
                        width: size*0.24,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              height: size*0.036,
                              width:size*0.036,
                              //color: Colors.yellow,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(251, 229, 128, 1),
                                border: Border.all(
                                  color: Colors.black,
                                  width: size*0.0024,
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
                                  fontSize: size*0.018,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                        child: Text(
                          a.store.address.phone,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size*0.018,
                              color: Color.fromRGBO(241, 203, 104, 1),
                          ),
                        ),
                      ), //Phone

                    ],
                  ),
                ), //Mobil

                Padding(
                  padding: EdgeInsets.only(right: size*0.02, left: size*0.02, top: size*0.01),
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // bu dıştaki row
                    children: [
                      Container(
                        width: size*0.24,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              height: size*0.036,
                              width:size*0.036,
                              //color: Colors.yellow,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(251, 229, 128, 1),
                                border: Border.all(
                                  color: Colors.black,
                                  width: size*0.0024,
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
                                "   Telefon  :   ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size*0.018,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                        child: Text(
                          a.store.address.phone,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size*0.018,
                              color: Color.fromRGBO(241, 203, 104, 1),
                          ),
                        ),
                      ),

                    ],
                  ),
                ), //Telefon

                Padding(
                  padding: EdgeInsets.only(right: size*0.02, left: size*0.02),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // bu dıştaki row
                    children: [
                      Container(
                        width: size*0.24,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              height: size*0.036,
                              width:size*0.036,
                              //color: Colors.yellow,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(251, 229, 128, 1),
                                border: Border.all(
                                  color: Colors.black,
                                  width: size*0.0024,
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
                                  fontSize: size*0.018,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(

                            icon: Icon(Icons.facebook,
                              color: Color.fromRGBO(241, 203, 104, 1),
                            ),
                            iconSize: size*0.028,
                            onPressed: () {
                              launch(a.store.socialFacebook);
                              setState(() {

                              });
                            },
                          ),

                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.youtube,
                              color: Color.fromRGBO(241, 203, 104, 1),
                            ),
                            iconSize: size*0.028,
                            onPressed: () {
                              launch(a.store.socialYoutube);
                              setState(() {

                              });
                            },
                          ),

                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram,
                                color: Color.fromRGBO(241, 203, 104, 1),
                            ),
                            iconSize: size*0.028,
                            onPressed: () {
                              launch(a.store.socialInstagram);
                              setState(() {

                              });

                            },
                          ),
                        ],
                      ),

                    ],
                  ),
                ), //Bizi Bulun

                Padding(
                  padding: EdgeInsets.only(right: size*0.02, left: size*0.02),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // bu dıştaki row
                    children: [
                      Container(
                        width: size*0.24,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              height: size*0.036,
                              width:size*0.036,
                              //color: Colors.yellow,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(251, 229, 128, 1),
                                border: Border.all(
                                  color: Colors.black,
                                  width: size*0.0024,
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
                                  fontSize: size*0.018,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                        child: Text(
                          a.store.website,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size*0.018,
                              color: Color.fromRGBO(241, 203, 104, 1),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),  //İnternet sitesi

                Padding(
                  padding: EdgeInsets.only(right: size*0.02, left: size*0.02, top: size*0.01),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // bu dıştaki row
                    children: [
                      Container(
                        width: size*0.24,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              height: size*0.036,
                              width:size*0.036,
                              //color: Colors.yellow,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(251, 229, 128, 1),
                                border: Border.all(
                                  color: Colors.black,
                                  width: size*0.0024,
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
                                "   eposta  :   ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size*0.018,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                        child: Text(
                          a.store.email,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size*0.018,
                              color: Color.fromRGBO(241, 203, 104, 1),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: size*0.02, left: size*0.02, top: size*0.01),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // bu dıştaki row
                    children: [
                      Container(
                        width: size*0.24,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              height: size*0.036,
                              width:size*0.036,
                              //color: Colors.yellow,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(251, 229, 128, 1),
                                border: Border.all(
                                  color: Colors.black,
                                  width: size*0.0024,
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
                                "   Adres  :   ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size*0.018,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                        child: Text(
                          a.store.member.address,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size*0.018,
                              color: Color.fromRGBO(241, 203, 104, 1)
                          ),
                        ),
                      ),

                    ],
                  ),
                ), //ADRESSSSSSSS

                Padding(

                  padding:  EdgeInsets.only(left: size*0.01, right: size*0.01, top: size*0.02),
                  child: Container(

                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.22),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                        color: Colors.grey[100],
                        border: Border.all(width: size*0.002, color: Color.fromRGBO(251, 229, 128, 0.3),

                        ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),

                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:EdgeInsets.only(top:size*0.01),
                          child: Text(
                            "Açıklama",
                            style: TextStyle(fontSize: size*0.02, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:size*0.018, right: size*0.01, bottom: size*0.02),
                          child: Text(
                            a.store.description,
                            style: TextStyle(
                              fontSize: size*0.018,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //Açıklama

                Padding(
                  padding: EdgeInsets.only(top: size*0.02),
                  child: Text(
                    "Bize Mesaj Gönderin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size*0.026,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ), //Bize mesaj gönderin

                Padding(
                  padding:  EdgeInsets.only(right: size*0.032, left: size*0.032),
                  child: Container(
                    height: size*0.6,
                    //width: 900,

                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: size*0.002,
                        color: Colors.grey[300],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),

                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: size*0.02, right: size*0.02, top: size*0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: size*0.05,
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),

                              child: Padding(
                                padding: EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Adınızı giriniz',
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                  ),
                                  validator: (String value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Lütfen Giriş Yapın';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ), // Ad Giriniz

                            Padding(
                              padding: EdgeInsets.only(top: size*0.018),
                              child: Container(
                                height: size*0.054,
                                //color: Colors.white,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),

                                child: Padding(
                                  padding: EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Telefon numarası giriniz',
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                    ),
                                    validator: (String value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Lütfen Giriş Yapın';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ), //Telefon Numarası Giriniz

                            Padding(
                              padding:  EdgeInsets.only(top: size*0.018),
                              child: Container(
                                height: size*0.054,
                                //color: Colors.white,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),

                                child: Padding(
                                  padding: EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'E-mail adresi giriniz',
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                    ),
                                    validator: (String value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Lütfen Giriş Yapın';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ), //E-mail Giriniz

                            Padding(
                              padding:  EdgeInsets.only(top: size*0.018),
                              child: Container(
                                height: size*0.054,
                                //color: Colors.white,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),

                                child: Padding(
                                  padding:EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Konu giriniz',
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      focusColor: Colors.black54,
                                    ),
                                    validator: (String value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Lütfen Giriş Yapın';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ), //Konu

                            Padding(
                              padding: EdgeInsets.only(top: size*0.018),
                              child: SingleChildScrollView(
                                child: Container(
                                  height: size*0.18,
                                  //color: Colors.white,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),

                                  child: Padding(
                                    padding: EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                    child: TextFormField(
                                      maxLines: 8,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Mesaj giriniz',
                                        focusedBorder: InputBorder.none,

                                        focusColor: Colors.red,
                                        //hoverColor: Colors.black54,
                                      ),
                                      validator: (String value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Lütfen Giriş Yapın';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ), //Mesajjj

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: size*0.01),
                              child: Center(
                                child: ElevatedButton(
                                  //color: Colors.grey,

                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      // Process data.
                                    }

                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(241, 203, 104, 1),
                                      fixedSize: const Size(160, 40)
                                  ),
                                  child: Center(child: Text('Kaydet',
                                    style: TextStyle(
                                        fontSize: size*0.02
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ), //Form

                Padding(
                  padding:  EdgeInsets.only(top: size*0.02, right: size*0.03, left: size*0.03),
                  child: Container(
                    height: size*0.38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xED090A3B),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        /*Padding(
                          padding: EdgeInsets.only(top: size*0.02, bottom: size*0.02),
                          child: Text(
                            "İletişim Bilgileri",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size*0.024,
                                ),
                          ),
                        ),*/

                        Padding(
                          padding:  EdgeInsets.only(top: size*0.02),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.yellow,
                                radius: 40.0,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    a.store.contactPhoto??
                                      "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"),
                                  radius: 36.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size*0.01 ),
                                child: Column(
                                  children: [
                                    Text(
                                      a.store.member.firstName+" "+a.store.member.lastName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size*0.024,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: size*0.01, bottom: size*0.01),
                                      child: Text(
                                        "Genel Müdür",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size*0.02),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ), //Circle Avatar





                        Padding(
                          padding: EdgeInsets.only(top: size*0.02),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: size*0.046,
                                width: size*0.046,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                child: IconButton(
                                    color: Colors.white,
                                    iconSize: size*0.02,
                                    onPressed: () {
                                      //Tıklandığında
                                    },
                                    icon: Icon(Icons.phone)),
                              ),
                              Text(
                                a.store.member.phone,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size*0.02),
                              ),
                            ],
                          ),
                        ), //TELEFON ICONU



                        Padding(
                          padding: EdgeInsets.only(top: size*0.02),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: size*0.046,
                                width: size*0.046,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: size*0.002,
                                  ),
                                ),
                                child: IconButton(
                                    color: Colors.white,
                                    iconSize: size*0.02,
                                    onPressed: () {
                                      //Tıklandığında
                                    },
                                    icon: FaIcon(FontAwesomeIcons.envelope)),
                              ),
                              Text(
                                a.store.email,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size*0.02),
                              ),
                            ],
                          ),
                        ), //ZARF ICONU



                        Padding(
                          padding: EdgeInsets.only(top:size*0.04),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: size*0.046,
                                width: size*0.046,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: size*0.002,
                                    ),
                                  ),
                                  child: IconButton(
                                      iconSize: size*0.02,
                                      color: Colors.white,
                                      onPressed: () {
                                        //Tıklandığında
                                      },
                                      icon: Icon(Icons.facebook)),
                                ),
                              ),
                              SizedBox(
                                height: size*0.046,
                                width: size*0.046,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: size*0.002,
                                    ),
                                  ),
                                  child: IconButton(
                                      iconSize: size*0.02,
                                      color: Colors.white,
                                      onPressed: () {
                                        //Tıklandığında
                                      },
                                      icon: Icon(Icons.facebook)),
                                ),
                              ),
                              SizedBox(
                                height: size*0.046,
                                width: size*0.046,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: size*0.002,
                                    ),
                                  ),
                                  child: IconButton(
                                      iconSize: size*0.02,
                                      color: Colors.white,
                                      onPressed: () {
                                        //Tıklandığında
                                      },
                                      icon: Icon(Icons.facebook)),
                                ),
                              ),
                            ],
                          ),
                        ), //SOSYAL MEDYA ICONLARI
                      ],
                    ),
                  ),
                ), //İletişim Bilgileri circle avatar

                /*  Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [

                          ],
                        )
                      ],
                    ),

                  ),
                ),*/
              ],
            ),
          ),
        ),
      );
          }
          else{
             return SingleChildScrollView(
               child: Container(
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                       colors: [Colors.white70, Colors.white70]),
                 ),
                 child: SingleChildScrollView(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Padding(
                         padding:  EdgeInsets.only(top: size*0.02),
                         child: Text(
                           "İletişim Detayları",
                           style: TextStyle(fontSize: size*0.022, fontWeight: FontWeight.w600),
                         ),
                       ), //İLETİŞİM DETAYLARIIIII

                       Padding(
                         padding: EdgeInsets.only(right: size*0.02, left: size*0.02, top: size*0.01),
                         child: Row(
                           //mainAxisAlignment: MainAxisAlignment.spaceAround,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           // bu dıştaki row
                           children: [
                             Container(
                               width: size*0.24,
                               color: Colors.transparent,
                               child: Row(
                                 children: [
                                   Container(
                                     height: size*0.036,
                                     width:size*0.036,
                                     //color: Colors.yellow,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(251, 229, 128, 1),
                                       border: Border.all(
                                         color: Colors.black,
                                         width: size*0.0024,
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
                                         fontSize: size*0.018,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                             Flexible(
                               child: Text(
                                 a.store.address.phone,
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: size*0.018,
                                   color: Color.fromRGBO(241, 203, 104, 1),
                                 ),
                               ),
                             ), //Phone

                           ],
                         ),
                       ), //Mobil

                       Padding(
                         padding: EdgeInsets.only(right: size*0.02, left: size*0.02, top: size*0.01),
                         child: Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           // bu dıştaki row
                           children: [
                             Container(
                               width: size*0.24,
                               color: Colors.transparent,
                               child: Row(
                                 children: [
                                   Container(
                                     height: size*0.036,
                                     width:size*0.036,
                                     //color: Colors.yellow,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(251, 229, 128, 1),
                                       border: Border.all(
                                         color: Colors.black,
                                         width: size*0.0024,
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
                                       "   Telefon  :   ",
                                       style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontSize: size*0.018,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                             Flexible(
                               child: Text(
                                 a.store.address.phone,
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: size*0.018,
                                   color: Color.fromRGBO(241, 203, 104, 1),
                                 ),
                               ),
                             ),

                           ],
                         ),
                       ), //Telefon

                       Padding(
                         padding: EdgeInsets.only(right: size*0.02, left: size*0.02),
                         child: Row(
                           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           // bu dıştaki row
                           children: [
                             Container(
                               width: size*0.24,
                               color: Colors.transparent,
                               child: Row(
                                 children: [
                                   Container(
                                     height: size*0.036,
                                     width:size*0.036,
                                     //color: Colors.yellow,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(251, 229, 128, 1),
                                       border: Border.all(
                                         color: Colors.black,
                                         width: size*0.0024,
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
                                         fontSize: size*0.018,
                                       ),
                                     ),
                                   ),

                                 ],
                               ),
                             ),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 IconButton(

                                   icon: Icon(Icons.facebook,
                                     color: Color.fromRGBO(241, 203, 104, 1),
                                   ),
                                   iconSize: size*0.028,
                                   onPressed: () {
                                     launch(a.store.socialFacebook);
                                     setState(() {

                                     });
                                   },
                                 ),

                                 IconButton(
                                   icon: FaIcon(FontAwesomeIcons.youtube,
                                     color: Color.fromRGBO(241, 203, 104, 1),
                                   ),
                                   iconSize: size*0.028,
                                   onPressed: () {
                                     launch(a.store.socialYoutube);
                                     setState(() {

                                     });
                                   },
                                 ),

                                 IconButton(
                                   icon: FaIcon(FontAwesomeIcons.instagram,
                                     color: Color.fromRGBO(241, 203, 104, 1),
                                   ),
                                   iconSize: size*0.028,
                                   onPressed: () {
                                     launch(a.store.socialInstagram);
                                     setState(() {

                                     });

                                   },
                                 ),
                               ],
                             ),

                           ],
                         ),
                       ), //Bizi Bulun

                       Padding(
                         padding: EdgeInsets.only(right: size*0.02, left: size*0.02),
                         child: Row(
                           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           // bu dıştaki row
                           children: [
                             Container(
                               width: size*0.24,
                               color: Colors.transparent,
                               child: Row(
                                 children: [
                                   Container(
                                     height: size*0.036,
                                     width:size*0.036,
                                     //color: Colors.yellow,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(251, 229, 128, 1),
                                       border: Border.all(
                                         color: Colors.black,
                                         width: size*0.0024,
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
                                         fontSize: size*0.018,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                             Flexible(
                               child: Text(
                                 a.store.website,
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: size*0.018,
                                   color: Color.fromRGBO(241, 203, 104, 1),
                                 ),
                               ),
                             ),

                           ],
                         ),
                       ),  //İnternet sitesi

                       Padding(
                         padding: EdgeInsets.only(right: size*0.02, left: size*0.02, top: size*0.01),
                         child: Row(
                           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           // bu dıştaki row
                           children: [
                             Container(
                               width: size*0.24,
                               color: Colors.transparent,
                               child: Row(
                                 children: [
                                   Container(
                                     height: size*0.036,
                                     width:size*0.036,
                                     //color: Colors.yellow,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(251, 229, 128, 1),
                                       border: Border.all(
                                         color: Colors.black,
                                         width: size*0.0024,
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
                                       "   eposta  :   ",
                                       style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontSize: size*0.018,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                             Flexible(
                               child: Text(
                                 a.store.email,
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: size*0.018,
                                   color: Color.fromRGBO(241, 203, 104, 1),
                                 ),
                               ),
                             ),

                           ],
                         ),
                       ),

                       Padding(
                         padding: EdgeInsets.only(right: size*0.02, left: size*0.02, top: size*0.01),
                         child: Row(
                           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           // bu dıştaki row
                           children: [
                             Container(
                               width: size*0.24,
                               color: Colors.transparent,
                               child: Row(
                                 children: [
                                   Container(
                                     height: size*0.036,
                                     width:size*0.036,
                                     //color: Colors.yellow,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(251, 229, 128, 1),
                                       border: Border.all(
                                         color: Colors.black,
                                         width: size*0.0024,
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
                                       "   Adres  :   ",
                                       style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontSize: size*0.018,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                             Flexible(
                               child: Text(
                                 a.store.member.address,
                                 style: TextStyle(
                                     fontWeight: FontWeight.w600,
                                     fontSize: size*0.018,
                                     color: Color.fromRGBO(241, 203, 104, 1)
                                 ),
                               ),
                             ),

                           ],
                         ),
                       ), //ADRESSSSSSSS

                       Padding(

                         padding:  EdgeInsets.only(left: size*0.01, right: size*0.01, top: size*0.02),
                         child: Container(

                           decoration: BoxDecoration(
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.yellow.withOpacity(0.22),
                                 spreadRadius: 5,
                                 blurRadius: 7,
                                 offset: Offset(0, 3),
                               ),
                             ],
                             color: Colors.grey[100],
                             border: Border.all(width: size*0.002, color: Color.fromRGBO(251, 229, 128, 0.3),

                             ),
                             borderRadius: BorderRadius.all(
                               Radius.circular(10),
                             ),

                           ),
                           child: Column(
                             children: [
                               Padding(
                                 padding:EdgeInsets.only(top:size*0.01),
                                 child: Text(
                                   "Açıklama",
                                   style: TextStyle(fontSize: size*0.02, fontWeight: FontWeight.w600),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsets.only(left:size*0.018, right: size*0.01, bottom: size*0.02),
                                 child: Text(
                                   a.store.description,
                                   style: TextStyle(
                                     fontSize: size*0.018,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ), //Açıklama

                       Padding(
                         padding: EdgeInsets.only(top: size*0.02),
                         child: Text(
                           "Bize Mesaj Gönderin",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: size*0.026,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ), //Bize mesaj gönderin

                       Padding(
                         padding:  EdgeInsets.only(right: size*0.032, left: size*0.032),
                         child: Container(
                           height: size*0.6,
                           //width: 900,

                           decoration: BoxDecoration(
                             color: Colors.grey[100],
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(
                               width: size*0.002,
                               color: Colors.grey[300],
                             ),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                 spreadRadius: 5,
                                 blurRadius: 7,
                                 offset: Offset(0, 3),
                               ),
                             ],
                           ),

                           child: Form(
                             key: _formKey,
                             child: Padding(
                               padding: EdgeInsets.only(
                                   left: size*0.02, right: size*0.02, top: size*0.02),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Container(
                                     alignment: Alignment.center,
                                     height: size*0.05,
                                     //color: Colors.white,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: Colors.white,
                                     ),

                                     child: Padding(
                                       padding: EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                       child: TextFormField(
                                         decoration: const InputDecoration(
                                           hintText: 'Adınızı giriniz',
                                           focusedBorder: InputBorder.none,
                                           border: InputBorder.none,
                                         ),
                                         validator: (String value) {
                                           if (value == null || value.isEmpty) {
                                             return 'Lütfen Giriş Yapın';
                                           }
                                           return null;
                                         },
                                       ),
                                     ),
                                   ), // Ad Giriniz

                                   Padding(
                                     padding: EdgeInsets.only(top: size*0.018),
                                     child: Container(
                                       height: size*0.054,
                                       //color: Colors.white,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: Colors.white,
                                       ),

                                       child: Padding(
                                         padding: EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                         child: TextFormField(
                                           decoration: const InputDecoration(
                                             hintText: 'Telefon numarası giriniz',
                                             focusedBorder: InputBorder.none,
                                             border: InputBorder.none,
                                           ),
                                           validator: (String value) {
                                             if (value == null || value.isEmpty) {
                                               return 'Lütfen Giriş Yapın';
                                             }
                                             return null;
                                           },
                                         ),
                                       ),
                                     ),
                                   ), //Telefon Numarası Giriniz

                                   Padding(
                                     padding:  EdgeInsets.only(top: size*0.018),
                                     child: Container(
                                       height: size*0.054,
                                       //color: Colors.white,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: Colors.white,
                                       ),

                                       child: Padding(
                                         padding: EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                         child: TextFormField(
                                           decoration: const InputDecoration(
                                             hintText: 'E-mail adresi giriniz',
                                             focusedBorder: InputBorder.none,
                                             border: InputBorder.none,
                                           ),
                                           validator: (String value) {
                                             if (value == null || value.isEmpty) {
                                               return 'Lütfen Giriş Yapın';
                                             }
                                             return null;
                                           },
                                         ),
                                       ),
                                     ),
                                   ), //E-mail Giriniz

                                   Padding(
                                     padding:  EdgeInsets.only(top: size*0.018),
                                     child: Container(
                                       height: size*0.054,
                                       //color: Colors.white,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: Colors.white,
                                       ),

                                       child: Padding(
                                         padding:EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                         child: TextFormField(
                                           decoration: const InputDecoration(
                                             hintText: 'Konu giriniz',
                                             focusedBorder: InputBorder.none,
                                             border: InputBorder.none,
                                             focusColor: Colors.black54,
                                           ),
                                           validator: (String value) {
                                             if (value == null || value.isEmpty) {
                                               return 'Lütfen Giriş Yapın';
                                             }
                                             return null;
                                           },
                                         ),
                                       ),
                                     ),
                                   ), //Konu

                                   Padding(
                                     padding: EdgeInsets.only(top: size*0.018),
                                     child: SingleChildScrollView(
                                       child: Container(
                                         height: size*0.18,
                                         //color: Colors.white,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           color: Colors.white,
                                         ),

                                         child: Padding(
                                           padding: EdgeInsets.only(top: size*0.008, bottom: size*0.006, left: size*0.01),
                                           child: TextFormField(
                                             maxLines: 8,
                                             decoration: InputDecoration(
                                               border: InputBorder.none,
                                               hintText: 'Mesaj giriniz',
                                               focusedBorder: InputBorder.none,

                                               focusColor: Colors.red,
                                               //hoverColor: Colors.black54,
                                             ),
                                             validator: (String value) {
                                               if (value == null || value.isEmpty) {
                                                 return 'Lütfen Giriş Yapın';
                                               }
                                               return null;
                                             },
                                           ),
                                         ),
                                       ),
                                     ),
                                   ), //Mesajjj

                                   Padding(
                                     padding: EdgeInsets.symmetric(vertical: size*0.01),
                                     child: Center(
                                       child: ElevatedButton(
                                         //color: Colors.grey,

                                         onPressed: () {
                                           if (_formKey.currentState.validate()) {
                                             // Process data.
                                           }

                                         },
                                         style: ElevatedButton.styleFrom(
                                             primary: Color.fromRGBO(241, 203, 104, 1),
                                             fixedSize: const Size(160, 40)
                                         ),
                                         child: Center(child: Text('Kaydet',
                                           style: TextStyle(
                                               fontSize: size*0.02
                                           ),
                                         )),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ), //Form

                       Padding(
                         padding:  EdgeInsets.only(top: size*0.02, right: size*0.03, left: size*0.03),
                         child: Container(
                           height: size*0.38,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Color(0xED090A3B),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.black.withOpacity(0.5),
                                 spreadRadius: 5,
                                 blurRadius: 7,
                                 offset: Offset(0, 3),
                               ),
                             ],
                           ),
                           child: Column(
                             children: [
                               /*Padding(
                          padding: EdgeInsets.only(top: size*0.02, bottom: size*0.02),
                          child: Text(
                            "İletişim Bilgileri",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size*0.024,
                                ),
                          ),
                        ),*/

                               Padding(
                                 padding:  EdgeInsets.only(top: size*0.02),
                                 child: Row(
                                   // mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     CircleAvatar(
                                       backgroundColor: Colors.yellow,
                                       radius: 40.0,
                                       child: CircleAvatar(
                                         backgroundImage: NetworkImage(
                                             a.store.contactPhoto??
                                                 "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"),
                                         radius: 36.0,
                                       ),
                                     ),
                                     Padding(
                                       padding: EdgeInsets.symmetric(horizontal: size*0.01 ),
                                       child: Column(
                                         children: [
                                           Text(
                                             a.store.member.firstName+" "+a.store.member.lastName,
                                             style: TextStyle(
                                               color: Colors.white,
                                               fontSize: size*0.024,
                                             ),
                                           ),
                                           Padding(
                                             padding: EdgeInsets.only(top: size*0.01, bottom: size*0.01),
                                             child: Text(
                                               "Genel Müdür",
                                               style: TextStyle(
                                                   color: Colors.white,
                                                   fontSize: size*0.02),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),

                                   ],
                                 ),
                               ), //Circle Avatar





                               Padding(
                                 padding: EdgeInsets.only(top: size*0.02),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Container(
                                       height: size*0.046,
                                       width: size*0.046,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(100),
                                         border: Border.all(
                                           color: Colors.white,
                                           width: 2.0,
                                         ),
                                       ),
                                       child: IconButton(
                                           color: Colors.white,
                                           iconSize: size*0.02,
                                           onPressed: () {
                                             //Tıklandığında
                                           },
                                           icon: Icon(Icons.phone)),
                                     ),
                                     Text(
                                       "+90 507 859 04 90",
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontSize: size*0.02),
                                     ),
                                   ],
                                 ),
                               ), //TELEFON ICONU



                               Padding(
                                 padding: EdgeInsets.only(top: size*0.02),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Container(
                                       height: size*0.046,
                                       width: size*0.046,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(100),
                                         border: Border.all(
                                           color: Colors.white,
                                           width: size*0.002,
                                         ),
                                       ),
                                       child: IconButton(
                                           color: Colors.white,
                                           iconSize: size*0.02,
                                           onPressed: () {
                                             //Tıklandığında
                                           },
                                           icon: FaIcon(FontAwesomeIcons.envelope)),
                                     ),
                                     Text(
                                       "+90 507 859 04 90",
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontSize: size*0.02),
                                     ),
                                   ],
                                 ),
                               ), //ZARF ICONU



                               Padding(
                                 padding: EdgeInsets.only(top:size*0.04),
                                 child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     SizedBox(
                                       height: size*0.046,
                                       width: size*0.046,
                                       child: Container(
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(100),
                                           border: Border.all(
                                             color: Colors.white,
                                             width: size*0.002,
                                           ),
                                         ),
                                         child: IconButton(
                                             iconSize: size*0.02,
                                             color: Colors.white,
                                             onPressed: () {
                                               //Tıklandığında
                                             },
                                             icon: Icon(Icons.facebook)),
                                       ),
                                     ),
                                     SizedBox(
                                       height: size*0.046,
                                       width: size*0.046,
                                       child: Container(
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(100),
                                           border: Border.all(
                                             color: Colors.white,
                                             width: size*0.002,
                                           ),
                                         ),
                                         child: IconButton(
                                             iconSize: size*0.02,
                                             color: Colors.white,
                                             onPressed: () {
                                               //Tıklandığında
                                             },
                                             icon: Icon(Icons.facebook)),
                                       ),
                                     ),
                                     SizedBox(
                                       height: size*0.046,
                                       width: size*0.046,
                                       child: Container(
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(100),
                                           border: Border.all(
                                             color: Colors.white,
                                             width: size*0.002,
                                           ),
                                         ),
                                         child: IconButton(
                                             iconSize: size*0.02,
                                             color: Colors.white,
                                             onPressed: () {
                                               //Tıklandığında
                                             },
                                             icon: Icon(Icons.facebook)),
                                       ),
                                     ),
                                   ],
                                 ),
                               ), //SOSYAL MEDYA ICONLARI
                             ],
                           ),
                         ),
                       ), //İletişim Bilgileri circle avatar

                       /*  Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [

                          ],
                        )
                      ],
                    ),

                  ),
                ),*/
                     ],
                   ),
                 ),
               ),
             );
        }}
        ),
    );
  }
}
