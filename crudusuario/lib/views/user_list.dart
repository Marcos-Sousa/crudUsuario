import 'package:crudusuario/components/user_file.dart';
import 'package:crudusuario/provider/users.dart';
import 'package:crudusuario/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuarios"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USERT_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
