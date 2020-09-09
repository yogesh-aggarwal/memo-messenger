import 'package:memomessenger/Services/Types/Fundamental.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<CurrentUser> currentUser = new BehaviorSubject.seeded(
  CurrentUser(
    id: "Gwi9iJzZ83lZPRvfI3YK",
    name: "Current User",
    profileImg: ImageWithHash(hash: "", url: ""),
  ),
);
