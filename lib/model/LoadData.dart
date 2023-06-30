// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
    from: json["from"] == null ? null : json["from"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
    nextPageUrl: json["next_page_url"] == null ? null : json["next_page_url"],
    path: json["path"] == null ? null : json["path"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage == null ? null : currentPage,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl == null ? null : firstPageUrl,
    "from": from == null ? null : from,
    "last_page": lastPage == null ? null : lastPage,
    "last_page_url": lastPageUrl == null ? null : lastPageUrl,
    "next_page_url": nextPageUrl == null ? null : nextPageUrl,
    "path": path == null ? null : path,
    "per_page": perPage == null ? null : perPage,
    "prev_page_url": prevPageUrl,
    "to": to == null ? null : to,
    "total": total == null ? null : total,
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.categoryId,
    this.category,
    this.photo,
    this.unit,
    this.store,
    this.attributes,
    this.priceLower,
    this.priceUpper,
    this.currency,
    this.currencyId,
    this.minOrder,
    this.photos,
    this.prices,
  });

  int id;
  String title;
  int categoryId;
  String category;
  String photo;
  DatumUnit unit;
  Store store;
  Attributes attributes;
  String priceLower;
  String priceUpper;
  Currency currency;
  int currencyId;
  int minOrder;
  List<Photo> photos;
  List<Price> prices;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    category: json["category"] == null ? null : json["category"],
    photo: json["photo"] == null ? null : json["photo"],
    unit: json["unit"] == null ? null : datumUnitValues.map[json["unit"]],
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
    priceLower: json["price_lower"] == null ? null : json["price_lower"],
    priceUpper: json["price_upper"] == null ? null : json["price_upper"],
    currency: json["currency"] == null ? null : currencyValues.map[json["currency"]],
    currencyId: json["currency_id"] == null ? null : json["currency_id"],
    minOrder: json["min_order"] == null ? null : json["min_order"],
    photos: json["photos"] == null ? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    prices: json["prices"] == null ? null : List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "category_id": categoryId == null ? null : categoryId,
    "category": category == null ? null : category,
    "photo": photo == null ? null : photo,
    "unit": unit == null ? null : datumUnitValues.reverse[unit],
    "store": store == null ? null : store.toJson(),
    "attributes": attributes == null ? null : attributes.toJson(),
    "price_lower": priceLower == null ? null : priceLower,
    "price_upper": priceUpper == null ? null : priceUpper,
    "currency": currency == null ? null : currencyValues.reverse[currency],
    "currency_id": currencyId == null ? null : currencyId,
    "min_order": minOrder == null ? null : minOrder,
    "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x.toJson())),
    "prices": prices == null ? null : List<dynamic>.from(prices.map((x) => x.toJson())),
  };
}

class Attributes {
  Attributes();

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
  );

  Map<String, dynamic> toJson() => {
  };
}

enum Currency { USD }

final currencyValues = EnumValues({
  "USD": Currency.USD
});

class Photo {
  Photo({
    this.photo,
  });

  String photo;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    photo: json["photo"] == null ? null : json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "photo": photo == null ? null : photo,
  };
}

class Price {
  Price({
    this.min,
    this.max,
    this.price,
  });

  int min;
  int max;
  String price;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    min: json["min"] == null ? null : json["min"],
    max: json["max"] == null ? null : json["max"],
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "min": min == null ? null : min,
    "max": max == null ? null : max,
    "price": price == null ? null : price,
  };
}

class Store {
  Store({
    this.memberId,
    this.companyName,
    this.country,
    this.logo,
    this.since,
    this.types,
  });

  int memberId;
  String companyName;
  Country country;
  String logo;
  Since since;
  List<Country> types;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    memberId: json["member_id"] == null ? null : json["member_id"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    logo: json["logo"] == null ? null : json["logo"],
    since: json["since"] == null ? null : Since.fromJson(json["since"]),
    types: json["types"] == null ? null : List<Country>.from(json["types"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "member_id": memberId == null ? null : memberId,
    "company_name": companyName == null ? null : companyName,
    "country": country == null ? null : country.toJson(),
    "logo": logo == null ? null : logo,
    "since": since == null ? null : since.toJson(),
    "types": types == null ? null : List<dynamic>.from(types.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    this.id,
    this.name,
    this.countryCode,
    this.icon,
  });

  int id;
  Name name;
  CountryCode countryCode;
  String icon;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : nameValues.map[json["name"]],
    countryCode: json["country_code"] == null ? null : countryCodeValues.map[json["country_code"]],
    icon: json["icon"] == null ? null : json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : nameValues.reverse[name],
    "country_code": countryCode == null ? null : countryCodeValues.reverse[countryCode],
    "icon": icon == null ? null : icon,
  };
}

enum CountryCode { TR }

final countryCodeValues = EnumValues({
  "TR": CountryCode.TR
});

enum Name { TURKEY, PREMIUM_VERIFIED_SUPPLIER, VERIFIED_SUPPLIER }

final nameValues = EnumValues({
  "Premium Verified Supplier": Name.PREMIUM_VERIFIED_SUPPLIER,
  "Turkey": Name.TURKEY,
  "Verified Supplier": Name.VERIFIED_SUPPLIER
});

class Since {
  Since({
    this.since,
    this.unit,
  });

  int since;
  SinceUnit unit;

  factory Since.fromJson(Map<String, dynamic> json) => Since(
    since: json["since"] == null ? null : json["since"],
    unit: json["unit"] == null ? null : sinceUnitValues.map[json["unit"]],
  );

  Map<String, dynamic> toJson() => {
    "since": since == null ? null : since,
    "unit": unit == null ? null : sinceUnitValues.reverse[unit],
  };
}

enum SinceUnit { YRS }

final sinceUnitValues = EnumValues({
  "YRS": SinceUnit.YRS
});

enum DatumUnit { UNIT_UNITS }

final datumUnitValues = EnumValues({
  "Unit/Units": DatumUnit.UNIT_UNITS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
