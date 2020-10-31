import 'package:crudusuario/provider/users.dart';
import 'package:crudusuario/routers/app_routes.dart';
import 'package:crudusuario/views/user_form.dart';
import 'package:crudusuario/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USERT_FORM: (ctx) => UserForm(),
        },
      ),
    );
  }
}
