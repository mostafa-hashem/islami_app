import 'package:flutter/material.dart';
import 'package:islami/models/hadeth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';

class HadethContent extends StatelessWidget {
  static const String routeName = "HadethContent";

  const HadethContent({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyAppProvider>(context);
    HadethModel args =
        ModalRoute.of(context)?.settings.arguments as HadethModel;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Container(
            height: height * 0.9,
            width: width * 0.9,
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(
                right: width * 0.05,
                left: width * 0.05,
                bottom: height * 0.05,
                top: height * 0.05),
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
            child: args.content.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ))
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(args.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium),
                      Divider(
                        thickness: 3,
                        color: prov.themeMode == ThemeMode.dark
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            RichText(
                              textDirection: TextDirection.rtl,
                              textAlign: args.content.length <= 20
                                  ? TextAlign.center
                                  : TextAlign.justify,
                              text: TextSpan(
                                children: [
                                  for (var i = 0;
                                      i < args.content.length;
                                      i++) ...{
                                    TextSpan(
                                      text: ' ${args.content[i]} ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  }
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
