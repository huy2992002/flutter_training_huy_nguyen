import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/cards/card_notification.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/notification_model.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  void _resetState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NSAppBar(
        title: AppLocalizations.of(context).notifications,
        rightIcon: NsIconButton(
          onPressed: () {
            notifications.clear();
            _resetState();
          },
          icon: SvgPicture.asset(
            Assets.icons.icTrash,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 16,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (notifications.isNotEmpty)
              Text(
                AppLocalizations.of(context).recent,
                style: NSStyle.h18Semibold,
              ),
            const SizedBox(height: 16),
            if (notifications.isEmpty)
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 250,
                  right: 30,
                ),
                child: Text(
                  AppLocalizations.of(context).noFavoriteNotification,
                  style: NSStyle.h21SemiBold
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.center,
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];

                    return CardNotification(
                      notification: notification,
                      onTap: () {
                        notification.isRead = true;
                        _resetState();
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
              )
          ],
        ),
      ),
    );
  }
}
