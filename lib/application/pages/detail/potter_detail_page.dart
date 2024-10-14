import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_clean/application/core/constant/app_constants.dart';
import 'package:harry_potter_clean/application/pages/detail/potter_detail_cubit.dart';

import '../../../injection.dart';

class PotterDetailPageWrapperProvider extends StatelessWidget {
  final String id;

  const PotterDetailPageWrapperProvider({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PotterDetailCubit>()..getCharacterDetail(id),
      child: PotterDetailPage(),
    );
  }
}

class PotterDetailPage extends StatelessWidget {
  const PotterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: BlocBuilder<PotterDetailCubit, PotterDetailState>(
        builder: (context, state) {
          if (state is PotterDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PotterDetailLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xff543310),
                    height: 50,
                    child: Center(
                        child: Text(state.character.name ?? "", style: const TextStyle(color: Colors.white, fontFamily: "DancingScript",fontWeight: FontWeight.w700, fontSize: 30),)),
                  ),
                  const SizedBox(height: 30,),
                  CachedNetworkImage(
                    imageUrl: state.character.image ?? "",
                    width: 100,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image.network(AppConstants.errorImageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                    child: Container(
                      color: Color(0xffE2DAD6),
                      child: Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              const Text('Species', style: TextStyle(fontFamily: "DancingScript",fontSize: 20),textAlign: TextAlign.center,),
                              Text(state.character.species ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 20, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                            ]),
                            TableRow(
                                children: [
                                  Center(child: const Text('Gender', style: TextStyle(fontFamily: "DancingScript",fontSize: 20,),textAlign: TextAlign.center,)),
                                  state.character.gender == "male" ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("assets/icons/male.png", width: 20, height: 20,),
                                    ),
                                  ) : Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("assets/icons/male.png",width: 20,height: 20,),
                                    ),
                                  ),
                                ]),
                            TableRow(children: [
                              const Text('House', style: TextStyle(fontFamily: "DancingScript",fontSize: 20),textAlign: TextAlign.center,),
                              Text(state.character.house ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 20, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                            ]),
                            TableRow(children: [
                              const Text('Date of Birth', style: TextStyle(fontFamily: "DancingScript",fontSize: 20,),textAlign: TextAlign.center,),
                              Center(child: Text(state.character.dateOfBirth ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 15, fontWeight: FontWeight.w600),textAlign: TextAlign.center,)),
                            ]),
                            TableRow(children: [
                              const Text('Year of Birth', style: TextStyle(fontFamily: "DancingScript",fontSize: 20,),textAlign: TextAlign.center,),
                              Center(child: Text({state.character.yearOfBirth ?? 0}.toString(), style: const TextStyle(fontFamily: "DancingScript",fontSize: 15, fontWeight: FontWeight.w600),textAlign: TextAlign.center,)),
                            ]),
                            TableRow(children: [
                              const Text('Ancestry', style: TextStyle(fontFamily: "DancingScript",fontSize: 20, ),textAlign: TextAlign.center,),
                              Text(state.character.ancestry ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 20, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                            ]),
                            TableRow(children: [
                              const Text('Eye Color', style: TextStyle(fontFamily: "DancingScript",fontSize: 20, ),textAlign: TextAlign.center,),
                              Text(state.character.eyeColour ?? "", style: TextStyle(fontFamily: "DancingScript",fontSize: 20, fontWeight: FontWeight.w600, color: getTextColorForEyeColor(state.character.eyeColour ?? "")),textAlign: TextAlign.center,),
                            ]),
                            TableRow(children: [
                              const Text('Hair Color', style: TextStyle(fontFamily: "DancingScript",fontSize: 20,),textAlign: TextAlign.center,),
                              Text(state.character.hairColour ?? "", style: TextStyle(fontFamily: "DancingScript", fontSize: 20, fontWeight: FontWeight.w600, color: getTextColorForHairColor(state.character.hairColour ?? "")),textAlign: TextAlign.center,),
                            ]),
                            TableRow(children: [
                              const Text('Wand', style: TextStyle(fontFamily: "DancingScript",fontSize: 20,),textAlign: TextAlign.center,),
                              Column(
                                children: [
                                  Text(state.character.wand.wood ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 20, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                                  Text(state.character.wand.core ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 20, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                                  Center(child: Text(state.character.wand.length.toString() ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 15, fontWeight: FontWeight.w600),textAlign: TextAlign.center,)),
                                ],
                              ),
                            ]),
                            TableRow(children: [
                              const Text('Patronus', style: TextStyle(fontFamily: "DancingScript",fontSize: 20,),textAlign: TextAlign.center,),
                              Text(state.character.patronus ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 20, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                            ]),
                            TableRow(children: [
                              Center(child: const Text('Hogwarts Students', style: TextStyle(fontFamily: "DancingScript",fontSize: 20, ),textAlign: TextAlign.center,)),
                              state.character.hogwartsStudent
                                  ? (state.character.hogwartsStudent == true
                                  ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/ok.png", width: 20, height: 20,),
                                ),
                              )
                                  : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/no.png", width: 20, height: 20,),
                                ),
                              ))
                                  : Text("No data"),
                            ]),
                            TableRow(children: [
                              Center(child: const Text('Hogwarts Staff', style: TextStyle(fontFamily: "DancingScript",fontSize: 20),textAlign: TextAlign.center,)),
                              state.character.hogwartsStaff
                                  ? (state.character.hogwartsStaff == true
                                  ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/ok.png", width: 20, height: 20,),
                                ),
                              )
                                  : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/no.png", width: 20, height: 20,),
                                ),
                              ))
                                  : Text("No data"),
                            ]),
                            TableRow(children: [
                              const Text('Actor', style: TextStyle(fontFamily: "DancingScript",fontSize: 20, ),textAlign: TextAlign.center,),
                              Text(state.character.actor ?? "", style: const TextStyle(fontFamily: "DancingScript",fontSize: 20, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                            ]),
                            TableRow(children: [
                              Center(child: const Text('Alive', style: TextStyle(fontFamily: "DancingScript",fontSize: 20),textAlign: TextAlign.center,)),
                              state.character.alive
                                  ? (state.character.alive == true
                                  ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/ok.png", width: 20, height: 20,),
                                ),
                              )
                                  : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/no.png", width: 20, height: 20,),
                                ),
                              ))
                                  : Text("No data"),
                            ]),

                          ]),
                    ),
                  ),

                ],
              ),
            );
          } else if (state is PotterStateDetailError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
  Color getTextColorForEyeColor(String? eyeColor) {
    switch (eyeColor?.toLowerCase()) {
      case 'blue':
        return Color(0xff6482AD);
      case 'green':
        return Color(0xff508D4E);
      case 'brown':
        return Colors.brown;
      case 'grey':
        return Colors.grey;
      case 'yellow':
        return Color(0xffF4CE14);
      case 'red':
        return Color(0xffB43F3F);
      default:
        return Color(0xff03346E);
    }
  }
  Color getTextColorForHairColor(String? eyeColor) {
    switch (eyeColor?.toLowerCase()) {
      case 'blue':
        return Color(0xff6482AD);
      case 'green':
        return Color(0xff508D4E);
      case 'brown':
        return Colors.brown;
      case 'grey':
        return Colors.grey;
      case 'blonde':
        return Color(0xffF4CE14);
      case 'silver':
        return Color(0xff758694);
      case 'red':
        return Color(0xffB43F3F);
      case 'hazel':
        return Color(0xff40534C);
      default:
        return Color(0xff03346E);
    }
  }
}
