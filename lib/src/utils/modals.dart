import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<DateTime?> showPlatformDatePicker(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,

  /// only works for iOS/MacOS
  required ValueChanged<DateTime> onDateTimeChanged,
}) async {
  initialDate = initialDate ?? DateTime.now();
  firstDate = firstDate ?? DateTime(1900);
  lastDate = lastDate ?? DateTime(2100);

  if (kIsWeb) {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  } else if (Platform.isIOS || Platform.isMacOS) {
    return _showCupertinoModalDialog(
      context,
      CupertinoDatePicker(
        initialDateTime: initialDate,
        minimumDate: firstDate,
        maximumDate: lastDate,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: onDateTimeChanged,
      ),
    );
  } else {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }
}

Future<TimeOfDay?> showPlatformTimePicker(
  BuildContext context, {
  DateTime? initialDate,

  /// only works for iOS/MacOS
  required ValueChanged<DateTime> onDateTimeChanged,
}) async {
  initialDate = initialDate ?? DateTime.now();

  if (kIsWeb) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
    );
  } else if (Platform.isIOS || Platform.isMacOS) {
    final DateTime? dateTime = await _showCupertinoModalDialog(
      context,
      CupertinoDatePicker(
        initialDateTime: initialDate,
        mode: CupertinoDatePickerMode.time,
        use24hFormat: true,
        onDateTimeChanged: onDateTimeChanged,
      ),
    );
    return dateTime != null ? TimeOfDay.fromDateTime(dateTime) : null;
  } else {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
    );
  }
}

Future<DateTime?> showPlatformDateAndTimePicker(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,

  /// only works for iOS/MacOS
  required ValueChanged<DateTime> onDateTimeChanged,
}) async {
  initialDate = initialDate ?? DateTime.now();
  firstDate = firstDate ?? DateTime(1900);
  lastDate = lastDate ?? DateTime(2100);

  if (kIsWeb) {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (date != null && context.mounted) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(date),
      );
      if (time != null) {
        return DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
      }
    }
    return null;
  } else if (Platform.isIOS || Platform.isMacOS) {
    await _showCupertinoModalDialog(
      context,
      CupertinoDatePicker(
        initialDateTime: initialDate,
        minimumDate: firstDate,
        maximumDate: lastDate,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: (DateTime newDate) {
          initialDate = newDate;
          onDateTimeChanged(newDate);
        },
      ),
    );
    if (context.mounted) {
      return _showCupertinoModalDialog(
        context,
        CupertinoDatePicker(
          initialDateTime: initialDate,
          mode: CupertinoDatePickerMode.time,
          use24hFormat: true,
          onDateTimeChanged: onDateTimeChanged,
        ),
      );
    }
    return null;
  } else {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (date != null && context.mounted) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(date),
      );
      if (time != null) {
        return DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
      }
    }
    return null;
  }
}

Future<DateTime?> _showCupertinoModalDialog(
  BuildContext context,
  Widget child,
) {
  return showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}
