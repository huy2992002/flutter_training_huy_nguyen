import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/change_password_page.dart';
import 'package:nike_sneaker_store/pages/home/widgets/ns_switch.dart';
import 'package:nike_sneaker_store/providers/app_provider.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController dropdownController = TextEditingController();
  List<String> language = ['en', 'vi'];

  @override
  void initState() {
    dropdownController.text = SharedPrefs.isVietnamese ? 'vi' : 'en';
    super.initState();
  }

  void onChangedTheme() {
    Provider.of<AppProvider>(context, listen: false).changedTheme();

    setState(() {
      SharedPrefs.isDark = !SharedPrefs.isDark;
      if (SharedPrefs.isDark) {
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
                onChanged: onChangedTheme,
                isDark: SharedPrefs.isDark,
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
              DropdownMenu(
                controller: dropdownController,
                dropdownMenuEntries: List.generate(
                  language.length,
                  (index) => DropdownMenuEntry(
                    value: language[index],
                    label: language[index],
                  ),
                ),
                onSelected: (value) {
                  dropdownController.text = value ?? 'en';
                  if (value != null && value == 'vi') {
                    Provider.of<AppProvider>(context, listen: false)
                        .changedLocaleVi();
                    SharedPrefs.isVietnamese = true;
                  }

                  if (value != null && value == 'en') {
                    Provider.of<AppProvider>(context, listen: false)
                        .changedLocaleEn();
                    SharedPrefs.isVietnamese = false;
                  }
                  setState(() {});
                },
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
