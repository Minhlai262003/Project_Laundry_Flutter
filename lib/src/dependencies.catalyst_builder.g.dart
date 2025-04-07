// ignore_for_file: prefer_relative_imports, public_member_api_docs, implementation_imports
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:catalyst_builder/catalyst_builder.dart' as _i1;
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/auth/auth_firebase_datasource.dart'
    as _i2;
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/laundry_service/banner_firebase_datasource.dart'
    as _i3;
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/laundry_service/history_service_firebase_datasource.dart'
    as _i26;
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/laundry_service/laundry_service_firebase_datasource.dart'
    as _i4;
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/users/users_firebase_datasource.dart'
    as _i5;
import 'package:project_laundry_flutter/src/data/repositories/auth/auth_repository.dart'
    as _i6;
import 'package:project_laundry_flutter/src/data/repositories/laundry_service/banner_repository.dart'
    as _i7;
import 'package:project_laundry_flutter/src/data/repositories/laundry_service/history_service_repository.dart'
    as _i27;
import 'package:project_laundry_flutter/src/data/repositories/laundry_service/laundry_service_repository.dart'
    as _i8;
import 'package:project_laundry_flutter/src/data/repositories/users/users_repository.dart'
    as _i9;
import 'package:project_laundry_flutter/src/domain/manager/id_service_manager.dart'
    as _i10;
import 'package:project_laundry_flutter/src/domain/manager/user_manager.dart'
    as _i11;
import 'package:project_laundry_flutter/src/domain/usecases/auth/login_email_usecase.dart'
    as _i12;
import 'package:project_laundry_flutter/src/domain/usecases/auth/login_facebook_usercase.dart'
    as _i13;
import 'package:project_laundry_flutter/src/domain/usecases/auth/login_github_usecase.dart'
    as _i14;
import 'package:project_laundry_flutter/src/domain/usecases/auth/login_google_usecase.dart'
    as _i15;
import 'package:project_laundry_flutter/src/domain/usecases/auth/logout_usecase.dart'
    as _i16;
import 'package:project_laundry_flutter/src/domain/usecases/auth/register_email_usecase.dart'
    as _i17;
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/create_laundry_service_usecase.dart'
    as _i28;
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/fetch_banner_usecase.dart'
    as _i18;
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/fetch_history_service_data_usecase.dart'
    as _i29;
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/fetch_laudry_service_data_usecase.dart'
    as _i19;
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/fetch_popular_laudry_service_data_usecase.dart'
    as _i20;
import 'package:project_laundry_flutter/src/domain/usecases/users/fetch_user_data_usecase.dart'
    as _i21;
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/creating_laundry_service_bloc.dart'
    as _i25;
import 'package:project_laundry_flutter/src/presentation/modules/login/login_bloc.dart'
    as _i22;
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart'
    as _i23;
import 'package:project_laundry_flutter/src/presentation/modules/register/register_bloc.dart'
    as _i24;

class DefaultServiceProvider extends _i1.ServiceProvider
    implements _i1.ServiceRegistry, _i1.EnhanceableProvider {
  DefaultServiceProvider() {
    _knownServices.addAll(<Type, _i1.ServiceDescriptor>{
      _i2.AuthFirebaseDatasourceImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i2.AuthFirebaseDatasource),
        () => _i2.AuthFirebaseDatasourceImpl(
          _resolveOrGetParameter(
            _i2.AuthFirebaseDatasourceImpl,
            '_auth',
          ),
          _resolveOrGetParameter(
            _i2.AuthFirebaseDatasourceImpl,
            '_firestore',
          ),
          _resolveOrGetParameter(
            _i2.AuthFirebaseDatasourceImpl,
            '_facebookAuth',
          ),
          _resolveOrGetParameter(
            _i2.AuthFirebaseDatasourceImpl,
            '_googleSignIn',
          ),
          _resolveOrGetParameter(
            _i2.AuthFirebaseDatasourceImpl,
            '_githubSignInParams',
          ),
        ),
      ),
      _i3.BannerFirebaseDatasourceImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i3.BannerFirebaseDatasource),
        () => _i3.BannerFirebaseDatasourceImpl(_resolveOrGetParameter(
          _i3.BannerFirebaseDatasourceImpl,
          '_firestore',
        )),
      ),
      _i4.LaundryServiceFirebaseDatasourceImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i4.LaundryServiceFirebaseDatasource),
        () => _i4.LaundryServiceFirebaseDatasourceImpl(_resolveOrGetParameter(
          _i4.LaundryServiceFirebaseDatasourceImpl,
          '_firestore',
        )),
      ),
      _i5.UserFirebaseDatasourceImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i5.UsersFirebaseDatasource),
        () => _i5.UserFirebaseDatasourceImpl(_resolveOrGetParameter(
          _i5.UserFirebaseDatasourceImpl,
          '_firestore',
        )),
      ),
      _i6.AuthRepositoryImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i6.AuthRepository),
        () => _i6.AuthRepositoryImpl(_resolveOrGetParameter(
          _i6.AuthRepositoryImpl,
          '_authFirebaseDatasource',
        )),
      ),
      _i7.BannerRepositoryImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i7.BannerRepository),
        () => _i7.BannerRepositoryImpl(_resolveOrGetParameter(
          _i7.BannerRepositoryImpl,
          '_bannerFirebaseDatasource',
        )),
      ),
      _i8.LaundryServiceRepositoryImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i8.LaundryServiceRepository),
        () => _i8.LaundryServiceRepositoryImpl(_resolveOrGetParameter(
          _i8.LaundryServiceRepositoryImpl,
          '_laundryServiceFirebaseDatasource',
        )),
      ),
      _i9.UsersRepositoryImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i9.UsersRepository),
        () => _i9.UsersRepositoryImpl(_resolveOrGetParameter(
          _i9.UsersRepositoryImpl,
          '_userFirebaseDatasource',
        )),
      ),
      _i10.IdServiceManagerImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i10.IdServiceManager),
        () => _i10.IdServiceManagerImpl(),
      ),
      _i11.UserManagerImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i11.UserManager),
        () => _i11.UserManagerImpl(),
      ),
      _i12.LoginEmailUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i12.LoginEmailUsecase(_resolveOrGetParameter(
          _i12.LoginEmailUsecase,
          '_authRepository',
        )),
      ),
      _i13.LoginFacebookUsercase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i13.LoginFacebookUsercase(_resolveOrGetParameter(
          _i13.LoginFacebookUsercase,
          '_authRepository',
        )),
      ),
      _i14.LoginGithubUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i14.LoginGithubUsecase(_resolveOrGetParameter(
          _i14.LoginGithubUsecase,
          '_authRepository',
        )),
      ),
      _i15.LoginGoogleUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i15.LoginGoogleUsecase(_resolveOrGetParameter(
          _i15.LoginGoogleUsecase,
          '_authRepository',
        )),
      ),
      _i16.LogoutUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i16.LogoutUsecase(_resolveOrGetParameter(
          _i16.LogoutUsecase,
          '_authRepository',
        )),
      ),
      _i17.RegisterEmailUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i17.RegisterEmailUsecase(_resolveOrGetParameter(
          _i17.RegisterEmailUsecase,
          '_authRepository',
        )),
      ),
      _i18.FetchBannerUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i18.FetchBannerUsecase(_resolveOrGetParameter(
          _i18.FetchBannerUsecase,
          '_bannerRepository',
        )),
      ),
      _i19.FetchLaudryServiceDataUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i19.FetchLaudryServiceDataUsecase(_resolveOrGetParameter(
          _i19.FetchLaudryServiceDataUsecase,
          '_laundryServiceRepository',
        )),
      ),
      _i20.FetchPopularLaudryServiceDataUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i20.FetchPopularLaudryServiceDataUsecase(_resolveOrGetParameter(
          _i20.FetchPopularLaudryServiceDataUsecase,
          '_laundryServiceRepository',
        )),
      ),
      _i21.FetchUserDataUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i21.FetchUserDataUsecase(_resolveOrGetParameter(
          _i21.FetchUserDataUsecase,
          '_usersRepository',
        )),
      ),
      _i22.LoginBloc: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i22.LoginBloc(
          _resolveOrGetParameter(
            _i22.LoginBloc,
            '_loginEmailUseCase',
          ),
          _resolveOrGetParameter(
            _i22.LoginBloc,
            '_userManager',
          ),
          _resolveOrGetParameter(
            _i22.LoginBloc,
            '_loginGoogleUsecase',
          ),
          _resolveOrGetParameter(
            _i22.LoginBloc,
            '_loginGithubUsecase',
          ),
          _resolveOrGetParameter(
            _i22.LoginBloc,
            '_loginFacebookUsercase',
          ),
        ),
      ),
      _i23.MainBloc: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i23.MainBloc(
          _resolveOrGetParameter(
            _i23.MainBloc,
            '_userManager',
          ),
          _resolveOrGetParameter(
            _i23.MainBloc,
            '_logoutUsecase',
          ),
          _resolveOrGetParameter(
            _i23.MainBloc,
            '_fetchBannerUsecase',
          ),
          _resolveOrGetParameter(
            _i23.MainBloc,
            '_fetchUserDataUsecase',
          ),
          _resolveOrGetParameter(
            _i23.MainBloc,
            '_fetchPopularLaudryServiceDataUsecase',
          ),
          _resolveOrGetParameter(
            _i23.MainBloc,
            '_fetchHistoryServiceDataUsecase',
          ),
        ),
      ),
      _i24.RegisterBloc: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i24.RegisterBloc(_resolveOrGetParameter(
          _i24.RegisterBloc,
          '_registerEmailUsecase',
        )),
      ),
      _i25.CreatingLaundryServiceBloc: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i25.CreatingLaundryServiceBloc(
          _resolveOrGetParameter(
            _i25.CreatingLaundryServiceBloc,
            '_createLaundrySericeUseCase',
          ),
          _resolveOrGetParameter(
            _i25.CreatingLaundryServiceBloc,
            '_userManager',
          ),
        ),
      ),
      _i26.HistoryServiceFirebaseDatasourceImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i26.HistoryServiceFirebaseDatasource),
        () => _i26.HistoryServiceFirebaseDatasourceImpl(_resolveOrGetParameter(
          _i26.HistoryServiceFirebaseDatasourceImpl,
          '_firestore',
        )),
      ),
      _i27.HistoryServiceRepositoryImpl: _i1.ServiceDescriptor(
        const _i1.Service(exposeAs: _i27.HistoryServiceRepository),
        () => _i27.HistoryServiceRepositoryImpl(_resolveOrGetParameter(
          _i27.HistoryServiceRepositoryImpl,
          '_historyDatasource',
        )),
      ),
      _i28.CreateLaundryServiceUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i28.CreateLaundryServiceUsecase(_resolveOrGetParameter(
          _i28.CreateLaundryServiceUsecase,
          '_historyServiceRepository',
        )),
      ),
      _i29.FetchHistoryServiceDataUsecase: _i1.ServiceDescriptor(
        const _i1.Service(lifetime: _i1.ServiceLifetime.transient),
        () => _i29.FetchHistoryServiceDataUsecase(_resolveOrGetParameter(
          _i29.FetchHistoryServiceDataUsecase,
          '_historyServiceRepository',
        )),
      ),
    });
    _exposeMap.addAll(<Type, Type>{
      _i2.AuthFirebaseDatasource: _i2.AuthFirebaseDatasourceImpl,
      _i3.BannerFirebaseDatasource: _i3.BannerFirebaseDatasourceImpl,
      _i4.LaundryServiceFirebaseDatasource:
          _i4.LaundryServiceFirebaseDatasourceImpl,
      _i5.UsersFirebaseDatasource: _i5.UserFirebaseDatasourceImpl,
      _i6.AuthRepository: _i6.AuthRepositoryImpl,
      _i7.BannerRepository: _i7.BannerRepositoryImpl,
      _i8.LaundryServiceRepository: _i8.LaundryServiceRepositoryImpl,
      _i9.UsersRepository: _i9.UsersRepositoryImpl,
      _i10.IdServiceManager: _i10.IdServiceManagerImpl,
      _i11.UserManager: _i11.UserManagerImpl,
      _i26.HistoryServiceFirebaseDatasource:
          _i26.HistoryServiceFirebaseDatasourceImpl,
      _i27.HistoryServiceRepository: _i27.HistoryServiceRepositoryImpl,
    });
    _servicesByTag.addAll(<Symbol, List<Type>>{});
  }

  var _booted = false;

  final _knownServices = <Type, _i1.ServiceDescriptor>{};

  final _exposeMap = <Type, Type>{};

  var _serviceInstances = <Type, dynamic>{};

  final _servicesByTag = <Symbol, List<Type>>{};

  @override
  T? tryResolve<T>() {
    return _tryResolveInternal<T>(T);
  }

  T? _tryResolveInternal<T>(Type t) {
    _ensureBoot();
    var exposedType = _exposeMap[t];
    exposedType ??= t;
    if (_serviceInstances.containsKey(exposedType)) {
      return (_serviceInstances[exposedType] as T?);
    }
    var descriptor = _knownServices[exposedType];
    if (descriptor == null) {
      return null;
    }
    var instance = descriptor.produce();
    if (descriptor.service.lifetime == _i1.ServiceLifetime.singleton) {
      _serviceInstances[exposedType] = instance;
    }
    return (instance as T?);
  }

  @override
  T resolve<T>() {
    _ensureBoot();
    var resolved = tryResolve<T>();
    if (resolved != null) {
      return resolved;
    }
    throw _i1.ServiceNotFoundException(T);
  }

  @override
  List<dynamic> resolveByTag(Symbol tag) {
    var services = <dynamic>[];
    if (!_servicesByTag.containsKey(tag)) {
      return services;
    }
    for (var svc in _servicesByTag[tag]!) {
      services.add((_tryResolveInternal(svc) as dynamic));
    }
    return services;
  }

  T? _tryResolveOrGetParameter<T>(String b) {
    var resolvedService = tryResolve<T>();
    if (resolvedService != null) {
      return resolvedService;
    }
    if (parameters[b] is T) {
      return (parameters[b] as T);
    }
    return null;
  }

  T _resolveOrGetParameter<T>(
    Type requiredBy,
    String param, [
    String? parameter,
  ]) {
    var resolved = _tryResolveOrGetParameter<T>(parameter ?? param);
    if (resolved == null) {
      throw _i1.DependencyNotFoundException(
        requiredBy,
        param,
        _i1.ServiceNotFoundException(T),
      );
    }
    return resolved;
  }

  @override
  void boot() {
    if (_booted) {
      throw const _i1.ProviderAlreadyBootedException();
    }
    _booted = true;
  }

  void _ensureBoot() {
    if (_booted == false) {
      throw const _i1.ProviderNotBootedException();
    }
  }

  @override
  bool has<T>([Type? type]) {
    var lookupType = type ?? T;
    return _knownServices.containsKey(_exposeMap[lookupType] ?? lookupType);
  }

  @override
  void register<T>(
    T Function(_i1.ServiceProvider) factory, [
    _i1.Service service = const _i1.Service(),
  ]) {
    _registerInternal(
      T,
      factory,
      service,
    );
  }

  void _registerInternal<T>(
    Type tReal,
    T Function(_i1.ServiceProvider) factory, [
    _i1.Service service = const _i1.Service(),
  ]) {
    _knownServices[tReal] = _i1.ServiceDescriptor(
      service,
      () => factory(this),
    );
    if (service.exposeAs != null) {
      _exposeMap[service.exposeAs!] = tReal;
    }
  }

  @override
  _i1.ServiceProvider enhance({
    List<_i1.LazyServiceDescriptor> services =
        const <_i1.LazyServiceDescriptor>[],
    Map<String, dynamic> parameters = const <String, dynamic>{},
  }) {
    _ensureBoot();
    var enhanced = DefaultServiceProvider();
    enhanced._serviceInstances = _serviceInstances;
    enhanced._knownServices.addAll(Map.fromEntries(_knownServices.entries
        .where((el) => !enhanced._knownServices.containsKey(el.key))));
    enhanced._exposeMap.addAll(_exposeMap);
    for (var service in services) {
      enhanced._registerInternal(
        service.returnType,
        service.factory,
        service.service,
      );
    }
    enhanced.parameters.addAll(this.parameters);
    enhanced.parameters.addAll(parameters);
    enhanced._booted = true;
    return enhanced;
  }
}
