import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart'
    as providere;
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_model.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_tile.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/settings_form.dart';
import 'package:csgostats/models/client.dart';
import 'package:csgostats/services/auth.dart';
import 'package:csgostats/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientProfileWidget extends StatefulWidget {
  const ClientProfileWidget({Key? key}) : super(key: key);

  @override
  State<ClientProfileWidget> createState() => _ClientProfileWidgetState();
}

class _ClientProfileWidgetState extends State<ClientProfileWidget> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final model =
        providere.NotifierProvidere.watch<ClientProfileModel>(context);

    // void _showSettingsPanel(BuildContext context) {
    //   showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return Container(
    //         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
    //         child: SettingsForm(),
    //       );
    //     },
    //   );
    // }

    return StreamProvider<List<Client>?>.value(
      initialData: null,
      value: DatabaseService().player,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(27, 31, 35, 1),
        appBar: AppBar(
          title: const Text(
            'My Profile',
            style: TextStyle(
                fontFamily: 'Play', fontWeight: FontWeight.bold, fontSize: 20),
          ),
          elevation: 0.0,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => model?.onSettingsTap(context),
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: PlayerList(),
      ),
    );
  }
}

class PlayerList extends StatefulWidget {
  const PlayerList({Key? key}) : super(key: key);

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {
    final client = Provider.of<List<Client>>(context);

    return ListView.builder(
      itemCount: client != null ? client.length : 0,
      itemBuilder: (context, index) {
        return ClientTile(client: client[index]);
      },
    );
  }
}
