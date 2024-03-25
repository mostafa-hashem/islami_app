import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/sura_model.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';

import '../../provider/app_provider.dart';

class SuraContent extends StatelessWidget {
  static const String routeName = "SuraContent";

  const SuraContent({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    SuraModel args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Brightness.light == Theme.of(context).brightness
              ? 'assets/images/light_bg.png'
              : 'assets/images/dark_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "إسلامي",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: Brightness.light == Theme.of(context).brightness
                  ? const Color(0xCCF8F8F8)
                  : const Color(0xCC141A2E),
              border: Border.all(
                color: Brightness.light == Theme.of(context).brightness
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorDark,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "سورة ${args.suraName}",
                        style: const TextStyle(color: Color(0xffB7935F)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.play_circle),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Brightness.light == Theme.of(context).brightness
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark,
                    indent: 35,
                    endIndent: 35,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: provider.translateOn,
                    child: RichText(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          for (var i = 1;
                              i <= getVerseCount(args.index);
                              i++) ...{
                            TextSpan(
                              text: ' ${getVerse(args.index, i)} ',
                              style: GoogleFonts.amiriQuran(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            TextSpan(
                              text: '${getVerseEndSymbol(i)} \n',
                            ),
                            TextSpan(
                              text:
                                  ' "${getVerseTranslation(args.index, i)}"  \n',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          }
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                      visible: provider.translateOff,
                      child: RichText(
                        textDirection: TextDirection.rtl,
                        textAlign: args.index <= 20
                            ? TextAlign.center
                            : TextAlign.justify,
                        text: TextSpan(
                            style: GoogleFonts.amiriQuran(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              fontSize: 25,
                            ),
                            children: [
                              for (var i = 1;
                                  i <= getVerseCount(args.index);
                                  i++) ...{
                                TextSpan(text: ' ${getVerse(args.index, i)} '),
                                TextSpan(
                                    text: getVerseEndSymbol(i),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Brightness.light ==
                                                  Theme.of(context).brightness
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .primaryColorDark,
                                        )),
                              }
                            ]),
                      )),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
