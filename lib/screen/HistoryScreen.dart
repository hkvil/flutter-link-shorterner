import 'package:flutter/material.dart';
import 'package:learn_provider_1/component/LinkItem.dart';
import 'package:learn_provider_1/database/DatabaseService.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<DatabaseService>(context).getHistory(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = snapshot.data![index];
                  return LinkItem(
                      longUrl: data['longUrl'], shortUrl: data['shortUrl']);
                });
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
              child: Text("NO DATA"),
            );
          }
        });
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //       future: Provider.of<DatabaseService>(context).getHistory(),
  //       builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
  //         if(snapshot.hasData){
  //           ListView.builder(
  //           itemCount: snapshot.data?.length ?? 0 ,
  //           itemBuilder: ((context, index) {
  //             Map<String,dynamic> data = snapshot.data![index];
  //             LinkItem(longUrl: data['longUrl'],shortUrl: data['shortUrl']);
              
  //           })
  //           )
            
  //         }else{

  //         }}