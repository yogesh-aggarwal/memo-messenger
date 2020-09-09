import 'package:flutter/foundation.dart';

class CurrentUser {
  final String uid;
  final String profileImg;

  CurrentUser({
    @required this.uid,
    @required this.profileImg,
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
