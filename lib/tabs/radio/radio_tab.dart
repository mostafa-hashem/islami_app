import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';


class RadioTab extends StatefulWidget {
  static const String routeName = "RadioTap";
  late bool isPlay = false;

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyAppProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 120,
        ),
        Image.asset("assets/images/radioImage.png"),
        const SizedBox(
          height: 40,
        ),
        Text(
          "إذاعة القرآن الكريم",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: prov.language == "ar"
                    ? const Icon(Icons.skip_next, size: 40)
                    : const Icon(
                        Icons.skip_previous,
                        size: 40,
                      )),
            const SizedBox(
              width: 25,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.isPlay = !widget.isPlay;
                });
              },
              icon: widget.isPlay
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.stop),
            ),
            const SizedBox(
              width: 25,
            ),
            IconButton(
                onPressed: () {},
                icon: prov.language == "ar"
                    ? const Icon(Icons.skip_previous, size: 40)
                    : const Icon(
                        Icons.skip_next,
                        size: 40,
                      )),
          ],
        )
      ],
    );
  }
}
