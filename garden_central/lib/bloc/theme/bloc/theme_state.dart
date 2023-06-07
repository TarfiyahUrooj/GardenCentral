part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool switchValue;
  const ThemeState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required super.switchValue});

  //const ThemeInitial({required super.switchValue});
}
