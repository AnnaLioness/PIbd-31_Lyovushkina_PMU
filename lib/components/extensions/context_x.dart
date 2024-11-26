import 'package:flutter/widgets.dart';

import '../locale/l10n/app_locale.dart';

extension LocalContextX on BuildContext {
  AppLocale get locale => AppLocale.of(this)!;
}
