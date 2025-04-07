import 'dart:async';

import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/models/banner_laundry_service.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/data/models/service_registed.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';
import 'package:project_laundry_flutter/src/domain/manager/user_manager.dart';
import 'package:project_laundry_flutter/src/domain/usecases/auth/logout_usecase.dart';
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/fetch_banner_usecase.dart';
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/fetch_history_service_data_usecase.dart';
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/fetch_popular_laudry_service_data_usecase.dart';
import 'package:project_laundry_flutter/src/domain/usecases/users/fetch_user_data_usecase.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

@Service(lifetime: ServiceLifetime.transient)
class MainBloc extends BaseBloc {
  final UserManager _userManager;
  final LogoutUsecase _logoutUsecase;
  final FetchBannerUsecase _fetchBannerUsecase;
  final FetchPopularLaudryServiceDataUsecase
      _fetchPopularLaudryServiceDataUsecase;
  final FetchUserDataUsecase _fetchUserDataUsecase;
  final FetchHistoryServiceDataUsecase _fetchHistoryServiceDataUsecase;

  MainBloc(
    this._userManager,
    this._logoutUsecase,
    this._fetchBannerUsecase,
    this._fetchUserDataUsecase,
    this._fetchPopularLaudryServiceDataUsecase,
    this._fetchHistoryServiceDataUsecase,
  );

  final _userStreamSubject = BehaviorSubject<User?>.seeded(null);
  Stream<User?> get userStream => _userStreamSubject.stream;

  final _sizeCartServiceBehaviorSubject = BehaviorSubject<int>();
  Stream<int> get sizeCartServiceStream =>
      _sizeCartServiceBehaviorSubject.stream;

  final _listBannerLaundryBehaviorSubject =
      BehaviorSubject<List<BannerLaundryService>?>();
  Stream<List<BannerLaundryService>?> get listBannerLaundryServiceStream =>
      _listBannerLaundryBehaviorSubject.stream;

  final _listPopularLaundryServiceBehaviorSubject =
      BehaviorSubject<List<LaundryService>?>();
  Stream<List<LaundryService>?> get listPopularLaundryServiceStream =>
      _listPopularLaundryServiceBehaviorSubject.stream;
  final _listLaundryServiceBehaviorSubject =
      BehaviorSubject<List<LaundryService>?>();
  Stream<List<LaundryService>?> get listLaundryServiceStream =>
      _listLaundryServiceBehaviorSubject.stream;
  final _listHistoryServiceBehaviorSubject =
      BehaviorSubject<List<ServiceRegisted>?>();
  Stream<List<ServiceRegisted>?> get listHistoryServiceStream =>
      _listHistoryServiceBehaviorSubject.stream;
  List<BannerLaundryService>? listBanners;
  List<LaundryService>? listPopularLaundryServices;
  List<LaundryService>? listLaundryServices;
  List<ServiceRegisted>? listHistoryServices;

  initMainBloc() async {
    await Future.wait([
      _fetchBannerData(),
      _fetchLaundryServiceData(),
      _fetchPopularLaundryServiceData(),
    ]);
    _listBannerLaundryBehaviorSubject.add(listBanners);
    _listPopularLaundryServiceBehaviorSubject.add(listPopularLaundryServices);
    _listLaundryServiceBehaviorSubject.add(listLaundryServices);
    String? idUser = await _userManager.getIdUser();
    if (idUser != null) {
      User? user = await _fetchUserDataUsecase.execute(idUser);
      _userStreamSubject.add(user);
      await _fetchHistoryServiceData(idUser);
      _listHistoryServiceBehaviorSubject.add(listHistoryServices);
    }
  }

  Future logout() async {
    await _userManager.removeIdUser();
    await _logoutUsecase.execute();
    _userStreamSubject.add(null);
  }

  Future<void> _fetchBannerData() async {
    listBanners = await _fetchBannerUsecase.execute();
  }

  Future<void> _fetchLaundryServiceData() async {
    listLaundryServices = await _fetchPopularLaudryServiceDataUsecase.execute();
  }

  Future<void> _fetchPopularLaundryServiceData() async {
    listPopularLaundryServices =
        await _fetchPopularLaudryServiceDataUsecase.execute();
  }

  Future<void> _fetchHistoryServiceData(String userId) async {
    listHistoryServices = await _fetchHistoryServiceDataUsecase.execute(userId);
  }

  @override
  void dispose() {
    _userStreamSubject.close();
    _listBannerLaundryBehaviorSubject.close();
    _listLaundryServiceBehaviorSubject.close();
    _listPopularLaundryServiceBehaviorSubject.close();
    _listHistoryServiceBehaviorSubject.close();
  }
}
