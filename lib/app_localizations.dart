import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {

  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((Object _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }



  // Application
  String get title {
    return Intl.message(
      'InnovateNow Tracker',
      name: 'title',
      desc: 'Title for the Tracker application',
    );
  }

  // Home
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Home label',
    );
  }

  // QR code
  String get qrCode {
    return Intl.message(
      'QR code',
      name: 'qrCode',
      desc: 'QR code label',
    );
  }

  String get qrCodeTooltip {
    return Intl.message(
      'Scan the provided QR code',
      name: 'qrCodeTooltip',
      desc: 'QR code tooltip',
    );
  }

  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: 'Notifications label',
    );
  }

  String get alerts {
    return Intl.message(
      'Alerts',
      name: 'alerts',
      desc: 'Alerts label',
    );
  }

  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings label',
    );
  }

}

class TrackerLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const TrackerLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'nl'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(TrackerLocalizationsDelegate old) => false;
}
