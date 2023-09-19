import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key? key, this.title}) : super(key: key);
  const MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ----------------------------------------------------------------- Variáveis
  int _counter = 0;
  bool _isHidden = true;
  double weight = 0.0; // dever ser inicializado
  double height = 0.0;
  int imc = 0;
  String result = 'Erro';

  // com TextEditingController conseguimos "pegar" uma entrada de texto
  // controlador para nome
  TextEditingController nameController = TextEditingController();
  // controlador para senha
  TextEditingController passController = TextEditingController();
  //controlador sexo
  TextEditingController sexController = TextEditingController();
  //controlador CPF
  TextEditingController cpfController = TextEditingController();
  //controlador para altura
  TextEditingController heightController = TextEditingController();
  // controlador para peso
  TextEditingController weightController = TextEditingController();
  // ------------------------------------------------------------- Fim Variáveis
  // ------------------------------------------------------------------- Funções
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  // função criada para alterar o estado da visibilidade da senha: escondida ou visível
  // acostume-se a colocar os nomes de variáveis e funções em ingles. O Flutter agradece.
  void _changePassVisibility() {
    if (_isHidden == true) {
      _isHidden = false;
      print('_isHidden = false. Mostra Senha.');
    } else {
      _isHidden = true;
      print('_isHidden = true. Esconde Senha.');
    }
  }
  void disposeName() {
    // Limpa controller de nome quando o widget é removido da árvore de widgets
    nameController.dispose();
    super.dispose();
  }
  void disposPassword() {
    // Limpa controller de senha quando o widget é removido da árvore de widgets
    passController.dispose();
    super.dispose();
  }
  void disposeSex() {
    // Limpa controller de senha quando o widget é removido da árvore de widgets
    sexController.dispose();
    super.dispose();
  }
  void disposeCPF() {
    // Limpa controller de senha quando o widget é removido da árvore de widgets
    cpfController.dispose();
    super.dispose();
  }
  void disposWeight() {
    // Limpa controller de senha quando o widget é removido da árvore de widgets
    weightController.dispose();
    super.dispose();
  }
  void disposeHeight() {
    // Limpa controller de senha quando o widget é removido da árvore de widgets
    heightController.dispose();
    super.dispose();
  }
  // função que é executada ao pressionar o icone check para nome
  void _printName() {
    final text = nameController.text;
    print('$text (${text.characters.length}) caracteres');
  }
  // função que é executada ao pressionar o icone check para senha
  void _printPassword() {
    final text = passController.text;
    print('$text (${text.characters.length}) caracteres');
  }
  // função que é executada ao pressionar o icone check para sex
  void _printSex() {
    final text = sexController.text;
    print('$text (${text.characters.length}) caracteres');
  }
  // função que é executada ao pressionar o icone check para sex
  void _printCPF() {
    final text = cpfController.text;
    print('$text (${text.characters.length}) caracteres');
  }
  // função que é executada ao pressionar o icone check para peso
  void _printWeight() {
    final text = weightController.text;
    print(
        'String capturada com TextEdittingController ao pressionar o icone de confirmação do peso: $text (${text.characters.length}) caracteres');

    weight = double.parse(weightController.text);
    print(
        'Valor double capturado com TextEdittingController ao pressionar o icone de confirmação do peso: ${weight.toStringAsPrecision(3)}');
  }
  // função que é executada ao pressionar o icone check para altura
  void _printHeight() {
    final text = heightController.text;
    print(
        'String capturada com TextEdittingController ao pressionar o icone de confirmação do peso: $text (${text.characters.length}) caracteres');
    height = double.parse(heightController.text);
    print(
        'Valor double capturado com TextEdittingController ao pressionar o icone de confirmação do peso: ${height.toStringAsPrecision(4)}');
  }
  // --------------------------------------------------------------- Fim Funções
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //------------------------------------------------------------------AppBar
        appBar: AppBar(
          backgroundColor: const Color(0xFF156879),
          title: const Text(
            "Calculadora IMC",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true, // centraliza o texto da AppBar
          shape: const RoundedRectangleBorder(
              // arredonda a App bar
              borderRadius: BorderRadiusDirectional.vertical(
                  bottom: Radius.circular(60))),
        ),
        //------------------------------------------------------------- Fim AppBar
        /*Container(                        // encapsula a coluna em um Container para colocar imagem
          decoration: const BoxDecoration(      // cria uma “decoração” para a imagem
              image: DecorationImage(
                image: AssetImage('assets/images/rest_main.jpg') , // coloca o caminho da imagem
                fit: BoxFit.cover,
              )
          ),
        ),*/
        body: Container(
          decoration: const BoxDecoration(
            // cria uma “decoração” para a imagem
              image: DecorationImage(
                image: AssetImage('assets/images/backgrounds_mobile.png'),
                // coloca o caminho da imagem
                fit: BoxFit.cover,)
          ),
          child: SingleChildScrollView(
          child: Column(
            // define uma coluna no centro da tela
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: !_isHidden,
                child: Column(children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Seu IMC é:",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100.0,
                          height: 100.0,
                          child: Text('$imc',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              )),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Resultado: \n$result',
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF156879),
                            disabledForegroundColor:
                                Colors.grey.withOpacity(0.38),
                          ),
                          onPressed: () {
                            // setState chama o Build e recontroi a tela do app atualizando estatus
                            setState(() {
                              _changePassVisibility();
                            });
                          },
                          child: const Text('Retormar'),
                        ),
                      ]),
                ]),
              ),
              Visibility(
                visible: _isHidden,
                child: Column(
                  children: [
                    // o Widget Padding NOME afasta a linha do TextField 16 pixels das margens esquerda e direita
                    Padding(
                      // afasta a linha do TextField 16 pixels das margens esquerda e direita
                      padding: const EdgeInsets.all(16.0),

                      //---------------------------------------------- TextFieldParaNome
                      child: TextField(
                        // conecte o controlador Nome para o texto ao TextField
                        controller: nameController,
                        //----------------------------------------------------Decoration
                        // coloca uma decoração no campo de texto: retângulo para entrada de dados
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          // nome do retângulo
                          //  tamanho da fonte  e cor para o texto da decoração
                          labelStyle: const TextStyle(
                              fontSize: 22,
                              color: Color(0XFF156879),
                              fontWeight: FontWeight.normal),
                          hintText: "Digite seu nome",
                          // campo de dica
                          hintStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),

                          // icone de confirmação
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.face,
                              color: Color(0XFF156879),
                            ),
                            onPressed:
                                _printName, // quando este icone é pressionado, imprime o nome
                          ),

                          // icone de cancelamento
                          suffixIcon: IconButton(
                            onPressed: nameController.clear,
                            icon: const Icon(Icons.clear,
                                color: Color(0XFF156879)),
                          ),

                          border: OutlineInputBorder(
                            // arrendonda a borda da caixa de entrada
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        //------------------------------------------------ FimDecoration

                        // você pode escolher vários tipos de teclado: numérico, email, data, telefone etc
                        keyboardType: TextInputType.text,
                        // estilo do texto a ser digitado
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0XFF36635E),
                            fontWeight: FontWeight.bold),

                        onChanged: (text) {
                          print(
                              'Texto de nome capturado com onChanged: $text (${text.characters.length})');
                        },
                      ),
                      //------------------------------------------ Fim TextFieldParaNome
                    ),
                    // o Widget Padding SENHA afasta a linha do TextField 16 pixels das margens esquerda e direita
                    Padding(
                      padding: const EdgeInsets.all(16.0),

                      //--------------------------------------------- TextField Para Senha
                      child: TextField(
                        // conecte o controlador para a SENHA ao TextField
                        controller: passController,
                        // controlador para senha
                        //----------------------------------------------------Decoration
                        // coloca uma decoração no campo de texto: retângulo para entrada de dados
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          // nome do retângulo
                          //  tamanho da fonte  e cor para o texto da decoração
                          labelStyle: const TextStyle(
                              fontSize: 22,
                              color: Color(0xFF156879),
                              fontWeight: FontWeight.normal),

                          hintText: "Digite sua Senha",
                          // campo de dica
                          // estilo e tamanho da fonte de texto para a dica
                          hintStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),

                          // icone da decoração
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.check_circle,
                                color: Color(0xFF156879)),
                            onPressed:
                                _printPassword, // quando este icone é pressionado, imprime o nome
                          ),

                          suffixIcon: IconButton(
                            onPressed: passController.clear,
                            icon: const Icon(Icons.clear,
                                color: Color(0xFF156879)),
                          ),

                          // arrendonda a borda da caixa de entrada
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        //--------------------------------------------------------------

                        // você pode escolher vários tipos de teclado: numérico, email, data, telefone etc
                        keyboardType: TextInputType.text,
                        // estilo do texto a ser digitado
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF156879),
                            fontWeight: FontWeight.bold),

                        // esconde o texto ao digitar senha/muda o caracter que substitui o texto digitado
                        obscureText: _isHidden,
                        obscuringCharacter: '*',

                        onChanged: (text) {
                          print(
                              'Texto de senha capturado com onChanged: $text (${text.characters.length})');
                        },
                      ),
                      //----------------------------------------- Fim TextFieldParaSenha
                    ),
                    // o Widget Padding SEXO afasta a linha do TextField 16 pixels das margens esquerda e direita
                    Padding(
                      padding: const EdgeInsets.all(16.0),

                      //--------------------------------------------- TextFieldParaPeso
                      child: TextField(
                        // conecte o controlador para a SEXO ao TextField
                        controller: sexController,
                        // controlador para peso

                        //----------------------------------------------------Decoration
                        // coloca uma decoração no campo de texto: retângulo para entrada de dados
                        decoration: InputDecoration(
                          labelText: 'Sexo',
                          // nome do retângulo
                          //  tamanho da fonte  e cor para o texto da decoração
                          labelStyle: const TextStyle(
                              fontSize: 22,
                              color: Color(0xFF156879),
                              fontWeight: FontWeight.normal),

                          hintText: "Informe seu Sexo",
                          // campo de dica
                          // estilo e tamanho da fonte de texto para a dica
                          hintStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),

                          // icone da decoração
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.question_mark,
                                color: Color(0xFF156879)),
                            onPressed:
                                _printSex, // quando este icone é pressionado, imprime o sexo
                          ),

                          suffixIcon: IconButton(
                            onPressed: sexController.clear,
                            icon: const Icon(Icons.clear,
                                color: Color(0xFF156879)),
                          ),

                          // arrendonda a borda da caixa de entrada
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        //--------------------------------------------------------------

                        // você pode escolher vários tipos de teclado: numérico, email, data, telefone etc
                        keyboardType: TextInputType.text,
                        // estilo do texto a ser digitado
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF156879),
                            fontWeight: FontWeight.bold),
                      ),
                      //----------------------------------------- Fim TextFieldParaPeso
                    ),
                    // o Widget Padding CPF afasta a linha do TextField 16 pixels das margens esquerda e direita
                    Padding(
                      padding: const EdgeInsets.all(16.0),

                      //--------------------------------------------- TextFieldParaPeso
                      child: TextField(
                        // conecte o controlador para a CPF ao TextField
                        controller: cpfController,
                        // controlador para peso

                        //----------------------------------------------------Decoration
                        // coloca uma decoração no campo de texto: retângulo para entrada de dados
                        decoration: InputDecoration(
                          labelText: 'CPF',
                          // nome do retângulo
                          //  tamanho da fonte  e cor para o texto da decoração
                          labelStyle: const TextStyle(
                              fontSize: 22,
                              color: Color(0xFF156879),
                              fontWeight: FontWeight.normal),

                          hintText: "Digite o seu CPF",
                          // campo de dica
                          // estilo e tamanho da fonte de texto para a dica
                          hintStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),

                          // icone da decoração
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.fingerprint,
                                color: Color(0xFF156879)),
                            onPressed:
                                _printCPF, // quando este icone é pressionado, imprime o nome
                          ),

                          suffixIcon: IconButton(
                            onPressed: cpfController.clear,
                            icon: const Icon(Icons.clear,
                                color: Color(0xFF156879)),
                          ),

                          // arrendonda a borda da caixa de entrada
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        //--------------------------------------------------------------

                        // você pode escolher vários tipos de teclado: numérico, email, data, telefone etc
                        keyboardType: TextInputType.number,
                        // estilo do texto a ser digitado
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF156879),
                            fontWeight: FontWeight.bold),
                      ),
                      //----------------------------------------- Fim TextFieldParaPeso
                    ),
                    // o Widget Padding PESO afasta a linha do TextField 16 pixels das margens esquerda e direita
                    Padding(
                      padding: const EdgeInsets.all(16.0),

                      //--------------------------------------------- TextFieldParaPeso
                      child: TextField(
                        // conecte o controlador para a senha ao TextField
                        controller: weightController,
                        // controlador para peso

                        //----------------------------------------------------Decoration
                        // coloca uma decoração no campo de texto: retângulo para entrada de dados
                        decoration: InputDecoration(
                          labelText: 'Peso',
                          // nome do retângulo
                          //  tamanho da fonte  e cor para o texto da decoração
                          labelStyle: const TextStyle(
                              fontSize: 22,
                              color: Color(0xFF156879),
                              fontWeight: FontWeight.normal),

                          hintText: "Digite o seu Peso",
                          // campo de dica
                          // estilo e tamanho da fonte de texto para a dica
                          hintStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),

                          // icone da decoração
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.scale,
                                color: Color(0xFF156879)),
                            onPressed:
                                _printWeight, // quando este icone é pressionado, imprime o nome
                          ),

                          suffixIcon: IconButton(
                            onPressed: weightController.clear,
                            icon: const Icon(Icons.clear,
                                color: Color(0xFF156879)),
                          ),

                          // arrendonda a borda da caixa de entrada
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        //--------------------------------------------------------------

                        // você pode escolher vários tipos de teclado: numérico, email, data, telefone etc
                        keyboardType: TextInputType.number,
                        // estilo do texto a ser digitado
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF156879),
                            fontWeight: FontWeight.bold),

                        // esconde o texto ao digitar senha/muda o caracter que substitui o texto digitado
                        onChanged: (text) {
                          weight = double.parse(text);
                          print(
                              'Texto de peso capturado com onChanged: $text (${text.characters.length})');
                        },
                      ),
                      //----------------------------------------- Fim TextFieldParaPeso
                    ),
                    // o Widget Padding ALTURA afasta a linha do TextField 16 pixels das margens esquerda e direita
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      //--------------------------------------------- TextFieldParaPeso
                      child: TextField(
                        autofocus: true,
                        // conecte o controlador para a altura ao TextField
                        controller: heightController,
                        // controlador para peso

                        //----------------------------------------------------Decoration
                        // coloca uma decoração no campo de texto: retângulo para entrada de dados
                        decoration: InputDecoration(
                          labelText: 'Altura',
                          // nome do retângulo
                          //  tamanho da fonte  e cor para o texto da decoração
                          labelStyle: const TextStyle(
                              fontSize: 22,
                              color: Color(0xFF156879),
                              fontWeight: FontWeight.normal),

                          hintText: "Digite a sua Altura. EX: 1.80",
                          // campo de dica
                          // estilo e tamanho da fonte de texto para a dica
                          hintStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),

                          // icone da decoração
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.straighten,
                                color: Color(0xFF156879)),
                            onPressed:
                                _printHeight, // quando este icone é pressionado, imprime o nome
                          ),

                          suffixIcon: IconButton(
                            onPressed: heightController.clear,
                            icon: const Icon(Icons.clear,
                                color: Color(0xFF156879)),
                          ),

                          // arrendonda a borda da caixa de entrada
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        //--------------------------------------------------------------

                        // você pode escolher vários tipos de teclado: numérico, email, data, telefone etc
                        keyboardType: TextInputType.number,
                        // estilo do texto a ser digitado
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF156879),
                            fontWeight: FontWeight.bold),

                        // esconde o texto ao digitar senha/muda o caracter que substitui o texto digitado
                        onChanged: (text) {
                          height = double.parse(text);
                          print(
                              'Texto de peso capturado com onChanged: $text (${text.characters.length})');
                        },
                      ),
                      //----------------------------------------- Fim TextFieldParaPeso
                    ),

                    // botão para mostrar/esconder senha: altera o estado da propriedade obscureText
                    TextButton(
                      child: Text('Mostrar / Ocultar Senha'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      ),
                      onPressed: () {
                        // setState chama o Build e reconstroi a tela do app atualizando estatus
                        setState(() {
                          _changePassVisibility();
                        });
                      },
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF156879),
                        disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      ),
                      onPressed: () {
                        // setState chama o Build e reconstroi a tela do app atualizando status
                        setState(() {
                          imc = ((weight) / (height * height)).round();
                          if (imc < 18) {
                            result = 'Abaixo do Peso';
                          } else if (imc <= 24) {
                            result = 'Normal';
                          } else if (imc <= 29) {
                            result = 'Sobrepeso';
                          } else if (imc <= 34) {
                            result = 'Obesidade';
                          } else if (imc <= 40) {
                            result = 'Obesidade Grau 2';
                          } else if (imc > 40) {
                            result = 'Obesidade Mórbida';
                          }
                          _changePassVisibility();
                        });
                      },
                      child: const Text('Calcular'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  // coloca um espaço vazio entre TextField e Text
                  height: 60),
            ],
          ),
        )
        )// define o corpo da tela principal
        );
  }
}
