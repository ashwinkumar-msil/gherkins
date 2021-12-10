import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gherkins/bloc/sorting_bloc/bloc/sorting_bloc_bloc.dart';
import 'package:gherkins/bloc/theme/theme_bloc.dart';
import 'package:gherkins/bloc/watchlist_bloc.dart';
import 'package:gherkins/bloc/watchlist_event.dart';
import 'package:gherkins/model/contact_data_model.dart';
import 'package:gherkins/src/string.dart';
import 'package:gherkins/widget/changethemebutton.dart';

import 'categoreis_screen.dart';
import 'sorting_sheet.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late WatchlistBloc watchlistBloc;
  Map<int, String> sortingTypeAppliedAtTabIndex = {};
  ThemeBloc themeBloc = ThemeBloc();
  bool isLightTheme = false;
  List<Contact> contactdata = [];
  int userCurrentTab = 0;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    watchlistBloc = BlocProvider.of<WatchlistBloc>(context);
    watchlistBloc.add(FetchContactData());
    _tabController.addListener(() {
    
      userCurrentTab = _tabController.index;
      if(_tabController.indexIsChanging){
         watchlistBloc
          .add(TabChanged(index: userCurrentTab, contactList: contactdata));
      }   
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    watchlistBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Strings.name.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          actions: [
            const ThemeSelector(),
            IconButton(
                key: const ValueKey('filterIcon'),
                onPressed: () {
                  sortBtnAction(
                      context,
                      watchlistBloc,
                      contactdata.sublist(
                          userCurrentTab * 25, (userCurrentTab + 1) * 25),
                      sortingTypeAppliedAtTabIndex[userCurrentTab]);
                },
                icon: const Icon(Icons.sort_by_alpha))
          ],
          title: const Text(
            Strings.title,
          ),
          
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 4.0,
            indicatorColor: Colors.blue,
            key: const ValueKey('tab'),
            tabs: Strings.name,
            // tabs: [
            
            //   for (int i = 1; i <= 4; i++)
            //     Tab(
            //         child: (Text(
            //              'Contact $i',
            //     style: const TextStyle(fontSize: 12, color: Colors.white),
            //       key: ValueKey("tab$i"),
            //     ))
                                  
            //     ),
            // ],
            
            // onTap: (index) => {
            
            //   userCurrentTab = index,
            //   watchlistBloc
            //       .add(TabChanged(index: index, contactList: contactdata))
            // },
            
          ),
        ),
        body: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state is Contactblocloading) {
              return const Text(Strings.loading);
            } else if (state is ContactFetchData) {
              contactdata = state.contacts;
              if (contactdata == []) {
                return const Text(Strings.loading);
              } else {
                return CategoriesScreen(
                  data: contactdata.sublist(0, 25),
                );
              }
            } else if (state is ContactTabData) {
              if (state.sortingType != null) {
                sortingTypeAppliedAtTabIndex[userCurrentTab] =
                    state.sortingType!;
              }

              return CategoriesScreen(data: state.contacts);
            } else if (state is ContactError) {
              return const Text(Strings.unknownError);
            } else {
              return const Text(Strings.unknownError);
            }
          },
        ),
      ),
    );
  }

  void sortBtnAction(BuildContext context, WatchlistBloc watchlistBloc,
      List<Contact> conatctListAtParticularTab, String? sortingType) {
    showModalBottomSheet(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.22),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return BlocProvider(
          create: (context) => SortingBlocBloc(watchlistBloc),
          child: SafeArea(
            child: SortingSheet(
              contactList: conatctListAtParticularTab,
              selectedSortedType: sortingType ?? "",
            ),
          ),
        );
      },
    );
  }
}
