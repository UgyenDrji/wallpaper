
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallpaper/controller/user.dart';
import 'package:wallpaper/model/user_model.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person Details",style: TextStyle(fontSize: 25,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xffa2d2ff),
      ),
      backgroundColor: Color(0xffa2d2ff),
      body: FutureBuilder<List<UserModel>>(
        future: UserServices().fetchUserData(5),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title:
                  Text("${user.title} ${user.firstName} ${user.lastName}"),
                );
              },
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),

    );
  }
}