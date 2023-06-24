import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/models/team.dart';
import 'package:csgostats/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeamTile extends StatelessWidget {
  final Team team;
  final int index;
  TeamTile({Key? key, required this.team, required this.index})
      : super(key: key);
  final currentUserId = getUserId();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
        top: 10,
      ),
      color: const Color.fromRGBO(45, 56, 68, 1),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            (index + 1).toString(),
            style: listDefaultHeaderStyle,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 40,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(team.logo),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            team.name,
            textAlign: TextAlign.start,
            style: listDefaultHeaderStyle,
          ),
          const Spacer(),
          Container(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  team.games,
                  style: listDefaultHeaderStyle,
                ),
                Text(
                  team.rounds,
                  style: listDefaultHeaderStyle,
                ),
                Text(
                  team.maps,
                  style: listDefaultHeaderStyle,
                ),
                Text(
                  team.points,
                  style: listDefaultHeaderStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
