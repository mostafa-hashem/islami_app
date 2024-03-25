import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/styles.dart';
import '../provider/app_provider.dart';

class ZekrSheet extends StatefulWidget {
  Function onChanged;
  String zekr ;
  ZekrSheet(this.onChanged, this.zekr);

  @override
  State<ZekrSheet> createState() => _ZekrSheetState();
}

class _ZekrSheetState extends State<ZekrSheet> {
  var zekrTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyAppProvider>(context);

    return Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (value){
                widget.onChanged(value);
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: prov.language == "ar" ? 'اكتب الذكر' : "Input Zekr",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyThemeData.lightColor,
                ),
                child: Text(AppLocalizations.of(context)!.addZekr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
