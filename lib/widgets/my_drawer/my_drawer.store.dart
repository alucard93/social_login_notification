import 'package:mobx/mobx.dart';
part 'my_drawer.store.g.dart';

class MyDrawerStore = _MyDrawerStoreBase with _$MyDrawerStore;

abstract class _MyDrawerStoreBase with Store {
  @observable
  int selectedMenu = 1;

  @action
  void setSelectMenu(int menu) {
    selectedMenu = menu;
  }
}
