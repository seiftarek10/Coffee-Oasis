import 'package:coffee_oasis/Core/NetWork/database_services.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  getIt.registerSingleton<StorageService>(
      StorageService(getIt.get<FirebaseStorage>()));
  getIt.registerSingleton<DatabaseServices>(DatabaseServices());
  getIt.registerSingleton<OwnerRemoteDataSource>(
      OwnerRemoteDataSource(getIt.get<DatabaseServices>()));
  getIt.registerSingleton<OwnerRepoImpl>(
      OwnerRepoImpl(getIt.get<OwnerRemoteDataSource>()));

}
