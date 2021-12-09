import 'package:bloc/bloc.dart';
import 'package:gherkins/model/contact_data_model.dart';
import 'package:gherkins/src/string.dart';

import 'package:meta/meta.dart';

import '../../watchlist_bloc.dart';
import '../../watchlist_event.dart';

part 'sorting_bloc_event.dart';
part 'sorting_bloc_state.dart';

class SortingBlocBloc extends Bloc<SortingBlocEvent, SortingBlocState> {
  WatchlistBloc watchlistBloc;

  SortingBlocBloc(this.watchlistBloc) : super(SortingBlocInitial()) {
    on<SortingBlocEvent>((event, emit) {
      if (event is SortingTypeButtonClickEvent) {
        emit(SortingTypeButtonClickState(event.btnText));
      } else if (event is SortingDoneBtnActionEvent) {
        sortContacts(event);
      }
    });
  }
  void sortContacts(SortingDoneBtnActionEvent event) {
    if (event.btnText == Strings.alphabetDecending) {
      event.contactList
          .sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
    } else if (event.btnText == Strings.alphabetAscending) {
      event.contactList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else if (event.btnText == Strings.numericAscending) {
      event.contactList
          .sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
    } else if (event.btnText == Strings.numericDecending) {
      event.contactList
          .sort((a, b) => int.parse(b.id).compareTo(int.parse(a.id)));
    }
    watchlistBloc.add(SortContactEvent(
        listContacts: event.contactList, sortingStr: event.btnText));
  }
}
