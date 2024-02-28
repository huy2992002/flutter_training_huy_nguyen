import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/change_password_page.dart';
import 'package:nike_sneaker_store/pages/home/widgets/ns_switch.dart';
import 'package:nike_sneaker_store/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}


class _SettingPageState extends State<SettingPage> {
  bool isDark = false;
  String? dropdownValue = 'en';
  List<String> language = ['en', 'vi'];
  void onChangeTheme() {
    Provider.of<AppProvider>(context, listen: false).changeTheme();

    setState(() {
      isDark = !isDark;
      if (isDark) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NSAppBar(
        title: AppLocalizations.of(context).setting,
        leftIcon: NsIconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            Assets.icons.icArrow,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context).changeTheme,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              NSSwitch(
                onChange: onChangeTheme,
                isDark: isDark,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Text(
                AppLocalizations.of(context).changeLanguage,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              DropdownButton(
                items: List.generate(
                  language.length,
                  (index) => DropdownMenuItem(
                    value: language[index],
                    child: Text(
                      language[index],
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                onChanged: (value) {
                  dropdownValue = value;
                  if (value != null && value == 'vi') {
                    Provider.of<AppProvider>(context, listen: false)
                        .changeLocaleVi();
                  }

                  if (value != null && value == 'en') {
                    Provider.of<AppProvider>(context, listen: false)
                        .changeLocaleEn();
                  }
                  setState(() {});
                },
                value: dropdownValue,
              ),
            ],
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChangePasswordPage(),
                ),
              );
            },
            behavior: HitTestBehavior.translucent,
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context).changePassword,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                const Icon(Icons.arrow_right_alt)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
