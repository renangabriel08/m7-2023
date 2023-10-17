import 'package:http/http.dart' as http;
import 'package:m7/widgets/myToast.dart';

class Api {
  static salvarAvaliacao(String local, String desc, String nt) async {
    try {
      var ur = Uri.parse('https://apieuvounatrip.azurewebsites.net/api/Locais');
      final req = await http.post(
        ur,
        headers: {'Content-Type': 'application/json'},
        body: {
          "nomeLocal": local,
          "latitude": "string",
          "longitude": "string",
          "descricao": desc,
          "tipoLocal": "string",
          "enderecoLocal": "string",
          "avaliacao": nt,
          "custoMedio": '0'
        },
      );
      if (req.statusCode == 201) {
        return true;
      } else {
        MyToast.gerarToast('Erro ao enviar avaliação');
        print(req.statusCode);
        return false;
      }
    } catch (e) {
      MyToast.gerarToast('Erro ao enviar avaliação');
      print('erro: $e');
      return false;
    }
  }
}
