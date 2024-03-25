import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';
import '../../provider/hadeth_provider.dart';
import 'hadeth_content.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HadethProvider(),
      builder: (context, child) {
        var provider = Provider.of<HadethProvider>(context)..loadFile();
        var prov = Provider.of<MyAppProvider>(context);
        return Column(
          children: [
            Image.asset('assets/images/hadeth.png'),
            Divider(
              thickness: 3,
              color: prov.themeMode == ThemeMode.dark
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).primaryColor,
            ),
            Center(
              child: Text(AppLocalizations.of(context)!.hadethName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Divider(
              thickness: 3,
              color: prov.themeMode == ThemeMode.dark
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).primaryColor,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HadethContent.routeName,
                        arguments: provider.hadethModel[index]);
                  },
                  child: Text(
                    provider.hadethModel[index].title,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                itemCount: provider.hadethModel.length,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  indent: 90,
                  endIndent: 90,
                  thickness: 2,
                  color: prov.themeMode == ThemeMode.dark
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
