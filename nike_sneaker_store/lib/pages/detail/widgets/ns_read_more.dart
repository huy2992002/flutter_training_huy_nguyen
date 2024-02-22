import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class NSReadMore extends StatefulWidget {
  const NSReadMore({
    required this.text,
    this.maxLine = 3,
    super.key,
  });

  final String text;
  final int maxLine;

  @override
  State<NSReadMore> createState() => _NSReadMoreState();
}

class _NSReadMoreState extends State<NSReadMore> {
  bool isShowAllText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () => setState(() => isShowAllText = !isShowAllText),
          hoverColor: Colors.transparent,
          child: Text(
            widget.text,
            style: NSStyle.h14Normal.copyWith(color: NSColor.neutral),
            maxLines: isShowAllText ? null : widget.maxLine,
            overflow: isShowAllText ? null : TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
        if (!isShowAllText)
          GestureDetector(
            onTap: () => setState(() => isShowAllText = true),
            child: Text(
              AppLocalizations.of(context).readMore,
              style: NSStyle.h14Normal
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.right,
            ),
          ),
      ],
    );
  }
}
