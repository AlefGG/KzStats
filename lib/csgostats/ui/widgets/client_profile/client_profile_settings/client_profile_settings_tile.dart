import 'package:csgostats/csgostats/Theme/app_colors.dart';
import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/Theme/loading.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_model.dart';
import 'package:csgostats/models/client.dart';
import 'package:csgostats/models/user_model.dart';
import 'package:csgostats/services/auth.dart';
import 'package:csgostats/services/database.dart';
import 'package:flutter/material.dart';
import 'package:csgostats/csgostats/Theme/constats.dart';

class ClientProfileSettingsTile extends StatelessWidget {
  final Client client;
  ClientProfileSettingsTile({Key? key, required this.client}) : super(key: key);
  final currentUserId = getUserId();

  @override
  Widget build(BuildContext context) {
    final clientId = client.clientid;

    return currentUserId! != clientId
        ? const SizedBox.shrink()
        : Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
              top: 10,
            ),
            color: const Color.fromRGBO(45, 56, 68, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MyProfileWidget(client: client),
                const SizedBox(height: 20),
                _AccountSecurityWidget(client: client),
              ],
            ),
          );
  }
}

class _MyProfileWidget extends StatefulWidget {
  final Client client;
  const _MyProfileWidget({
    super.key,
    required this.client,
  });

  @override
  State<_MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<_MyProfileWidget> {
  String? _currentName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Profile',
            style: listDefaultHeaderStyle,
          ),
          divider,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 60,
              ),
              Column(
                children: [
                  const SizedBox(height: 0),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: widget.client.clientName == 'clientName'
                              ? 'Your name'
                              : widget.client.clientName),
                      validator: (val) => val == null || val.isEmpty
                          ? 'Enter your FACEIT nickname'
                          : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountSecurityWidget extends StatelessWidget {
  final Client client;
  const _AccountSecurityWidget({Key? key, required this.client})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clientEmail = getUserEmail();
    // final model = NotifierProvidere.watch<ClientProfileModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Profile Data',
            style: listDefaultHeaderStyle,
          ),
          divider,
          SizedBox(height: 10),
          _FaceitCredentialsWidget(),
          SizedBox(height: 10),
          Text(
            'Account Security',
            style: listDefaultHeaderStyle,
          ),
          divider,
          SizedBox(height: 10),
          _ResetPasswordWidget(),
          SizedBox(height: 10),
          divider,
          SizedBox(height: 10),
          _DeleteAccountWidget(),
        ],
      ),
    );
  }
}

class _FaceitCredentialsWidget extends StatefulWidget {
  const _FaceitCredentialsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_FaceitCredentialsWidget> createState() =>
      _FaceitCredentialsWidgetState();
}

class _FaceitCredentialsWidgetState extends State<_FaceitCredentialsWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _currentNickname;
  String? _currentId;
  String? error;
  bool loading = false;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Faceit Nickname',
                  style: listDefaultHeaderStyle,
                ),
                SizedBox(
                  width: 330,
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: userData?.nickname == 'nickname'
                            ? 'your nickname'
                            : userData?.nickname),
                    validator: (val) => val == null || val.isEmpty
                        ? 'Enter your FACEIT nickname'
                        : null,
                    onChanged: (val) => setState(() => _currentNickname = val),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Faceit ID',
                  style: listDefaultHeaderStyle,
                ),
                SizedBox(
                  width: 330,
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: '${userData?.playerid}' == 'playerid'
                            ? 'Faceit ID'
                            : userData?.playerid),
                    validator: (val) => val == null || val.isEmpty
                        ? 'Enter your FACEIT ID'
                        : null,
                    onChanged: (val) => setState(() => _currentId = val),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(
                      width: 220,
                    ),
                    SizedBox(
                      width: 110,
                      height: 45,
                      child: loading == true
                          ? const Loading()
                          : ElevatedButton(
                              style: signupStyle,
                              child: const Text(
                                'Apply Changes',
                                style: listDefaultHeaderStyle,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await DatabaseService(uid: userId)
                                          .updateUserData(
                                              _currentId ?? 'playerId',
                                              _currentNickname ?? 'nickname',
                                              0,
                                              userId!,
                                              userData?.clientName ??
                                                  'Ivan Ivanov');
                                  setState(() => loading = false);
                                  if (result is String) {
                                    setState(
                                      () {
                                        error = result;
                                        loading = false;
                                      },
                                    );
                                  }
                                }
                              },
                            ),
                    ),
                    error == null
                        ? const SizedBox.shrink()
                        : Text(
                            '$error',
                            style: listDefaultTextStyle,
                          )
                  ],
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

class _ResetPasswordWidget extends StatefulWidget {
  const _ResetPasswordWidget({Key? key}) : super(key: key);

  @override
  State<_ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<_ResetPasswordWidget> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String? error;
  String? prompt;
  bool loading = false;
  String? userId = getUserId();
  String? userEmail = getUserEmail();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: userId).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reset password',
                  style: listDefaultHeaderStyle,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 330,
                  height: 45,
                  child: loading == true
                      ? const Loading()
                      : ElevatedButton(
                          style: signupStyle,
                          child: const Text(
                            'Get email verification link',
                            style: listDefaultHeaderStyle,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.sendPasswordResetEmail(
                                      userEmail ?? 'notvalid');
                              setState(() => loading = false);
                              if (result is String) {
                                setState(
                                  () {
                                    error = result;
                                    loading = false;
                                  },
                                );
                              } else {
                                setState(() {
                                  prompt =
                                      'Password reset has been sent to your email. Please check your inbox.';
                                });
                              }
                            }
                          },
                        ),
                ),
                error == null
                    ? const SizedBox.shrink()
                    : Text(
                        '$error',
                        style: listDefaultTextStyle,
                      ),
                prompt == null
                    ? const SizedBox.shrink()
                    : Text(
                        '$prompt',
                        style: listDefaultTextStyle,
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

class _DeleteAccountWidget extends StatefulWidget {
  const _DeleteAccountWidget({Key? key}) : super(key: key);

  @override
  State<_DeleteAccountWidget> createState() => _DeleteAccountWidgetState();
}

class _DeleteAccountWidgetState extends State<_DeleteAccountWidget> {
  final AuthService _auth = AuthService();
  final DatabaseService _db = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  String? _currentEmail;
  String? error;
  String? deleteError;
  String? prompt;
  bool loading = false;
  String? userId = getUserId();
  String? userEmail = getUserEmail();
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
                Row(
                  children: [
                    const SizedBox(width: 220),
                    SizedBox(
                      width: 110,
                      height: 45,
                      child: loading == true
                          ? const Loading()
                          : ElevatedButton(
                              style: deleteAccountStyle,
                              child: const Text(
                                'Delete account',
                                style: listDefaultHeaderStyle,
                              ),
                              onPressed: () {
                                showDialogMethod(
                                  context,
                                  userEmail ?? '',
                                  userId ?? '',
                                );
                              },
                            ),
                    ),
                  ],
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

  Future<dynamic> showDialogMethod(
      BuildContext context, String userEmail, String userId) {
    final model = NotifierProvidere.watch<ClientProfileModel>(context);
    String? _currentPassword;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: AppColors.barColor,
              title: const Text(
                'Delete account',
                style: listDefaultHeaderStyle,
              ),
              content: SizedBox(
                height: 250,
                child: Column(
                  children: [
                    const Text(
                      "Are you sure you want to delete your account?\nThis action can't be undone",
                      style: listDefaultTextStyle,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(
                        hintText: 'password',
                      ),
                      validator: (val) => val == null || val.isEmpty
                          ? 'Please provide your password'
                          : null,
                      onChanged: (val) =>
                          setState(() => _currentPassword = val),
                    ),
                    error == null
                        ? const SizedBox.shrink()
                        : Text(
                            '$error',
                            style: listDefaultTextStyle,
                          ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  style: signupStyle,
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: listDefaultTextStyle,
                  ),
                ),
                ElevatedButton(
                  style: deleteAccountStyle,
                  child: const Text(
                    'Delete',
                    style: listDefaultTextStyle,
                  ),
                  onPressed: () async {
                    setState(() => loading = true);
                    dynamic dbResult = await _db.deleteDocument(userId);
                    if (dbResult is String) {
                      setState(
                        () {
                          error = dbResult;
                          loading = false;
                        },
                      );
                    } else {
                      dynamic result = await _auth.deleteAccount(
                          userEmail, _currentPassword ?? '');
                      if (result is String) {
                        setState(
                          () {
                            error = result;
                            loading = false;
                          },
                        );
                      } else {
                        Navigator.pop(context);
                        model?.onDeleteTap(context);
                      }
                    }
                  },
                )
              ],
            );
          },
        );
      },
    );
  }
}
