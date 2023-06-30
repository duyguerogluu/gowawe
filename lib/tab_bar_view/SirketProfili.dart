import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gowawe/tab_bar_view/tab_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gowawe/tab_bar_view/kalitekontrol.dart';


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


class Sirketprofili extends StatefulWidget {

  const Sirketprofili({Key key}) : super(key: key);

  @override
  _SirketprofiliState createState() => _SirketprofiliState();
}

class _SirketprofiliState extends State<Sirketprofili> {

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white54,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:  CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                        ),
                        items: imgList
                            .map((item) => Container(
                            child: Image.network(
                                item)
                          // Image.network(
                          //   item.image,
                          //   fit: BoxFit.contain,
                          //   //height: 150,
                          // ),
                        ))
                            .toList(),
                      ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.flag,
                          color: Colors.black54,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            "Üke",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          "1 Yıl",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.flag,
                            color: Colors.black54,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Icon(
                            Icons.flag,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ), //Ülke şeyi icon fln
                ],
              ),

              Divider(
                //height: 100,
                thickness: 1,
                color: Colors.grey,
                indent: 2,
                endIndent: 2,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "98.98%",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Yanıt Oranı",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "10,000+",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "İşlemler",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "100.0%",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Zamanında Teslimat Oranı",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Divider(
                //height: 100,
                thickness: 1,
                color: Colors.grey,
                indent: 2,
                endIndent: 2,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Flexible(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Şirket üretiminde uzmanlaşmış tüketici elektronik ürünleri ile, yeterli',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_callback,
                        color: Colors.orangeAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Flexible(
                          child: Text(
                            "Bizi Hemen Arayın",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orangeAccent,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Divider(
                //height: 100,
                thickness: 1,
                color: Colors.grey,
                indent: 2,
                endIndent: 2,
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, right: 10, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black12,
                      width: 3.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: Text(
                          "Component Overview",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ), //Başlık
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Business Type",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Manufacturer, Trading Company",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Main Products",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Plastic ınjection Mold, Precise Stamping & Die, Two-shot Overmolding, OEM & ODM tooling",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Total Employess",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "101-200 People",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Year Established",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "2010",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ), //Year Established
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Product Certifications(2)",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "FCC,RoHS",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Trademarks",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Country/Region",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Ülke, İl",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ), //Country/Region
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Ownership",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Private Owner",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Total Annual Revenue",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "3160000",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Certifications",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ), //Certification
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  "Patent",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                flex: 6,
                                child: Text(
                                  " dkjgkfg",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), //Patent
                      Container(
                        height: size * 0.09,
                        width: size * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Main Market",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ), //tabloo companent overview

              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orangeAccent.withOpacity(0.2),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:10, left: 10, right: 10,bottom: 10),
                          child: Column(
                            children: [
                              Text("4.9/5",
                                style: TextStyle(
                                    fontSize: size*0.03,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text("40 Reviews",
                                style: TextStyle(
                                  fontSize: size*0.026,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:20, left: 20, right: 20, bottom: 20),
                          child: Column(
                            children: [
                              Text("Rating & Reviews",
                                style: TextStyle(
                                    fontSize: size*0.024,
                                    color: Colors.grey,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text("Hoşnut Eden",
                                style: TextStyle(
                                  fontSize: size*0.028,
                                  color: Colors.orangeAccent.withOpacity(0.9)
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                //height: size*0.36,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),

                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Text("ÜRÜN KAPASİTESİ",
                      style: TextStyle(
                        fontSize: size*0.03,
                        fontWeight: FontWeight.bold,
                        color:Colors.black54
                      ),
                      ),
                    ),
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
            ),
            items: imgList
                .map((item) => Container(
                child: Image.network(
                    item)
              // Image.network(
              //   item.image,
              //   fit: BoxFit.contain,
              //   //height: 150,
              // ),
            ))
                .toList(),
          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 6,bottom: 10),
                      child: Container(
                        height: size*0.18,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(width: 6.0, color: Colors.white70),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Text("Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
                          //maxLines: 6,
                            style: TextStyle(
                              fontSize: 16,
                              color:Colors.black54
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Ürün Kapasitesi


              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: SizedBox(
                  width: size * 0.2,
                  height: size * 0.05,
                  child: ElevatedButton(
                    style: myButtonStyle(Colors.yellow),
                    child: Text("Chat",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    onPressed: () {
                      //TIKLANDIĞINDAAA
                    },
                  ),
                ),
              ), //CHAT BUTTON

              Padding(
                padding: EdgeInsets.only(bottom: size*0.02),
                child: SizedBox(
                  width: size * 0.36,
                  height: size * 0.05,
                  child: ElevatedButton(
                    style: myButtonStyle(Colors.yellow),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.contact_phone,
                            color: Colors.white,
                          ),
                        ),
                        Text("Tedarikçi İle İletişime Geç",
                            style:
                            TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                    onPressed: () {
                      //TIKLANDIĞINDAAA
                    },
                  ),
                ),
              ), //TEDARİKÇİ İLE İLETİŞİME GEÇ







              SizedBox(
                height: size*0.12,
                child: Padding(
                  padding: EdgeInsets.only(top: size*0.01,bottom: size*0.01 ),
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[

                                  Color(0xFF0D47A1),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding:  EdgeInsets.all(size*0.008),
                              primary: Colors.white,
                              textStyle:  TextStyle(fontSize: size*0.03),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => kalitekontrol()));
                            },
                            child: SizedBox(
                              height: size*0.14,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   Text('Kalite Kontrol'),
                                   Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Colors.white,
                                    size: size*0.04,
                                   ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //Kalite Kontrol Butonu

              SizedBox(
                height: size*0.12,
                child: Padding(
                  padding: EdgeInsets.only(top: size*0.01,bottom: size*0.01 ),
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF0D47A1),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding:  EdgeInsets.all(size*0.008),
                              primary: Colors.white,
                              textStyle:  TextStyle(fontSize: size*0.03),
                            ),
                            onPressed: () {},
                            child: SizedBox(
                              height: size*0.14,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Ticari Özellikler'),
                                  Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Colors.white,
                                    size: size*0.04,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //Ticari Özellikler




              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Text("Bize Mesaj Gönderin",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 26
                    ),
                  ),
                ),
              ),   //Bize Mesaj Gönderin


              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  height: size*0.54,
                  //width: 900,

                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),





                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 50,
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SingleChildScrollView(
                              child: Container(
                                height: 200,
                                //color: Colors.white,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
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
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: ElevatedButton(
                                //color: Colors.grey,

                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    // Process data.
                                  }

                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                    fixedSize: const Size(160, 40)
                                ),
                                child: Center(child: Text('Gönder',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                                )),
                              ),
                            ),
                          ), //Elevated Button
                        ],
                      ),
                    ),
                  ),
                ),
              ),//Form







            ],
          ),
        ),
      ),
    );
  }
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

ButtonStyle myButtonStyle(Color back) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(back),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
