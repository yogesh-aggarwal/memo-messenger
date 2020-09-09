import 'package:flutter/foundation.dart';
import 'package:memomessenger/Services/Types/Fundamental.dart';

class ImageMessage {
  final String hash;
  final String url;

  ImageMessage({
    @required this.hash,
    @required this.url,
  });
}

class DocumentMessage {
  final String url;
  final String name;

  DocumentMessage({
    @required this.url,
    @required this.name,
  });
}

class ContactMessage {
  final String name;
  final PhoneNumber number;
  final String image;

  ContactMessage({@required this.name, @required this.number, this.image});
}

class Message {
  final String text;
  final ImageMessage image;
  final String audio;
  final String video;
  final String apk;
  final DocumentMessage doc;
  final ContactMessage contact;
  final String location;
  final String poll;
  final bool isHighlighted;
  final bool isDelivered;
  final bool isImportant;
  final bool isNotified;
  final bool isRead;
  final bool isTrash;
  final bool isDeleted;
  final bool isTemplate;
  final DateTime autoDelete;
  final DateTime sentAt;
  final DateTime scheduledAt;
  final String senderId;
  final List<Label> labels;

  Message({
    this.text,
    this.image,
    this.audio,
    this.video,
    this.apk,
    this.doc,
    this.contact,
    this.location,
    this.poll,
    this.isHighlighted,
    this.isDelivered,
    this.isImportant,
    this.isNotified,
    this.isRead,
    this.isTrash,
    this.isDeleted,
    this.isTemplate,
    this.autoDelete,
    this.sentAt,
    this.scheduledAt,
    this.senderId,
    this.labels,
  });
}