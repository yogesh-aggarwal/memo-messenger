import 'package:rxdart/rxdart.dart';
import 'package:memomessenger/Services/Types/HomeActivity.dart';

BehaviorSubject<List<HomeChat>> homeActivityChatList = new BehaviorSubject.seeded([]);
