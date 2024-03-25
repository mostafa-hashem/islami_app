import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';

class QuranTranslateBottomSheet extends StatelessWidget {
  const QuranTranslateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.suraTranslate(false);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Text("متوقف"),
                  const Spacer(),
                  Icon(
                    provider.translateOn == false
                        ? Icons.check_circle_outline
                        : Icons.circle_outlined,
                    size: 35,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                provider.suraTranslate(true);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Text("قيد التشغيل"),
                  const Spacer(),
                  Icon(
                    provider.translateOn == true
                        ? Icons.check_circle_outline
                        : Icons.circle_outlined,
                    size: 35,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Brightness.light == Theme.of(context).brightness
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorDark),
        ),
        Icon(Icons.check,
            color: Brightness.light == Theme.of(context).brightness
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColorDark),
      ],
    );
  }
}
