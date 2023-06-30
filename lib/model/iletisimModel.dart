// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);
import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  ContactModel({
    this.storeId,
    this.store,
    this.visitsCount,
    this.productCount,
    this.followerCount,
    this.followStatus,
  });

  String storeId;
  Store store;
  int visitsCount;
  int productCount;
  int followerCount;
  int followStatus;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    storeId: json["storeId"] == null ? null : json["storeId"],
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
    visitsCount: json["visitsCount"] == null ? null : json["visitsCount"],
    productCount: json["productCount"] == null ? null : json["productCount"],
    followerCount: json["followerCount"] == null ? null : json["followerCount"],
    followStatus: json["followStatus"] == null ? null : json["followStatus"],
  );

  Map<String, dynamic> toJson() => {
    "storeId": storeId == null ? null : storeId,
    "store": store == null ? null : store.toJson(),
    "visitsCount": visitsCount == null ? null : visitsCount,
    "productCount": productCount == null ? null : productCount,
    "followerCount": followerCount == null ? null : followerCount,
    "followStatus": followStatus == null ? null : followStatus,
  };
}

class Store {
  Store({
    this.memberId,
    this.terms,
    this.policy,
    this.paymentTerms,
    this.ownershipTypeId,
    this.shortDescription,
    this.description,
    this.descriptionEn,
    this.descriptionAr,
    this.addressId,
    this.metaDescription,
    this.metaKeywords,
    this.socialFacebook,
    this.socialTwitter,
    this.socialLinkedin,
    this.socialYoutube,
    this.mobile,
    this.email,
    this.website,
    this.acceptEscrow,
    this.yearOfEstablishment,
    this.employeesCountId,
    this.transactionLevelId,
    this.factorySizeId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.companyName,
    this.companyTypeId,
    this.latitude,
    this.longitude,
    this.photo,
    this.officeSizeId,
    this.registrationCountryId,
    this.registrationCityId,
    this.logo,
    this.averageLeadTime,
    this.domain,
    this.mainProducts1,
    this.mainProducts2,
    this.mainProducts3,
    this.mainProducts4,
    this.mainProducts5,
    this.otherProducts1,
    this.otherProducts2,
    this.otherProducts3,
    this.otherProducts4,
    this.otherProducts5,
    this.otherProducts6,
    this.otherProducts7,
    this.otherProducts8,
    this.otherProducts9,
    this.otherProducts10,
    this.homepageSettings,
    this.coverPhoto,
    this.isBusinessCategoryApproved,
    this.isStoreVerified,
    this.contactPhoto,
    this.socialInstagram,
    this.contactPositionId,
    this.gaCode,
    this.customHtml,
    this.categoryId,
    this.selectedCategories,
    this.selectedInfos,
    this.isSelected,
    this.selectedOrder,
    this.like,
    this.originalPhotos,
    this.coverOriginal,
    this.logoOriginal,
    this.contactOriginal,
    this.storeFiles,
    this.isTaskwawe,
    this.translations,
    this.member,
    this.businessCategories,
    this.address,
  });

  int memberId;
  dynamic terms;
  dynamic policy;
  dynamic paymentTerms;
  dynamic ownershipTypeId;
  dynamic shortDescription;
  String description;
  dynamic descriptionEn;
  dynamic descriptionAr;
  int addressId;
  dynamic metaDescription;
  dynamic metaKeywords;
  String socialFacebook;
  dynamic socialTwitter;
  dynamic socialLinkedin;
  String socialYoutube;
  String mobile;
  String email;
  String website;
  dynamic acceptEscrow;
  dynamic yearOfEstablishment;
  dynamic employeesCountId;
  dynamic transactionLevelId;
  dynamic factorySizeId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String companyName;
  dynamic companyTypeId;
  dynamic latitude;
  dynamic longitude;
  dynamic photo;
  dynamic officeSizeId;
  dynamic registrationCountryId;
  dynamic registrationCityId;
  String logo;
  dynamic averageLeadTime;
  String domain;
  dynamic mainProducts1;
  dynamic mainProducts2;
  dynamic mainProducts3;
  dynamic mainProducts4;
  dynamic mainProducts5;
  dynamic otherProducts1;
  dynamic otherProducts2;
  dynamic otherProducts3;
  dynamic otherProducts4;
  dynamic otherProducts5;
  dynamic otherProducts6;
  dynamic otherProducts7;
  dynamic otherProducts8;
  dynamic otherProducts9;
  dynamic otherProducts10;
  List<HomepageSetting> homepageSettings;
  String coverPhoto;
  int isBusinessCategoryApproved;
  int isStoreVerified;
  String contactPhoto;
  String socialInstagram;
  int contactPositionId;
  String gaCode;
  dynamic customHtml;
  int categoryId;
  dynamic selectedCategories;
  String selectedInfos;
  int isSelected;
  int selectedOrder;
  dynamic like;
  dynamic originalPhotos;
  dynamic coverOriginal;
  dynamic logoOriginal;
  dynamic contactOriginal;
  dynamic storeFiles;
  int isTaskwawe;
  Translations translations;
  Member member;
  List<BusinessCategory> businessCategories;
  Address address;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    memberId: json["member_id"] == null ? null : json["member_id"],
    terms: json["terms"],
    policy: json["policy"],
    paymentTerms: json["payment_terms"],
    ownershipTypeId: json["ownership_type_id"],
    shortDescription: json["short_description"],
    description: json["description"] == null ? null : json["description"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
    addressId: json["address_id"] == null ? null : json["address_id"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    socialFacebook: json["social_facebook"] == null ? null : json["social_facebook"],
    socialTwitter: json["social_twitter"],
    socialLinkedin: json["social_linkedin"],
    socialYoutube: json["social_youtube"] == null ? null : json["social_youtube"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    email: json["email"] == null ? null : json["email"],
    website: json["website"] == null ? null : json["website"],
    acceptEscrow: json["accept_escrow"],
    yearOfEstablishment: json["year_of_establishment"],
    employeesCountId: json["employees_count_id"],
    transactionLevelId: json["transaction_level_id"],
    factorySizeId: json["factory_size_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    companyTypeId: json["company_type_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    photo: json["photo"],
    officeSizeId: json["office_size_id"],
    registrationCountryId: json["registration_country_id"],
    registrationCityId: json["registration_city_id"],
    logo: json["logo"] == null ? null : json["logo"],
    averageLeadTime: json["average_lead_time"],
    domain: json["domain"] == null ? null : json["domain"],
    mainProducts1: json["main_products1"],
    mainProducts2: json["main_products2"],
    mainProducts3: json["main_products3"],
    mainProducts4: json["main_products4"],
    mainProducts5: json["main_products5"],
    otherProducts1: json["other_products1"],
    otherProducts2: json["other_products2"],
    otherProducts3: json["other_products3"],
    otherProducts4: json["other_products4"],
    otherProducts5: json["other_products5"],
    otherProducts6: json["other_products6"],
    otherProducts7: json["other_products7"],
    otherProducts8: json["other_products8"],
    otherProducts9: json["other_products9"],
    otherProducts10: json["other_products10"],
    homepageSettings: json["homepage_settings"] == null ? null : List<HomepageSetting>.from(json["homepage_settings"].map((x) => HomepageSetting.fromJson(x))),
    coverPhoto: json["cover_photo"] == null ? null : json["cover_photo"],
    isBusinessCategoryApproved: json["is_business_category_approved"] == null ? null : json["is_business_category_approved"],
    isStoreVerified: json["is_store_verified"] == null ? null : json["is_store_verified"],
    contactPhoto: json["contact_photo"] == null ? null : json["contact_photo"],
    socialInstagram: json["social_instagram"] == null ? null : json["social_instagram"],
    contactPositionId: json["contact_position_id"] == null ? null : json["contact_position_id"],
    gaCode: json["ga_code"] == null ? null : json["ga_code"],
    customHtml: json["custom_html"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    selectedCategories: json["selected_categories"],
    selectedInfos: json["selected_infos"] == null ? null : json["selected_infos"],
    isSelected: json["is_selected"] == null ? null : json["is_selected"],
    selectedOrder: json["selected_order"] == null ? null : json["selected_order"],
    like: json["like"],
    originalPhotos: json["original_photos"],
    coverOriginal: json["cover_original"],
    logoOriginal: json["logo_original"],
    contactOriginal: json["contact_original"],
    storeFiles: json["store_files"],
    isTaskwawe: json["is_taskwawe"] == null ? null : json["is_taskwawe"],
    translations: json["translations"] == null ? null : Translations.fromJson(json["translations"]),
    member: json["member"] == null ? null : Member.fromJson(json["member"]),
    businessCategories: json["business_categories"] == null ? null : List<BusinessCategory>.from(json["business_categories"].map((x) => BusinessCategory.fromJson(x))),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "member_id": memberId == null ? null : memberId,
    "terms": terms,
    "policy": policy,
    "payment_terms": paymentTerms,
    "ownership_type_id": ownershipTypeId,
    "short_description": shortDescription,
    "description": description == null ? null : description,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "address_id": addressId == null ? null : addressId,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "social_facebook": socialFacebook == null ? null : socialFacebook,
    "social_twitter": socialTwitter,
    "social_linkedin": socialLinkedin,
    "social_youtube": socialYoutube == null ? null : socialYoutube,
    "mobile": mobile == null ? null : mobile,
    "email": email == null ? null : email,
    "website": website == null ? null : website,
    "accept_escrow": acceptEscrow,
    "year_of_establishment": yearOfEstablishment,
    "employees_count_id": employeesCountId,
    "transaction_level_id": transactionLevelId,
    "factory_size_id": factorySizeId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "company_name": companyName == null ? null : companyName,
    "company_type_id": companyTypeId,
    "latitude": latitude,
    "longitude": longitude,
    "photo": photo,
    "office_size_id": officeSizeId,
    "registration_country_id": registrationCountryId,
    "registration_city_id": registrationCityId,
    "logo": logo == null ? null : logo,
    "average_lead_time": averageLeadTime,
    "domain": domain == null ? null : domain,
    "main_products1": mainProducts1,
    "main_products2": mainProducts2,
    "main_products3": mainProducts3,
    "main_products4": mainProducts4,
    "main_products5": mainProducts5,
    "other_products1": otherProducts1,
    "other_products2": otherProducts2,
    "other_products3": otherProducts3,
    "other_products4": otherProducts4,
    "other_products5": otherProducts5,
    "other_products6": otherProducts6,
    "other_products7": otherProducts7,
    "other_products8": otherProducts8,
    "other_products9": otherProducts9,
    "other_products10": otherProducts10,
    "homepage_settings": homepageSettings == null ? null : List<dynamic>.from(homepageSettings.map((x) => x.toJson())),
    "cover_photo": coverPhoto == null ? null : coverPhoto,
    "is_business_category_approved": isBusinessCategoryApproved == null ? null : isBusinessCategoryApproved,
    "is_store_verified": isStoreVerified == null ? null : isStoreVerified,
    "contact_photo": contactPhoto == null ? null : contactPhoto,
    "social_instagram": socialInstagram == null ? null : socialInstagram,
    "contact_position_id": contactPositionId == null ? null : contactPositionId,
    "ga_code": gaCode == null ? null : gaCode,
    "custom_html": customHtml,
    "category_id": categoryId == null ? null : categoryId,
    "selected_categories": selectedCategories,
    "selected_infos": selectedInfos == null ? null : selectedInfos,
    "is_selected": isSelected == null ? null : isSelected,
    "selected_order": selectedOrder == null ? null : selectedOrder,
    "like": like,
    "original_photos": originalPhotos,
    "cover_original": coverOriginal,
    "logo_original": logoOriginal,
    "contact_original": contactOriginal,
    "store_files": storeFiles,
    "is_taskwawe": isTaskwawe == null ? null : isTaskwawe,
    "translations": translations == null ? null : translations.toJson(),
    "member": member == null ? null : member.toJson(),
    "business_categories": businessCategories == null ? null : List<dynamic>.from(businessCategories.map((x) => x.toJson())),
    "address": address == null ? null : address.toJson(),
  };
}

class Address {
  Address({
    this.id,
    this.memberId,
    this.type,
    this.firstName,
    this.companyName,
    this.address1,
    this.address2,
    this.postcode,
    this.state,
    this.countryId,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.cityId,
    this.countryName,
    this.cityName,
  });

  int id;
  int memberId;
  String type;
  String firstName;
  dynamic companyName;
  String address1;
  String address2;
  dynamic postcode;
  dynamic state;
  int countryId;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  int cityId;
  String countryName;
  String cityName;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"] == null ? null : json["id"],
    memberId: json["member_id"] == null ? null : json["member_id"],
    type: json["type"] == null ? null : json["type"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    companyName: json["company_name"],
    address1: json["address1"] == null ? null : json["address1"],
    address2: json["address2"] == null ? null : json["address2"],
    postcode: json["postcode"],
    state: json["state"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    phone: json["phone"] == null ? null : json["phone"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    cityId: json["city_id"] == null ? null : json["city_id"],
    countryName: json["country_name"] == null ? null : json["country_name"],
    cityName: json["city_name"] == null ? null : json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "member_id": memberId == null ? null : memberId,
    "type": type == null ? null : type,
    "first_name": firstName == null ? null : firstName,
    "company_name": companyName,
    "address1": address1 == null ? null : address1,
    "address2": address2 == null ? null : address2,
    "postcode": postcode,
    "state": state,
    "country_id": countryId == null ? null : countryId,
    "phone": phone == null ? null : phone,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "city_id": cityId == null ? null : cityId,
    "country_name": countryName == null ? null : countryName,
    "city_name": cityName == null ? null : cityName,
  };
}

class BusinessCategory {
  BusinessCategory({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.lookupTypeId,
    this.sort,
    this.translations,
    this.pivot,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int lookupTypeId;
  int sort;
  Translations translations;
  Pivot pivot;

  factory BusinessCategory.fromJson(Map<String, dynamic> json) => BusinessCategory(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    lookupTypeId: json["lookup_type_id"] == null ? null : json["lookup_type_id"],
    sort: json["sort"] == null ? null : json["sort"],
    translations: json["translations"] == null ? null : Translations.fromJson(json["translations"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "lookup_type_id": lookupTypeId == null ? null : lookupTypeId,
    "sort": sort == null ? null : sort,
    "translations": translations == null ? null : translations.toJson(),
    "pivot": pivot == null ? null : pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.storeinfoId,
    this.lookupId,
  });

  int storeinfoId;
  int lookupId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    storeinfoId: json["storeinfo_id"] == null ? null : json["storeinfo_id"],
    lookupId: json["lookup_id"] == null ? null : json["lookup_id"],
  );

  Map<String, dynamic> toJson() => {
    "storeinfo_id": storeinfoId == null ? null : storeinfoId,
    "lookup_id": lookupId == null ? null : lookupId,
  };
}

class Translations {
  Translations({
    this.ar,
    this.az,
    this.bn,
    this.de,
    this.en,
    this.es,
    this.fr,
    this.he,
    this.ru,
    this.tr,
  });

  String ar;
  String az;
  String bn;
  String de;
  String en;
  String es;
  String fr;
  String he;
  String ru;
  String tr;

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
    ar: json["ar"] == null ? null : json["ar"],
    az: json["az"] == null ? null : json["az"],
    bn: json["bn"] == null ? null : json["bn"],
    de: json["de"] == null ? null : json["de"],
    en: json["en"] == null ? null : json["en"],
    es: json["es"] == null ? null : json["es"],
    fr: json["fr"] == null ? null : json["fr"],
    he: json["he"] == null ? null : json["he"],
    ru: json["ru"] == null ? null : json["ru"],
    tr: json["tr"] == null ? null : json["tr"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar == null ? null : ar,
    "az": az == null ? null : az,
    "bn": bn == null ? null : bn,
    "de": de == null ? null : de,
    "en": en == null ? null : en,
    "es": es == null ? null : es,
    "fr": fr == null ? null : fr,
    "he": he == null ? null : he,
    "ru": ru == null ? null : ru,
    "tr": tr == null ? null : tr,
  };
}

class HomepageSetting {
  HomepageSetting({
    this.type,
    this.enabled,
    this.categoryId,
  });

  String type;
  bool enabled;
  int categoryId;

  factory HomepageSetting.fromJson(Map<String, dynamic> json) => HomepageSetting(
    type: json["type"] == null ? null : json["type"],
    enabled: json["enabled"] == null ? null : json["enabled"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "enabled": enabled == null ? null : enabled,
    "category_id": categoryId == null ? null : categoryId,
  };
}

class Member {
  Member({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.address,
    this.countryCode,
    this.phone,
    this.countryId,
    this.cityId,
    this.isBuyer,
    this.isSeller,
    this.isApproved,
    this.profileVisits,
    this.createdAt,
    this.updatedAt,
    this.typeOfDiscovery,
    this.howFindGowawe,
    this.name,
  });

  int id;
  int userId;
  String firstName;
  String lastName;
  String address;
  String countryCode;
  String phone;
  int countryId;
  int cityId;
  bool isBuyer;
  bool isSeller;
  int isApproved;
  int profileVisits;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic typeOfDiscovery;
  dynamic howFindGowawe;
  String name;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    address: json["address"] == null ? null : json["address"],
    countryCode: json["country_code"] == null ? null : json["country_code"],
    phone: json["phone"] == null ? null : json["phone"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    isBuyer: json["is_buyer"] == null ? null : json["is_buyer"],
    isSeller: json["is_seller"] == null ? null : json["is_seller"],
    isApproved: json["is_approved"] == null ? null : json["is_approved"],
    profileVisits: json["profile_visits"] == null ? null : json["profile_visits"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    typeOfDiscovery: json["type_of_discovery"],
    howFindGowawe: json["how_find_gowawe"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "address": address == null ? null : address,
    "country_code": countryCode == null ? null : countryCode,
    "phone": phone == null ? null : phone,
    "country_id": countryId == null ? null : countryId,
    "city_id": cityId == null ? null : cityId,
    "is_buyer": isBuyer == null ? null : isBuyer,
    "is_seller": isSeller == null ? null : isSeller,
    "is_approved": isApproved == null ? null : isApproved,
    "profile_visits": profileVisits == null ? null : profileVisits,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "type_of_discovery": typeOfDiscovery,
    "how_find_gowawe": howFindGowawe,
    "name": name == null ? null : name,
  };
}
