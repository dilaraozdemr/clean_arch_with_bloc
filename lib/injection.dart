import 'package:get_it/get_it.dart';
import 'package:harry_potter_clean/application/pages/detail/potter_detail_cubit.dart';
import 'package:harry_potter_clean/application/pages/home/potter_home_cubit.dart';
import 'package:harry_potter_clean/data/datasources/potter_remote_datasources.dart';
import 'package:http/http.dart' as http;
import 'package:harry_potter_clean/domain/usecases/potter_usecases.dart';

import 'data/repositories/potter_repo_impl.dart';
import 'domain/repositories/potter_repo.dart';

final sl = GetIt.I;

Future<void> init() async{
  sl.registerFactory(()=> PotterHomeCubit(potterUsecases: sl()));

  sl.registerFactory(()=> PotterDetailCubit(potterUsecase: sl()));

  sl.registerFactory(()=> PotterUsecase(potterRepo: sl()));

  sl.registerLazySingleton<PotterRepo>(() => PotterRepoImpl(potterRemoteDataSource: sl()));
  sl.registerFactory<PotterRemoteDatasource>(()=>PotterRemoteDatasourceImpl(client: sl()));


  sl.registerFactory(()=> http.Client());
}