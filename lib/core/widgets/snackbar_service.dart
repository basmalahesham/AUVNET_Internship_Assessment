import 'package:auvnet_flutter_internship_assessment/core/theming/colors.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class SnackBarService {
  static void showSuccessMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 150 : 95,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          msg,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'SF pro',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: cancelFunc,
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          msg,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'SF pro',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: cancelFunc,
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      duration: const Duration(
        seconds: 5,
      ),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 150 : 95,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFBC0100),
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          msg,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyles.dmSans14Medium,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: cancelFunc,
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          msg,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyles.dmSans14Medium,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: cancelFunc,
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      duration: const Duration(
        seconds: 10,
      ),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
}
