import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_clean/application/pages/home/potter_home_cubit.dart';

import '../../../injection.dart';
import '../detail/potter_detail_cubit.dart';
import '../detail/potter_detail_page.dart';
import '../widget/error_message.dart';

class PotterHomePageWrapperProvider extends StatelessWidget {
  const PotterHomePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PotterHomeCubit>()..potterRequested(),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const SizedBox(height: 10),
            const Text(
              "Harry Potter",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff973131), width: 5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: BlocBuilder<PotterHomeCubit, PotterHomeState>(
                    builder: (context, state) {
                      if (state is PotterHomeInitial) {
                        return const Text("Your Potter is waiting for you");
                      } else if (state is PotterHomeLoading) {
                        const CircularProgressIndicator(
                          color: Colors.purple,
                        );
                      } else if (state is PotterHomeLoaded) {
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.character.length,
                              itemBuilder: (context, index) {
                                var model = state.character[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => PotterDetailPageWrapperProvider(id: model.id),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black),
                                      ),
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: model.image,
                                            width: 40,
                                            placeholder: (context, url) => const CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => Image.network(
                                              "https://static.wikia.nocookie.net/harrypotter/images/a/ae/Hogwartscrest.png/revision/latest?cb=20110806202805",
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            model.name,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        );
                      } else if (state is PotterStateError) {
                        return ErrorMessage(message: state.message);
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
