import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/features/notification/view/widgets/card_notification.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  /// Screen display notifications
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NSAppBar(
        title: AppLocalizations.of(context).notifications,
        rightIcon: NsIconButton(
          onPressed: () {
            notifications.clear();
            setState(() {});
          },
          icon: SvgPicture.asset(
            Assets.icons.icTrash,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (notifications.isNotEmpty)
              Text(
                AppLocalizations.of(context).recent,
                style: Theme.of(context).textTheme.titleMedium,
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
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  textAlign: TextAlign.center,
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (_, index) {
                    final notification = notifications[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CardNotification(
                        notification: notification,
                        onTap: () {
                          notification.isRead = true;
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
