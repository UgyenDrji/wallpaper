
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallpaper/controller/user.dart';
import 'package:wallpaper/goggle.dart';
import 'package:wallpaper/model/people_model.dart';
class PeopleHome extends StatefulWidget {
  const PeopleHome({super.key});

  @override
  State<PeopleHome> createState() => _PeopleHomeState();
}

class _PeopleHomeState extends State<PeopleHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person Details",style: TextStyle(fontSize: 25,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xffa2d2ff),
      ),
      backgroundColor: Color(0xffa2d2ff),
      body: FutureBuilder<PeopleModel?>(
        future: UserServices().fetchPeopleData(20),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          } else {
            return  GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context,index){
                final person = snapshot.data!.results![index];
                final location = person.location;
                final locationDetails =
                    '${location?.city}, ${location?.state}, ${location?.country}';
                return Card(
                  elevation: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.blue
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(image: NetworkImage(person.picture?.thumbnail??''),fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${person.name?.first} ${person.name?.last}',style: myStyle(18,Colors.black,FontWeight.bold),),
                              Row(
                                children: [
                                  Icon(Icons.email_rounded,color: Colors.blue,size: 23,),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.3,
                                    child: Text(
                                      person.email != null && person.email!.length > 20
                                          ? '${person.email!.substring(0, 20)}...'
                                          : person.email ?? 'No email',
                                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.blue,size: 23,),
                                  Container(
                                      width: MediaQuery.of(context).size.width*0.3,
                                      child: Text(locationDetails)),
                                ],
                              ),
                              Gap(5),
                              Row(
                                children: [
                                  Icon(Icons.call_sharp,color: Colors.green,size: 23,),
                                  Gap(10),
                                  Text("${person.phone ??''}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}