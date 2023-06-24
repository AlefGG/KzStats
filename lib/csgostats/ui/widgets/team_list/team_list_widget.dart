import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart'
    as providere;
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_profile_model.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/client_tile.dart';
import 'package:csgostats/csgostats/ui/widgets/client_profile/settings_form.dart';
import 'package:csgostats/csgostats/ui/widgets/team_list/team_list_model.dart';
import 'package:csgostats/csgostats/ui/widgets/team_list/team_tile.dart';
import 'package:csgostats/models/client.dart';
import 'package:csgostats/models/team.dart';
import 'package:csgostats/services/auth.dart';
import 'package:csgostats/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamListWidget extends StatefulWidget {
  const TeamListWidget({Key? key}) : super(key: key);

  @override
  State<TeamListWidget> createState() => _TeamListWidgetState();
}

class _TeamListWidgetState extends State<TeamListWidget> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final model = providere.NotifierProvidere.watch<TeamListModel>(context);

    return StreamProvider<List<Team>?>.value(
      initialData: null,
      value: DatabaseService().team,
      child: const Scaffold(
        backgroundColor: Color.fromRGBO(27, 31, 35, 1),
        body: TeamList(),
      ),
    );
  }
}

class TeamList extends StatefulWidget {
  const TeamList({Key? key}) : super(key: key);

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    final team = Provider.of<List<Team>>(context);

    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 38),
          itemCount: team != null ? team.length : 0,
          itemBuilder: (context, index) {
            return TeamTile(team: team[index], index: index);
          },
        ),
        const _RowHeaderWidget(),
      ],
    );
  }
}

class _RowHeaderWidget extends StatelessWidget {
  const _RowHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Color.fromRGBO(146, 154, 158, 1));
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(45, 56, 68, 1),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('G', style: listDefaultHeaderStyle),
            SizedBox(width: 15),
            Text('R', style: listDefaultHeaderStyle),
            SizedBox(width: 17),
            Text('M', style: listDefaultHeaderStyle),
            SizedBox(width: 14),
            Text('P', style: listDefaultHeaderStyle),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
