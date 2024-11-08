part of 'main_page_bloc.dart';

abstract class MainPageEvent {}

class LoadMainPage extends MainPageEvent {
  LoadMainPage({
    this.completer,
  });
  final Completer? completer;
}
