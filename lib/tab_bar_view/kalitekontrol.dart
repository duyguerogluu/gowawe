import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gowawe/tab_bar_view/tab_bar.dart';
import 'package:gowawe/tab_bar_view/SirketProfili.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';
import 'dart:ui';


class kalitekontrol extends StatefulWidget {
  const kalitekontrol({Key key}) : super(key: key);

  @override
  _kalitekontrolState createState() => _kalitekontrolState();
}



class _kalitekontrolState extends State<kalitekontrol> {
  @override
  Widget build(BuildContext context) {
    size = sqrt((MediaQuery
        .of(context)
        .size
        .height *
        MediaQuery
            .of(context)
            .size
            .height) +
        (MediaQuery
            .of(context)
            .size
            .width *
            MediaQuery
                .of(context)
                .size
                .width));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: size*0.3,
                decoration: const BoxDecoration(
                  //border: Border.all()
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                      ),
                      items: imgList
                          .map((item) => Container(
                          child: Column(
                            children: [
                              Flexible(
                                flex: 6,
                                child: Image.network(
                                    item),
                              ),
                              Flexible(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: size*0.074, right: size*0.074),
                                    child: Text("duyguduyguduyguduyguduygudugyuduygyuufyufyfalkpcsdklnsjdvkduyguduyguduyguduyguduygudugyuduygyuufyufyfalkpcsdklnsjdvk",
                                      style: TextStyle(

                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        // Image.network(
                        //   item.image,
                        //   fit: BoxFit.contain,
                        //   //height: 150,
                        // ),
                      ))
                          .toList(),
                    ),

                  ],
                ),

              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, right: 10, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Color(0xFF0D47A1),
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
                            color: Color(0xFF0D47A1),
                            //border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: Text(
                          "Kalite Kontrol",
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
              ),
            ), //Kalite Kontrol Tablosu


          ],
        ),
      ),
      
    );
  }
}
