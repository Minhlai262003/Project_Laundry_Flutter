import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/data/models/service_registed.dart';
import 'package:project_laundry_flutter/src/domain/manager/user_manager.dart';
import 'package:project_laundry_flutter/src/domain/usecases/banner_service_laundry/create_laundry_service_usecase.dart';
import 'package:project_laundry_flutter/src/presentation/modules/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

@Service(lifetime: ServiceLifetime.transient)
class CreatingLaundryServiceBloc extends BaseBloc {
  final CreateLaundryServiceUsecase _createLaundrySericeUseCase;
  final UserManager _userManager;

  CreatingLaundryServiceBloc(
      this._createLaundrySericeUseCase, this._userManager);

  late List<XFile> _listFileImages;
  late int _quantity;
  late String _note;
  late String? _userId;
  final _listImagesBehaviorSubject = BehaviorSubject<List<XFile>>.seeded([]);
  Stream<List<XFile>> get listImagesStream => _listImagesBehaviorSubject.stream;

  final _noteBehaviorSubject = BehaviorSubject<String>.seeded("");
  Stream<String> get noteBehaviorStream => _noteBehaviorSubject.stream;
  final _quantityBehaviorSubject = BehaviorSubject<int>.seeded(1);
  Stream<int> get quantityStream => _quantityBehaviorSubject.stream;

  initCreatingLaundryServiceBlocc(
      {int quantity = 1,
      String note = "",
      List<XFile> listFileImages = const []}) async {
    await getInforUser();
    // _pickupDateBehaviorSubject.add(_pickupDate);
    _listFileImages = List.from(listFileImages);
    _quantity = quantity;
    _note = note;
    _listImagesBehaviorSubject.add(_listFileImages);
    _quantityBehaviorSubject.add(_quantity);
    _noteBehaviorSubject.add(_note);
  }

  void updateListImages(List<XFile> listImages) {
    _listFileImages.clear();
    _listFileImages.addAll(listImages);
    _listImagesBehaviorSubject.add(_listFileImages);
  }

  void updateNote(String note) {
    _note = note;
    _noteBehaviorSubject.add(_note);
  }

  void updateQuantity(int quantity) {
    _quantity = quantity;
    _quantityBehaviorSubject.add(_quantity);
  }

  void plusQuantity() {
    _quantity++;
    _quantityBehaviorSubject.add(_quantity);
    print(_quantity);
  }

  void minusQuantity() {
    if (_quantity > 1) {
      _quantity--;
      _quantityBehaviorSubject.add(_quantity);
      print(_quantity);
    }
  }
  // void updatePickUpDate(DateTime deliveryDate) {
  //   _pickupDate = deliveryDate;
  //   print(_pickupDate);
  // }

  Future<String?> getInforUser() async {
    _userId = await _userManager.getIdUser();
    return _userId;
  }

  Future<String?> createService(LaundryService service) async {
    var createdDate = DateTime.now();

    if (_userId != null) {
      var serviceRegisted = ServiceRegisted(
          serviceId: null,
          service: service,
          userId: _userId!,
          quantity: _quantity,
          listImages: _listFileImages.map((value) => value.path).toList(),
          note: _note,
          createdDate: createdDate);
      return await _createLaundrySericeUseCase.execute(serviceRegisted);
    }
    return null;
  }

  @override
  void dispose() {}
}
