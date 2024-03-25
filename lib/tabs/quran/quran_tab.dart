import 'package:flutter/material.dart';
import 'package:islami/models/sura_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/tabs/quran/sura_content.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import '../../provider/app_provider.dart';


class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Column(
      children: [
        Image.asset('assets/images/moshaf.png'),
        Divider(
          thickness: 3,
          color: Brightness.light == Theme.of(context).brightness
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColorDark,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Text(AppLocalizations.of(context)!.numberAyat,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              VerticalDivider(
                thickness: 3,
                color: Brightness.light == Theme.of(context).brightness
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorDark
              ),
              Expanded(
                child: Text(AppLocalizations.of(context)!.suraName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 3,
          color: Brightness.light == Theme.of(context).brightness
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColorDark,
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) => IntrinsicHeight(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SuraContent.routeName,
                            arguments: SuraModel(
                                suraName: provider.language=='en'?
                                getSurahName(index + 1):
                                getSurahNameArabic(index+1),
                                index: index + 1));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              getVerseCount(index + 1).toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          VerticalDivider(
                            thickness: 3,
                            color:
                                Brightness.light == Theme.of(context).brightness
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).primaryColorDark
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              provider.language=='en'?
                              getSurahName(index + 1):
                              getSurahNameArabic(index+1),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
              itemCount: totalSurahCount),
        ),
      ],
    );
  }
}
