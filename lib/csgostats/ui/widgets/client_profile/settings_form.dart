import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/Theme/loading.dart';
import 'package:csgostats/models/user_model.dart';
import 'package:csgostats/services/auth.dart';
import 'package:csgostats/services/database.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  String? _currentPlayerId;
  String? email = getUserEmail();
  String? userId = getUserId();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: userId).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData? userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Hello, $email!',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please provide your Faceit player ID',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '${userData?.nickname}'),
                  validator: (val) => val == null || val.isEmpty
                      ? 'Your PlayerId on Faceit'
                      : null,
                  onChanged: (val) => setState(() => _currentPlayerId = val),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: signupStyle,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await DatabaseService(uid: userId).updateUserData(
                            _currentPlayerId ?? 'nickname',
                            'nickname',
                            0,
                            userId!,
                            'Ivan Ivanov');
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Enter'),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Loading();
        }
      },
    );
  }
}
