import 'package:chapa_mekedonia/Data/RemoteDataSource/Payment/payment_remote_data_source.dart';
import 'package:chapa_mekedonia/Data/RemoteDataSource/Payment/payment_remote_data_source_impl.dart';
import 'package:chapa_mekedonia/Data/Repository/Payment/payment_repo_impl.dart';
import 'package:chapa_mekedonia/Domain/Repositories/Payment/payment_repo.dart';
import 'package:chapa_mekedonia/Domain/Usecases/PaymentUsecases/get_payment_url_usecase.dart';
import 'package:chapa_mekedonia/Domain/Usecases/PaymentUsecases/verify_payment_usecase.dart';
import 'package:chapa_mekedonia/Presentation/bloc/PaymentUrlBloc/payment_url_bloc.dart';
import 'package:chapa_mekedonia/Presentation/bloc/VerifyPaymentBloc/verify_payment_bloc.dart';
import 'package:chapa_mekedonia/Service/HttpService/http_service_impl.dart';
import 'package:get_it/get_it.dart';

import 'Service/HttpService/http_service.dart';

final GetIt container = GetIt.instance;

void setUp() {
  // services
  container.registerLazySingleton<HttpService>(() => HttpServiceImpl());
  container<HttpService>().init();

  // data sources
  container.registerLazySingleton<PaymentRemoteDataSource>(
      () => PaymentRemoteDataSourceImpl(container()));

  // repositories

  container
      .registerLazySingleton<PaymentRepo>(() => PaymentRepoImpl(container()));

  //usecases
  container.registerLazySingleton(() => GetPaymentUrlUsecase(container()));
  container.registerLazySingleton(() => VerifyPaymentUsecase(container()));

  // state managements
  container.registerFactory(() => PaymentUrlBloc(container()));
  container.registerFactory(() => VerifyPaymentBloc(container()));
}
