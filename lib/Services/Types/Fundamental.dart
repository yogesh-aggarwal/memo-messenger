import 'package:flutter/foundation.dart';

class ImageWithHash {
  final String hash;
  final String url;

  ImageWithHash({
    @required this.hash,
    @required this.url,
  });
}

class CurrentUser {
  final String id;
  final String name;
  final ImageWithHash profileImg;

  CurrentUser({
    @required this.id,
    @required this.name,
    @required this.profileImg,
  });
}

class SenderUser {
  final String uid;
  final String name;
  final ImageWithHash profileImg;
  final PhoneNumber phone;

  SenderUser({
    @required this.uid,
    @required this.name,
    @required this.profileImg,
    @required this.phone,
  });
}

class PhoneNumber {
  final int countryCode;
  final int number;

  PhoneNumber({
    @required this.countryCode,
    @required this.number,
  });
}

class Label {
  final String id;
  final String name;

  Label({
    @required this.id,
    @required this.name,
  });
}
