import 'package:memomessenger/Services/Types/MemoMessenger.dart';
import 'package:rxdart/rxdart.dart';

final BehaviorSubject<SectionEnum> currentSection =
    new BehaviorSubject.seeded(SectionEnum.Favorites);
