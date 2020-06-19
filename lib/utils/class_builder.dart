import 'package:kfdrawer/screens/home_page.dart';
import 'package:kfdrawer/screens/taxas.dart';

import '../screens/calendar_page.dart';
import '../screens/settings_page.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<TaxasPage>(() => TaxasPage());
    register<HomePage>(() => HomePage());
    register<CalendarPage>(() => CalendarPage());
    register<SettingsPage>(() => SettingsPage());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}