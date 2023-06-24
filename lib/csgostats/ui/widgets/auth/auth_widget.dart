import 'package:csgostats/csgostats/Theme/app_colors.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/auth/auth_model.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.barColor,
      appBar: AppBar(
        title: const Text('Please sign in to continue'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: const [
            SizedBox(height: 20),
            _HeaderWidget(),
            SizedBox(height: 20),
            _FormWidget(),
          ],
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/hltv.webp',
          height: 70,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.read<AuthModel>(context);

    final ButtonStyle signupStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: AppColors.mainDarkBlue,
      foregroundColor: AppColors.textColor,
    );
    const textStyle = TextStyle(
      fontSize: 16,
      color: AppColors.textColor,
    );
    const textFieldUsernameDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      hintText: 'Username',
      hintStyle: textStyle,
    );
    const textFieldPasswordDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      hintText: 'Password',
      hintStyle: textStyle,
    );
    // final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: textFieldUsernameDecoration,
          controller: model?.loginTextController,
        ),
        const SizedBox(height: 17),
        TextField(
          obscureText: true,
          decoration: textFieldPasswordDecoration,
          controller: model?.passwordTextController,
        ),
        Row(
          children: [
            Row(
              children: const [
                _CheckBoxRememberMe(),
                Text(
                  'Remember me',
                  style: textStyle,
                ),
              ],
            ),
            const Spacer(),
            TextButton(
              child: const Text(
                'Forgot password',
                style: textStyle,
              ),
              onPressed: () {},
            ),
          ],
        ),
        const _ErrorMessageWidget(),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: _AuthButtonWidget(signupStyle: signupStyle),
        ),
        const Divider(
          height: 20.0,
          thickness: 2.0,
          color: AppColors.textColor,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: LoginWithFaceitWidget(signupStyle: signupStyle),
        ),
      ],
    );
  }
}

class LoginWithFaceitWidget extends StatelessWidget {
  const LoginWithFaceitWidget({
    super.key,
    required this.signupStyle,
  });

  final ButtonStyle signupStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: signupStyle,
      onPressed: () {},
      child: const Text(
        'Login With Faceit',
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    super.key,
    required this.signupStyle,
  });

  final ButtonStyle signupStyle;

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const CircularProgressIndicator()
        : const Text(
            'Login',
          );

    return ElevatedButton(
      style: signupStyle,
      onPressed: onPressed,
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        NotifierProvidere.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 17,
        ),
      ),
    );
  }
}

class _CheckBoxRememberMe extends StatefulWidget {
  const _CheckBoxRememberMe({Key? key}) : super(key: key);

  @override
  State<_CheckBoxRememberMe> createState() => __CheckBoxRememberMeState();
}

class __CheckBoxRememberMeState extends State<_CheckBoxRememberMe> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: MaterialStateProperty.all(Colors.blue),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
