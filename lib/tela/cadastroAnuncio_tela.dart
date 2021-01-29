import 'package:app_anuncio/anuncio/anuncio.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';


class CadastroTela extends StatefulWidget {
  Anuncio anuncio;

  CadastroTela({this.anuncio});

  @override
  _CadastroTelaState createState() => _CadastroTelaState();
}

class _CadastroTelaState extends State<CadastroTela> {
  final TextEditingController _textControllerTit = TextEditingController();
  final TextEditingController _textControllerDes = TextEditingController();
  final TextEditingController _textControllerPre = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.anuncio != null) {
      _textControllerTit.text = widget.anuncio.anuncioTit;
      _textControllerDes.text = widget.anuncio.anuncioDes;
      _textControllerPre.text = widget.anuncio.anuncioPre.toString();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de livros"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: TextFormField(
                  controller: _textControllerTit,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Titulo do livro",
                    labelStyle: TextStyle(fontSize: 18),

                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Obrigatório";
                    }
                  },

                ),
              ),
             Container(
               padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: TextFormField(
                controller: _textControllerDes,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: "Descrição do livro",
                  labelStyle: TextStyle(fontSize: 18),

                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Obrigatório";
                  }
                },
              ),
    ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: TextFormField(
                  controller: _textControllerPre,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Preço do livro",
                    labelStyle: TextStyle(fontSize: 18),

                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Obrigatório";
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      height: 40,
                      width: 60,
                      child: RaisedButton(
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.lightGreen,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                           var newAnuncio = Anuncio(anuncioTit: _textControllerTit.text, anuncioDes: _textControllerDes.text, anuncioPre: double.parse(_textControllerPre.text));

                            if (widget.anuncio != null) {

                              widget.anuncio.anuncioTit = _textControllerTit.text;
                              widget.anuncio.anuncioDes = _textControllerDes.text;
                              widget.anuncio.anuncioPre = double.parse(_textControllerPre.text);

                            }
                            Navigator.pop(context, newAnuncio);

                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      height: 40,
                      width: 60,
                      child: RaisedButton(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.redAccent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
