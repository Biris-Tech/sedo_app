import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedo_app/models/notification.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:stacked/stacked.dart';

import 'notifications_viewmodel.dart';

class NotificationsView extends StackedView<NotificationsViewModel> {
  const NotificationsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    NotificationsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 62),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 4),
                const TextComponent(
                  "Mes notifications",
                  fontsize: 16,
                  fontweight: FontWeight.w700,
                  textcolor: kcDarkGreyColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: viewModel.notifications.length,
              itemBuilder: (context, index) {
                return NotificationItem(
                  notification: viewModel.notifications[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  NotificationsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationsViewModel();
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: kcPrimaryColor,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.text,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(height: 20, color: Colors.grey),
      ],
    );
  }
}
