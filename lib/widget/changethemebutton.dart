import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gherkins/bloc/theme/theme_bloc.dart';
import 'package:gherkins/bloc/theme/theme_event.dart';
import 'package:gherkins/src/string.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      key: const ValueKey('ThemeSelector'),
      child: PopupMenuButton(
        itemBuilder: (ctx) => [
          PopupMenuItem(
            key: const ValueKey('lightMode'),
            onTap: () {
              themeBloc.add(ThemeToggle(ThemeMode.light));
            },
            child: Row(
              children: [
                Icon(
                  Icons.light_mode,
                  key: const ValueKey('lightIcon'),
                  color: Theme.of(context).primaryColorDark,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    Strings.lightmode,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            key: const ValueKey('darkMode'),
            onTap: () {
              themeBloc.add(ThemeToggle(ThemeMode.dark));
            },
            child: Row(
              children: [
                Icon(
                  Icons.dark_mode,
                  key: const ValueKey('darkIcon'),
                  color: Theme.of(context).primaryColorDark,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    Strings.darkmode,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            key: const ValueKey('systemDefault'),
            onTap: () {
              themeBloc.add(ThemeToggle(ThemeMode.system));
            },
            child: Row(
              children: [
                Icon(
                  Icons.dark_mode_outlined,
                  key: const ValueKey('systemIcon'),
                  color: Theme.of(context).primaryColorDark,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    Strings.defalutmode,
                  ),
                ),
              ],
            ),
          )
        ],
        child: BlocBuilder<ThemeBloc, ThemeMode>(
          builder: (context, state) {
            if (state == ThemeMode.dark) {
              return const Icon(
                Icons.dark_mode,
                key: ValueKey('darkIcon'),
              );
            } else if (state == ThemeMode.light) {
              return const Icon(
                Icons.light_mode,
                key: ValueKey('lightIcon'),
              );
            } else {
              return const Icon(
                Icons.dark_mode_outlined,
                key: ValueKey('systemIcon'),
              );
            }
          },
        ),
      ),
    );
  }
}
