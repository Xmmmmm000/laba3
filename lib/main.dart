import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class ExampleButton extends StatelessWidget {
  final String text;
  const ExampleButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 20),);
  }
}

class ExampleTextField extends StatelessWidget {
  final String HintText;
  final int MAXLength;
  const ExampleTextField({Key? key, required this.HintText, required this.MAXLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.lock),
          hintText: HintText
      ),
      maxLength: MAXLength,
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(

                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.network("https://kartinkis.cdnbro.com/posts/41198457-narisovannye-krossovki-1.jpg"),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  width: 200,
                  height: 10,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box_sharp),
                        border: OutlineInputBorder(),
                        hintText: 'Введите логин:'
                    ),
                    maxLength: 30,
                  ),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                    width: 200,
                    height: 10,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: ExampleTextField(HintText: 'Введите пароль:', MAXLength: 10)
                )
            ),
            Expanded(
                child: Container(

                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                      child: ExampleButton(text: 'Войти'),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login())
                        );
                      }
                  ),
                )
            ),
            Expanded(child: Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                    child: ExampleButton(text: 'Зарегистрироваться'),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration())
                      );
                    }
                )
            )
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text('Приложение для авторизации'),),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: productlist.length,
          itemBuilder: (BuildContext context, int index) {

            return ListProduct(name_product: productlist[index].name, photo_path: productlist[index].pathphoto, desciption_product: productlist[index].description, price_prpduct: productlist[index].price, id_product: productlist[index].id);
          }
      ),
      appBar: AppBar(title: Text('Кроссовки'),),
    );

  }
}

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Регистрация'
      ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only( left: 10, right: 10),
                  margin: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.center,
                  child: TextField(style: TextStyle(fontSize: 20, color: Colors.black
                  ),
                    decoration: InputDecoration(hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        prefixIcon: Icon(Icons.mail),
                        hintText: 'Электронная почта',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3)
                        )
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 8),
                  child: TextField(style: TextStyle(fontSize: 20, color: Colors.black
                  ),
                    decoration: InputDecoration(hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        prefixIcon: Icon(Icons.password),
                        hintText: 'Пароль',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3)
                        )
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 8),
                  child: TextField(style: TextStyle(fontSize: 20, color: Colors.black
                  ),
                    decoration: InputDecoration(hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        prefixIcon: Icon(Icons.password),
                        hintText: 'Повторите пароль',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3)
                        )
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: ElevatedButton(

                  child: Text('Зарегистрироваться'),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage())
                    );
                  },
                )

            )

          ],
        ),
      ),


    );
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key, required this.name_product1, required this.photo_path1, required this.desciption_product1, required this.id_product1, required this.price_prpduct1}) : super(key: key);
  final String name_product1;
  final String photo_path1;
  final String desciption_product1;
  final double price_prpduct1;
  final int id_product1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name_product1,
            style: TextStyle(fontSize: 20, color: Colors.red[900]),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8) ,
          children: <Widget>[
            Container(
              child: Image.network(photo_path1),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('Артикул: ${id_product1.toString()}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('Полное название продукта: ${name_product1}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('Описание товара: ${desciption_product1}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('Цена товара: ${price_prpduct1.toString()}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
          ],

        )
    );
  }
}


class ToCartProduct extends StatelessWidget {
  const ToCartProduct ({Key? key, required this.name_producta, required this.photik_path, required this.desciptionik_product, required this.id_productik, required this.pricek_prpduct}) : super(key: key);
  final String name_producta;
  final String photik_path;
  final String desciptionik_product;
  final double pricek_prpduct;
  final int id_productik;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('${name_producta}'),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartProduct(name_product1: name_producta, photo_path1: photik_path, desciption_product1: desciptionik_product, id_product1: id_productik, price_prpduct1: pricek_prpduct)));
      },
    );
  }
}


class Product{
  int id;
  String name;
  String pathphoto;
  String description;
  double price;
  Product(this.id, this.name, this.pathphoto, this.description, this.price);
}
List<Product> productlist = [
  Product(1, 'Tatum 2 Basketball Shoes', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/ba07db3b-7805-4217-9773-b47d065cadb7/tatum-2-basketball-shoes-sn3SML.png', 'Это не конец, пока вы не услышите звуковой сигнал. В Tatum 2 играйте с запасом энергии. Это помогает вам оставаться легким на ногах, ограничивая использование тяжелой резины. Полноразмерный блок Nike Air Strobel обеспечивает быструю смену обуви, а прочная рама сочетается с поддерживающей пеной, которая прилегает к ногам, создавая ощущение защищенности', 11500),
  Product(2, 'Luka 2 Basketball Shoes', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/5309f94d-1e58-4f6c-bff0-2b34fbc6af6d/luka-2-basketball-shoes-vcXFrk.png', 'Вы обеспечиваете скорость. Мы обеспечим стабильность. Luka 2 создан для поддержки ваших навыков, с акцентом на отступления, боковые шаги и действия с быстрой остановкой. Наборная промежуточная подошва обеспечивает прочную и гибкую амортизацию для дополнительной отзывчивости при перемещении взад и вперед по корту. Конструкция каркаса, охватывающего всю ступню, помогает вам оставаться сдержанным, независимо от того, притворяетесь ли вы защитником или едете по дорожке. Благодаря всем этим технологиям в легком корпусе мы обеспечиваем эффективность. Остальное зависит от вас.', 11960),
  Product(3, 'Zion 3 "Z-3D"', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0131b69f-e7bd-44c5-9aea-aca92fc45952/zion-3-z-3d-basketball-shoes-CghHWs.png', 'У Zion есть склонность к ностальгии, и Z-3D воплощает эту любовь в жизнь. Сама обувь разработана с использованием передовых технологий, призванных помочь вам оставаться на низком уровне, оставаться сдержанным и взмывать ввысь с мягким возвращением на землю.', 13800),
  Product(4, 'Air Jordan XXXVIII Low "Fresh Start"', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/12496024-2cd7-484c-86d2-f5f03617799e/air-jordan-xxxviii-low-fresh-start-basketball-shoes-f7GQhK.png', 'Кроссовки Air Jordan XXXVIII Low "Fresh Start", вдохновленные сезоном возрождения, выполнены в пастельных и нейтральных тонах, а подошва окрашена в цвет резинки. Благодаря новой оснастке для передней части стопы, которая еще больше приближает вас к земле, и технологиям, готовым к работе на корте, таким как стабилизирующая X—пластина и полноразмерный блок Zoom Strobel, наша обувь peak performance создана для скорости и маневренности в современной игре.', 16100),
  Product(5, 'Zion 3', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/52988ec4-ed30-47aa-bb8d-bae13580a074/zion-3-basketball-shoes-GWLnqd.png', 'Третья фирменная обувь Zion демонстрирует преданность, которую он вкладывает в создание своей уникальной игры. Оснащенная технологиями, готовыми к работе на корте, она предназначена для игроков, которые являются мастерами как на земле, так и в воздухе. Не высовывайтесь и сдерживайтесь, взмывайте ввысь с мягким возвращением на землю. Zion 3 помогает удерживать вас на земле — так что вы можете лететь своим собственным путем.', 12800),
  Product(6, 'Jordan One Take 5', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/fc4fa438-4ec2-47b4-bdee-2123ddc1275e/jordan-one-take-5-basketball-shoes-5lWJJ3.png', 'Ускоряйся, кренись, пробивай, забивай — затем повторяй. Новейшая обувь Рассела Уэстбрука поможет тебе играть на скорость, помогая оставаться неудержимым на перерыве. Внешняя накладка для глаз и обтягивающий носок обеспечивают устойчивость на корте, в то время как возвращающая энергию воздушная амортизация Zoom в передней части стопы не даст вам опускаться с 1-го по 4-й.', 9200),
  Product(7, 'Air Jordan XXXVIII WNBA', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/810dcce6-cae7-448f-b4b7-7542d681d881/air-jordan-xxxviii-wnba-womens-basketball-shoes-nq1D8G.png', 'Вдохновленные моментами величия, которые выделяют MJ на фоне конкурентов — например, знаменитой “игрой с гриппом”, — эти удары являются одой женщинам-первопроходцам WNBA. Они поддерживающие и легкие, чтобы помочь вам добиться контроля на корте. Лучше всего носить, бросая вызов ожиданиям и разбивая стеклянные потолки.', 10000),
  Product(8, 'Luka 2 Team Bank', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/4e63f5c8-742f-4ee7-a7e5-64903bc90fbe/luka-2-team-bank-basketball-shoes-qvvhqz.png', 'Вы обеспечиваете скорость. Мы обеспечим стабильность. Luka 2 создан для поддержки ваших навыков, с акцентом на отступления, боковые шаги и действия с быстрой остановкой. Наборная промежуточная подошва обеспечивает прочную и гибкую амортизацию для дополнительной отзывчивости при перемещении взад и вперед по корту. Конструкция каркаса, охватывающего всю ступню, помогает вам оставаться сдержанным, независимо от того, притворяетесь ли вы защитником или едете по дорожке. Благодаря всем этим технологиям в легком корпусе мы обеспечиваем эффективность. Остальное зависит от вас.', 11960),
  Product(9, 'Jordan 6 Rings', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/3dd00c35-b3e7-4244-9106-7a6ff87753aa/jordan-6-rings-big-kids-shoes-61Fqxm.png', 'Отдайте дань уважения карьере МЮ в "Джордан 6 Рингз". Использование элементов из ряда культовых кроссовок kicks — таких, как брызговик от AJ11 и рельефная подошва от AJ13 — этот вариант классической обуви hoops позволит вам почувствовать себя победителем.', 8600),
  Product(10, 'Tatum 1 "Home Team"', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/81ef85b1-775d-42fc-9b44-2f3ff6510414/tatum-1-home-team-big-kids-basketball-shoes-TjmSDX.png', 'Прежде чем вы сможете набрать очки, вам нужно надеть обувь. Мы упростили это с помощью складывающегося каблука, в котором используются инновационные технологии, подходящие для детей, для быстрого надевания и снятия. Просто шагайте, куда указано. После этого позвольте ботинку перенести вас с первого по четвертый (и все, что выпадет). На какой бы стадии игры вы ни находились, Tatum 1 поможет вам продолжать играть.', 12000),
  Product(11, 'Tatum 1 Team Bank', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/9aa1ae7c-7b13-4239-80fc-5dc0d622e645/tatum-1-team-bank-basketball-shoes-fmgwMn.png', 'Ваша любовь к игре никогда не угасает. Вот почему Tatum 1 был создан с учетом долговечности. Разработанный для того, чтобы максимально эффективно переносить вас с первого по четвертый уровень (и все, что придет в голову), мы сократили его до самого необходимого — и сделали это действительно, действительно качественным. В результате получилась самая легкая баскетбольная обувь этого сезона, в которой используется только резина, промежуточная подошва из пенопласта, прошедшая испытания на прочность, и воздушный блок Nike Zoom без каркаса для взрывных взлетов. На какой бы стадии игры вы ни находились, Tatum 1 поможет вам играть.', 9700),
  Product(12, 'Jordan Stay Loyal 3', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/662f924f-18b5-412c-bbd0-f751535d221b/jordan-stay-loyal-3-big-kids-shoes-4fsN15.png', 'Вы должны знать, где вы были, чтобы знать, куда идете. Мы приняли это близко к сердцу при создании Stay Loyal 3, современной обуви, основанной на наследии Air Jordan. Как внутри, так и снаружи эти кроссовки созданы для универсальности — минималистичный внешний вид и амортизация, напоминающая облако, делают их готовыми ко всему, что приготовит ваш день. А элементы дизайна, перекликающиеся с AJ4, придают вам стиль и доказанную долговечность.', 13000),
  Product(13, 'Zion 3 "Gen Zion"', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/65b6e96e-413d-475e-b290-504d3561c384/zion-3-gen-zion-baby-toddler-shoes-9QDQRW.png', 'Возьмите классическое сочетание черного и белого и придайте ему немного юношеской энергии. Результат: специальное издание Zion 3. Зацените эти разноцветные хлопки. А эта ледяная подошва? Все кончено.', 7500),
  Product(14, 'Stay Loyal 3', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/1b95ffdc-3e0f-4942-b0f1-f312c86d5ed9/stay-loyal-3-little-kids-shoes-RHCK7Q.png', 'Its never too early to step into the Air Jordan legacy. The Stay Loyal 3 takes design cues from the AJ4, so your kids got built-in style with proven lasting power. And this pair is made with kids in mind: on and off is easy with elastic laces and the hook-and-loop strap.', 6240),
  Product(15, 'Air Jordan XXXVIII "FIBA"', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/7a98b65a-4e0f-4098-ad5a-6eef03390247/air-jordan-xxxviii-fiba-basketball-shoes-QLZ7sg.png', 'Когда дело доходит до обручей, бренд Jordan заслужил свою мировую репутацию новатора и коллаборациониста. Этот AJ38 посвящен Международной федерации баскетбола — руководящему органу баскетбола во всем мире. Подобно белому свету, содержащему все возможные цвета, эффектная внешняя часть скрывает стельку, украшенную всеми оттенками яркого логотипа FIBA. Смелость изнутри наружу.', 7800)
];


class ListProduct extends StatelessWidget {
  final String name_product;
  final String photo_path;
  final String desciption_product;
  final double price_prpduct;
  final int id_product;
  const ListProduct({Key? key, required this.name_product, required this.photo_path, required this.desciption_product, required this.price_prpduct, required this.id_product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.all(Radius.circular(16)
          )

      ),

      child: Column(
        children: <Widget>[
          Image.network('${photo_path}',
            fit: BoxFit.scaleDown,
          ),
          Text('${name_product}', style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          ToCartProduct(name_producta: name_product, photik_path: photo_path, desciptionik_product: desciption_product, id_productik: id_product, pricek_prpduct: price_prpduct)
        ],
      ),
    );
  }
}
