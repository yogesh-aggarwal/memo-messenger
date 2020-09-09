import 'package:memomessenger/Services/Types/HomeActivity.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<List<Chat>> chatActivityChatList =
    new BehaviorSubject.seeded([]);
