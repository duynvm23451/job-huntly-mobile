import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message, bool isError) {
  final toastCard = ToastCard(
    color: isError ? Colors.red.shade500 : Colors.green.shade500,
    leading: Icon(
      isError ? Icons.error : Icons.check,
      color: Colors.white,
    ),
    title: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
  );

  DelightToastBar(
    builder: (context) => toastCard,
  ).show(context);
}
