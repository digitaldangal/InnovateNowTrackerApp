import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/messages_all.dart';

class ThingLocalizations {

  static Future<ThingLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((Object _) {
      Intl.defaultLocale = localeName;
      return new ThingLocalizations();
    });
  }

  static ThingLocalizations of(BuildContext context) {
    return Localizations.of<ThingLocalizations>(context, ThingLocalizations);
  }

  String get things {
    return Intl.message(
      'Things',
      name: 'things',
      desc: 'Title for the Things button',
    );
  }

  String get thingName {
    return Intl.message(
      'Name',
      name: 'thingName',
      desc: 'Thing name label',
    );
  }

  String get thingNameTooltip {
    return Intl.message(
      'Specify the name',
      name: 'thingNameTooltip',
      desc: 'Thing name tooltip',
    );
  }

  String get thingDescription {
    return Intl.message(
      'Description',
      name: 'thingDescription',
      desc: 'Thing description label',
    );
  }

  String get thingDescriptionTooltip {
    return Intl.message(
      'Short brief thing description',
      name: 'thingDescriptionTooltip',
      desc: 'Thing description tooltip',
    );
  }

  String get thingColor {
    return Intl.message(
      'Color',
      name: 'thingColor',
      desc: 'Thing color label',
    );
  }

  String get thingColorTooltip {
    return Intl.message(
      'Choose the thing display color',
      name: 'thingColorTooltip',
      desc: 'Thing color tooltip',
    );
  }

  String get thingChooseColor {
    return Intl.message(
      'Choose color',
      name: 'thingChooseColor',
      desc: 'Thing choose color label',
    );
  }

  String get thingActivationDate {
    return Intl.message(
      'Activation date',
      name: 'thingActivationDate',
      desc: 'Thing activation date label',
    );
  }

  String get thingExpirationDate {
    return Intl.message(
      'Expiration date',
      name: 'thingExpirationDate',
      desc: 'Thing expiration date label',
    );
  }

  String get thingConfirmation {
    return Intl.message(
      'Confirmation',
      name: 'thingConfirmation',
      desc: 'Thing confirmation label',
    );
  }

  String get thingConfirmationTooltip {
    return Intl.message(
      'Confirm the new thing',
      name: 'thingConfirmationTooltip',
      desc: 'Thing confirmation tooltip',
    );
  }

}

class ThingLocalizationsDelegate extends LocalizationsDelegate<ThingLocalizations> {
  const ThingLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'nl'].contains(locale.languageCode);

  @override
  Future<ThingLocalizations> load(Locale locale) => ThingLocalizations.load(locale);

  @override
  bool shouldReload(ThingLocalizationsDelegate old) => false;
}