// import 'package:bloc/bloc.dart';
// import 'package:garden_central/screens/login/user_repo.dart';
// import 'package:meta/meta.dart';

// part 'user_event.dart';
// part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc() : super(UserInitial()) {
//     on<GetUserDataEvent>((event, emit) async {
//       emit(LoadingState());
//       try {
//         final User = await UserRepository().GetUser();
//         emit(LoadedState(User));
//       } catch (e) {}
//     });
//   }
// }
