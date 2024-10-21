import 'package:coffee_oasis/Core/NetWork/database_services.dart';
import 'package:coffee_oasis/Core/NetWork/upload_file_service.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(
      StorageService(getIt.get<FirebaseStorage>()));
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  getIt.registerSingleton<OwnerRepoImpl>(
      OwnerRepoImpl(getIt.get<OwnerRemoteDataSource>()));
  getIt.registerSingleton<OwnerRemoteDataSource>(
      OwnerRemoteDataSource(getIt.get<DatabaseServices>()));
  getIt.registerSingleton<DatabaseServices>(DatabaseServices());
}
