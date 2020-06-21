import 'package:kfdrawer/screens/cash_in_page.dart';
import 'package:kfdrawer/screens/home_page.dart';
import 'package:kfdrawer/screens/invite_friends_page.dart';
import 'package:kfdrawer/screens/site_page.dart';
import 'package:kfdrawer/screens/tax_page.dart';

import '../screens/help_page.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<HomePage>(() => HomePage());
    register<TaxPage>(() => TaxPage());
    register<CashInPage>(() => CashInPage());
    register<InviteFriendsPage>(() => InviteFriendsPage());
    register<SitePage>(() => SitePage());
    register<HelpPage>(() => HelpPage());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}