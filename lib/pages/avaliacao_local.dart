import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m7/controllers/firebase.dart';
import 'package:m7/controllers/validator.dart';
import 'package:m7/styles/cores.dart';
import 'package:m7/styles/fonts.dart';
import 'package:m7/widgets/myToast.dart';

class Avaliacao extends StatefulWidget {
  const Avaliacao({super.key});

  @override
  State<Avaliacao> createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  final _formKey = GlobalKey<FormState>();

  String? local;
  String? cidade;
  String? usuario;
  String? nota;
  String? desc;

  List<Color> cores = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  List estrelaSelecionada = [false, false, false, false, false];

  var image;

  void tirarFoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      setState(() {
        this.image = image;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * .15,
                width: width,
                decoration: BoxDecoration(
                  color: Cores.verdeEscuro,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Faça sua avaliação do local',
                    style: TextStyle(
                      fontFamily: Fonts.fonte,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (height) - (height * .15),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: width * .3,
                                  height: (45 * 3) + 20,
                                  color: Colors.amber,
                                  child: image != null
                                      ? Image.file(
                                          File(image.path),
                                          fit: BoxFit.cover,
                                        )
                                      : Container(),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: (width * .3) / 8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        onPressed: () => tirarFoto(
                                          ImageSource.camera,
                                        ),
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => tirarFoto(
                                          ImageSource.gallery,
                                        ),
                                        icon: const Icon(
                                          Icons.upload,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: width * .6,
                                  height: 45,
                                  child: TextFormField(
                                    onChanged: (value) => local = value,
                                    validator: (value) =>
                                        Validator.validar(value),
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      label: Text(
                                        'Nome local',
                                        style: TextStyle(
                                          fontFamily: Fonts.fonte,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: width * .6,
                                  height: 45,
                                  child: TextFormField(
                                    onChanged: (value) => cidade = value,
                                    validator: (value) =>
                                        Validator.validar(value),
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      label: Text(
                                        'Cidade',
                                        style: TextStyle(
                                          fontFamily: Fonts.fonte,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: width * .6,
                                  height: 45,
                                  child: TextFormField(
                                    onChanged: (value) => usuario = value,
                                    validator: (value) =>
                                        Validator.validar(value),
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      label: Text(
                                        'Usuário',
                                        style: TextStyle(
                                          fontFamily: Fonts.fonte,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < cores.length; i++)
                              IconButton(
                                onPressed: () {
                                  int ultNum = 0;
                                  setState(() {
                                    cores[0] = Colors.yellow;
                                    for (int e = 0; e < i; e++) {
                                      cores[e + 1] = Colors.yellow;
                                      estrelaSelecionada[e + 1] = true;
                                      ultNum = e + 1;
                                    }
                                    ultNum++;
                                    while (ultNum < cores.length) {
                                      cores[ultNum] = Colors.grey;
                                      estrelaSelecionada[ultNum] = false;
                                      ultNum++;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.star,
                                  size: 30,
                                ),
                                color: cores[i],
                              ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Deixe seu comentário',
                                  style: TextStyle(
                                    fontFamily: Fonts.fonte,
                                    fontSize: 20,
                                    color: Cores.verdeEscuro,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width,
                              child: TextFormField(
                                maxLines: 10,
                                onChanged: (value) => desc = value,
                                validator: (value) => Validator.validar(value),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    '/lista',
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Cores.verdeEscuro,
                                    ),
                                    fixedSize: Size(width * .4, 30),
                                  ),
                                  child: Text(
                                    'Voltar',
                                    style: TextStyle(
                                      fontFamily: Fonts.fonte,
                                      color: Cores.verdeEscuro,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    int nota = 0;
                                    if (_formKey.currentState!.validate()) {
                                      for (int i = 0;
                                          i < estrelaSelecionada.length;
                                          i++) {
                                        if (estrelaSelecionada[i]) {
                                          nota++;
                                        }
                                      }

                                      DatabaseReference ref = FirebaseDatabase
                                          .instance
                                          .ref("avaliacoes");

                                      await ref.set({
                                        "local": local,
                                        "cidade": cidade,
                                        "nome": usuario,
                                        "nota": nota + 1,
                                        "imagem": image.path,
                                      });
                                      bool res2 =
                                          await FirebaseController.salvarImg(
                                        File(image.path),
                                      );
                                      if (res2) {
                                        MyToast.gerarToast(
                                          'Avaliação enviada com sucesso',
                                        );
                                        Navigator.pushNamed(context, '/lista');
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(width * .4, 30),
                                    backgroundColor: Cores.verdeEscuro,
                                  ),
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(
                                      fontFamily: Fonts.fonte,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
