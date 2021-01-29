import 'package:app_anuncio/anuncio/anuncio.dart';
import 'package:app_anuncio/tela/cadastroAnuncio_tela.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class TelaInicio extends StatefulWidget {
  TelaInicio({Key key}) : super(key: key);

  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  List<Anuncio> _lista = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Venda de livros"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: _lista.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_lista[index].toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment(-0.9, 0.0),
                child: Icon(
                  CommunityMaterialIcons.trash_can,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            onDismissed: (direction) => {
              setState(() {
                _lista.removeAt(index);
              })
            },

            child: ListTile(
              leading: Icon(CommunityMaterialIcons.book_open_page_variant, size: 50,),
              title: Text(
                _lista[index].anuncioTit,
                style: TextStyle(

                    fontSize: 30,
                    decoration: _lista[index].done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),

              subtitle: Text(_lista[index].anuncioDes + "                " "                                        "+
                  "Preço:"+" " + _lista[index].anuncioPre.toString(), style: TextStyle(fontSize: 18),),
              trailing: Icon(//CommunityMaterialIcons.cart, size: 50,
                _lista[index].done ? Icons.done : Icons.shopping_cart, size: 50,
                color: _lista[index].done ? Colors.green : Colors.grey,),
              onTap: () {
                setState(() {
                  if (_lista[index].done) {
                    _lista[index].done = false;
                  } else {
                    _lista[index].done = true;
                  }
                });
              },
              onLongPress: () async {

                Anuncio editAnuncio = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CadastroTela(anuncio: _lista[index])));
                if (editAnuncio != null) {
                  setState(() {
                    _lista[index] = editAnuncio;
                  });
                }

              },
            ),

          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          Anuncio anuncioPro = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => CadastroTela()));
          //Task tarefa = await Navigator.pushNamed(context, "/cadastro");
          if (anuncioPro != null) {
            setState(() {
              _lista.add(anuncioPro);
            });
          }
        },
      ),
    );
  }
}
