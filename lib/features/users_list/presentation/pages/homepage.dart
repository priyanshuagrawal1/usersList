import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/core/di/injector.dart';
import 'package:newproject/features/users_list/presentation/bloc/getdata_bloc.dart';
import 'package:newproject/features/users_list/presentation/pages/users_details_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GetdataBloc? bloc;
  @override
  void initState() {
    super.initState();
    bloc = Injector.resolve<GetdataBloc>();
    bloc!.add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Users'), actions: [
          TextButton(
            child: const Text('ddd'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const UsersDetailsScreen(),
              ));
            },
          )
        ]),
        body: BlocBuilder<GetdataBloc, GetdataState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is GetInitialData) {
                if (state.users == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final users = state.users!;
                return GridView.builder(
                    itemCount: users.isNotEmpty ? users.length : 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (ctx, index) {
                      if (users.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(3),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    UsersDetailsScreen.routeName,
                                    arguments: index);
                              },
                              child: GridTile(
                                footer: GridTileBar(
                                  backgroundColor: Colors.black54,
                                  title: Text('${users[index].name}'),
                                ),
                                child: Image.network(
                                  users[index].picture!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
