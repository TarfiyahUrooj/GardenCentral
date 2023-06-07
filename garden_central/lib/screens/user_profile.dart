import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden_central/bloc/user/user_bloc.dart';

//import 'bloc/user_bloc.dart';

/*class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
    final UserBloc2 = BlocProvider.of<UserBloc>(context);
    UserBloc2.add(GetUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            final users = state.users;

            if (users.length == 0) {
              return Center(child: Text("There are no users"));
            }

            return ListView.builder(
                itemCount: users.length,
                itemBuilder: ((context, index) {
                  final user = users[index].data() as Map<String, dynamic>?;
                  final name = user?['name'];
                  final email = user?['email'];
                  final password = user?['password'];

                  return Card(
                    child: ListTile(
                      title: Text(
                        name,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        email,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                }));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}*/
