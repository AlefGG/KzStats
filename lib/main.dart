import 'package:csgostats/csgostats/ui/widgets/app/my_app.dart';
import 'package:csgostats/models/user_model.dart';
import 'package:csgostats/screens/wrapper.dart';
import 'package:csgostats/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final model = MyAppModel();
  // await model.checkAuth();
  // final app = MyApp(model: model);
  final app = StreamProvider<UserModel?>.value(
    initialData: null,
    value: AuthService().user,
    child: MaterialApp(
      theme: ThemeData(fontFamily: 'Play'),
      debugShowCheckedModeBanner: false,
      home: const Wrapper(),
    ),
  );
  runApp(app);
}
