import 'package:mobx/mobx.dart';
part 'my_drawer.store.g.dart';

// MobX requires the generated store base class to remain private.
// ignore: library_private_types_in_public_api
class MyDrawerStore = _MyDrawerStoreBase with _$MyDrawerStore;

abstract class _MyDrawerStoreBase with Store {
  @observable
  int selectedMenu = 1;

  @action
  void setSelectMenu(int menu) {
    selectedMenu = menu;
  }
}
