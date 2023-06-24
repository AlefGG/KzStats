import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_model.dart';
import 'package:csgostats/models/client.dart';
import 'package:csgostats/models/user_model.dart';
import 'package:csgostats/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:csgostats/csgostats/Theme/constats.dart';

class ClientTile extends StatelessWidget {
  final Client client;
  ClientTile({Key? key, required this.client}) : super(key: key);
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
                _MyProfileWidget(clientName: client.clientName),
                const SizedBox(height: 20),
                _AccountSecurityWidget(
                  playerId: client.playerid,
                  nickname: client.nickname,
                  email: getUserEmail() ?? '',
                ),
              ],
            ),
          );
  }
}

class _MyProfileWidget extends StatelessWidget {
  final String clientName;
  const _MyProfileWidget({
    super.key,
    required this.clientName,
  });

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
            children: [
              const Icon(
                Icons.person,
                size: 60,
              ),
              Text(
                clientName == 'clientName' ? 'Your name' : clientName,
                style: listDefaultHeaderStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _AccountSecurityWidget extends StatelessWidget {
  final String playerId;
  final String nickname;
  final String email;
  const _AccountSecurityWidget({
    Key? key,
    required this.playerId,
    required this.nickname,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account Security',
            style: listDefaultHeaderStyle,
          ),
          divider,
          _AccountSecurityRow(
            title: 'Email',
            param: email,
            buttonTitle: 'Change Email',
          ),
          const _AccountSecurityRow(
            title: 'Password',
            param: '**********',
            buttonTitle: 'Change Password',
          ),
          _AccountSecurityRow(
            title: 'Faceit nickname',
            param: nickname == 'nickname' ? 'Your nickname' : nickname,
            buttonTitle: 'Change Nickname',
          ),
          _AccountSecurityRow(
            title: 'Faceit ID',
            param: playerId == 'playerid' ? 'Your FACEIT id' : playerId,
            buttonTitle: 'Change FACEIT ID',
          ),
        ],
      ),
    );
  }
}

class _AccountSecurityRow extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final String param;
  const _AccountSecurityRow({
    super.key,
    required this.param,
    required this.title,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: listDefaultHeaderStyle,
            ),
            Text(
              param,
              style: listDefaultHeaderStyle,
            )
          ],
        ),
      ],
    );
  }
}
