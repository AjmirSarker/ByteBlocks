import 'package:get/get.dart';

class BottomNavbarController  extends GetxController {
int _selectedIndex=0;
int get selectedIndex => _selectedIndex;
void changeSelectedIndex(int selectedIndex){
  _selectedIndex = selectedIndex;
  update();
}

void  backToHome(){
changeSelectedIndex(0) ;

}
}