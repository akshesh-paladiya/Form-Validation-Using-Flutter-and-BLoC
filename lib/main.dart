import 'package:form_validation_using_bloc/utils/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form Validation',
      navigatorKey: navigatorKey,
      home: BlocProvider(
        create: (context) => FormBloc()..add(const InitEvent()),
        child: const BlocFormScreen(),
      ),
    );
  }
}