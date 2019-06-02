import 'package:flutter/material.dart';
import 'package:flutter_custom_error_page/error_message.dart';
import 'package:flutter_custom_error_page/theme/blue_screen_error_message_theme.dart';
import 'package:flutter_custom_error_page/theme/laravel_error_message_theme.dart';
import 'package:flutter_custom_error_page/theme/visual_studio_error_message_theme.dart';

enum ErrorTheme { Laravel, VisualStudio, BlueScreen }

class ErrorMessageBuilder {
  static ErrorWidgetBuilder build({theme = ErrorTheme.Laravel}) {
    ErrorWidgetBuilder func = (FlutterErrorDetails errorDetails) {
      ErrorMessage errorMessage = ErrorMessage(errorDetails);
      if (theme == ErrorTheme.Laravel) {
        return LaravelErrorMessageTheme.build(errorMessage);
      } else if (theme == ErrorTheme.VisualStudio) {
        return VisualStudioErrorMessageTheme.build(errorMessage);
      } else if (theme == ErrorTheme.BlueScreen) {
        return BlueScreenErrorMessageTheme.build(errorMessage);
      }
    };
    return func;
  }
}
