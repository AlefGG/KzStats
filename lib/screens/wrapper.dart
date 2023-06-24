import 'package:csgostats/authenticate/authenticate.dart';
import 'package:csgostats/csgostats/ui/widgets/app/my_app.dart';
import 'package:csgostats/csgostats/ui/widgets/app/my_app_model.dart';
import 'package:csgostats/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if (user == null) {
      return Authenticate();
    } else {
      final model = MyAppModel();
      return MyApp(model: model);
    }
  }
}
