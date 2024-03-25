import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/sheets/showLanguageSheet.dart';
import 'package:islami/sheets/showTranslateSheet.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';
import '../../sheets/showThemeSheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);

    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          InkWell(
            onTap: () {
                showLanguageSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Brightness.light == Theme.of(context).brightness
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorDark,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.language == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          InkWell(
            onTap: () {
              showThemeSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Brightness.light == Theme.of(context).brightness
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorDark,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.themeMode == ThemeMode.light
                        ? AppLocalizations.of(context)!.lightMood
                        : provider.themeMode == ThemeMode.system
                            ? AppLocalizations.of(context)!.systemMood
                            : AppLocalizations.of(context)!.darkMood,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            AppLocalizations.of(context)!.quranTranslate,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          InkWell(
            onTap: () {
              showquranTranslateSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Brightness.light == Theme.of(context).brightness
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorDark,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.translateOn == true
                        ? AppLocalizations.of(context)!.on
                        : AppLocalizations.of(context)!.off,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  void showThemeSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  void showquranTranslateSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const QuranTranslateBottomSheet();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
