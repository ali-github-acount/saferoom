import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saferoom/src/supported_languages.dart';

class ListsLanguage extends StatelessWidget {
  const ListsLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: _languages(context),
      ),
    );
  }

  Widget _button(Locale locale, BuildContext context) {
    return TextButton(
      onPressed: () => context.setLocale(locale),
      child: Text(_language(locale)),
    );
  }

  Widget _languages(BuildContext context) {
    final languagesLength = SupportedLanguage.getLanguages.length;
    final languages = SupportedLanguage.getLanguages;
    final items = languages.skip(2).map((locale) {
      return DropdownMenuItem<Locale>(
        value: locale,
        child: Text(_language(locale)),
      );
    }).toList();

    var dropdownButton = DropdownButton<Locale>(
      hint: Text(tr('language.other')),
      items: items,
      onChanged: (locale) => context.setLocale(locale!),
    );

    final minLanguage = languages
        .getRange(0, 2)
        .map((locale) => _button(locale, context))
        .toList()
      ..add(dropdownButton);

    if (languagesLength > 2) {
      return Row(children: minLanguage);
    }
    return Row(
      children: languages.map((locale) {
        return _button(locale, context);
      }).toList(),
    );
  }

  String _language(Locale locale) {
    String? language;
    switch (locale.languageCode) {
      case 'en':
        language = tr("language.english");
        break;
      case 'fa':
        language = tr("language.persion");
        break;
    }
    return language!;
  }
}
