import 'package:crudusuario/models/user.dart';
import 'package:crudusuario/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formDate = {};
  void _loadFormData(User user) {
    if (user != null) {
      _formDate['id'] = user.id;
      _formDate['name'] = user.name;
      _formDate['email'] = user.email;
      _formDate['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de úsuario"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formDate['id'],
                    name: _formDate['name'],
                    email: _formDate['email'],
                    avatarUrl: _formDate['avatarUrl'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formDate['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome Invalido';
                  }
                  if (value.trim().length < 4) {
                    return 'Nome Muito Pequeno';
                  }
                  return null;
                },
                onSaved: (value) => _formDate['name'] = value,
              ),
              TextFormField(
                initialValue: _formDate['email'],
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formDate['email'] = value,
              ),
              TextFormField(
                initialValue: _formDate['avatarUrl'],
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formDate['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
