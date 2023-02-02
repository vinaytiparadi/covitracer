import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Services/stats_services.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: searchController,
                  onChanged: (value){
                    setState(() {

                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Country',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  )),
            ),
            Expanded(
                child: FutureBuilder(
                    future: statsServices.countriesListApi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            // itemCount: snapshot.data!.length,
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                  baseColor: Colors.green.shade500,
                                  highlightColor: Colors.green.shade100,
                                  child: Column(
                                    children: [
                                      ListTile(
                                          title: Container(height: 10, width: 89,color: Colors.green,),
                                          subtitle: Container(height: 10, width: 89,color: Colors.green,),
                                          leading: Container(height: 50, width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(50.0)
                                          ),))
                                    ],
                                  ));
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {

                              String name = snapshot.data![index]['country'];
                              if(searchController.text.isEmpty){
                                return Column(
                                  children: [
                                    ListTile(
                                        title: Text(snapshot.data![index]
                                        ['country']
                                            .toString()),
                                        subtitle: Text(snapshot.data![index]
                                        ['cases']
                                            .toString()),
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              snapshot.data![index]['countryInfo']
                                              ['flag']),
                                          radius: 25,
                                        ))
                                  ],
                                );
                              }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                                return Column(
                                  children: [
                                    ListTile(
                                        title: Text(snapshot.data![index]
                                        ['country']
                                            .toString()),
                                        subtitle: Text(snapshot.data![index]
                                        ['cases']
                                            .toString()),
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              snapshot.data![index]['countryInfo']
                                              ['flag']),
                                          radius: 25,
                                        ))
                                  ],
                                );
                              }else{
                                return Container();
                              }


                            });
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
