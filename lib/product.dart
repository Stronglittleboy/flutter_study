/*一个简单的购物车列表 点击后边沟产品的颜色*/
import 'package:flutter/material.dart';

class Product{

  final String name;

  Product({this.name});
}


class MyShopingList extends StatefulWidget{
  final List<Product> products;


  MyShopingList({this.products});

  @override
  State createState() {
    return ShopingState();
  }
}

class ShopingState extends State<MyShopingList>{
  Set<Product> productCart = new Set<Product>();
  void handCartChange(Product product,bool incart){
    setState(() {
      if (incart) {
        productCart.add(product);
        return;
      }
      productCart.remove(product);
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     appBar: AppBar(title: Text("购物车列表"),),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map(
    (Product product){
      return ShoppingListItem(
        product: product,
        inCart: productCart.contains(product),
        cartChangedCallBack: handCartChange,
      );
        }).toList(),
      ),
    );
  }
}

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallBack cartChangedCallBack;

  ShoppingListItem({this.product, this.inCart, this.cartChangedCallBack});
  /*添加颜色样式*/
  Color getColor(BuildContext context){
    return inCart?Colors.black54:Theme.of(context).primaryColor;
  }
  /*添加文本样式*/
  TextStyle getTextStyle(BuildContext context){
    if(!inCart) return null;
    return new TextStyle(color: Colors.black54,decoration: TextDecoration.lineThrough);
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:(){
        cartChangedCallBack(product,!inCart);
      },
      leading: CircleAvatar(
        backgroundColor: getColor(context),
        child: Text(product.name[0]),
      ),title: Text(product.name,style:getTextStyle(context),),
    );
  }
}

typedef void CartChangedCallBack (
  Product product,bool incart);
void main()=>runApp(MaterialApp(
  title: "购物车app",
  home: MyShopingList(
    products: [
      new Product(name:"第一个产品"),
      new Product(name: "第二个产品"),
      new Product(name: "第三个产品"),
    ],
  ),
));