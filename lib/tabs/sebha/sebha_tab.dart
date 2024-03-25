import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/styles.dart';
import '../../provider/sebha_provider.dart';
import '../../sheets/showZekrSheet.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = "SebhaTab";

  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  String zekr = "";
  late SebhaProvider provider;

  @override
  Widget build(BuildContext context) {
    getPreferences();
    return ChangeNotifierProvider(
        create: (BuildContext context) => SebhaProvider(),
        builder: (context, child) {
          provider = Provider.of<SebhaProvider>(context);
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Brightness.light == Theme.of(context).brightness
                        ? Image.asset('assets/images/head_of_seb7a_light.png')
                        : Image.asset('assets/images/head_of_seb7a_dark.png'),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text('${provider.counter}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge),
                        GestureDetector(
                          onTap: () {
                            provider.onTap();
                          },
                          child: Container(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * .08),
                              child: Transform.rotate(
                                  angle: provider.angle,
                                  child: Brightness.light ==
                                          Theme.of(context).brightness
                                      ? Image.asset(
                                          'assets/images/body_of_seb7a_light.png')
                                      : Image.asset(
                                          'assets/images/body_of_seb7a_dark.png'))),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "عدد التسبيحات",
                  style: GoogleFonts.amiriQuran(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Visibility(
                  visible: isZekr(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyThemeData.lightColor.withOpacity(.57),
                    ),
                    child: Text(zekr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Visibility(
                  visible: isZekr(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            showZekrSheet(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: MyThemeData.lightColor),
                              child:
                                  Text(AppLocalizations.of(context)!.addZekr))),
                      InkWell(
                          onTap: () {
                            provider.reset();
                          },
                          child: const Icon(
                            Icons.restart_alt,
                            size: 60,
                          )),
                      InkWell(
                          onTap: () {
                            zekr = "";
                            provider.reset();
                            setState(() {});
                          },
                          child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: MyThemeData.lightColor),
                              child: Text(
                                  AppLocalizations.of(context)!.removeZekr))),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isZekr(),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            showZekrSheet(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: MyThemeData.lightColor),
                              child:
                              Text(AppLocalizations.of(context)!.addZekr))),
                      const SizedBox(height: 40,),
                      InkWell(
                          onTap: () {
                            provider.reset();
                          },
                          child: const Icon(
                            Icons.restart_alt,
                            size: 60,
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void getPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int counter = prefs.getInt('counter') ?? 0;
    provider.initValues(counter);
  }

  void showZekrSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return ZekrSheet((text) {
          zekr = text;
        }, zekr);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ).then((value) => setState(() {}));
  }

  bool isZekr() {
    if (zekr.isNotEmpty) {
      return true;
    }
    return false;
  }
}
