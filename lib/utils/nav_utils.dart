import 'package:form_validation_using_bloc/utils/exports.dart';

goHome() async {
  Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => const SuccessScreen(),
    ),
  );
}