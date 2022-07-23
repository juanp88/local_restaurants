import 'package:flutter/material.dart';
import 'package:local_restaurants/view/login_page.dart';
import 'package:local_restaurants/view_model/register_page_view_model.dart';
import 'package:local_restaurants/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/shared_preferences_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterPageViewModel()),
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
