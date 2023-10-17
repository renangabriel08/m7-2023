import 'package:firebase_storage/firebase_storage.dart';
import 'package:m7/widgets/myToast.dart';

class FirebaseController {
  static salvarImg(img) async {
    try {
      String imgName = img.path.split('/').last;
      await FirebaseStorage.instance.ref("images/$imgName").putFile(img);
      return true;
    } catch (e) {
      print(e);
      MyToast.gerarToast('Erro ao salvar imagem');
      return false;
    }
  }
}
