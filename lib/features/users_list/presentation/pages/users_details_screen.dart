import 'package:flutter/material.dart';
import 'package:newproject/core/di/injector.dart';
import 'package:newproject/features/users_list/domain/entities/user.dart';
import 'package:newproject/features/users_list/presentation/bloc/getdata_bloc.dart';

class UsersDetailsScreen extends StatelessWidget {
  const UsersDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/users-details-screen';

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    final bloc = Injector.resolve<GetdataBloc>();
    final User? user = bloc.state.users![index];
    return Container(
      // width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(user!.name!),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            // physics: BouncingScrollPhysics(),
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    user.picture!,
                    fit: BoxFit.fill,
                    scale: 1.3,
                  ),
                ),
              ),
              Text(
                user.name!,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              TextButton.icon(
                icon: const Icon(Icons.room),
                onPressed: () {},
                label: Text(user.country!),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Username: ${user.username!}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('UserId: ${user.id ?? 'no ID'}',
                        style: const TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('Email: ${user.email!}',
                        style: const TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('Gender: ${user.gender}',
                        style: const TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('Dob: ${user.dob}',
                        style: const TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
