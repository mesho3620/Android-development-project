import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product_details.dart';

class weapons extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white60,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 16.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width -30.0,
            height: MediaQuery.of(context).size.width +100.0,
            child: GridView.count(
              crossAxisCount: 2,// 2D array
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _Weapon('Axe', '200 Gold', 'assets/axe.jpg',false, false, context),
                _Weapon('Epic Sword', '10000 Gold', 'assets/sword.jpg',false, true, context),
                _Weapon('GunZ', '5000 Gold', 'assets/guns.jpg',false, false, context),
                _Weapon('Stick', '25 Gold', 'assets/stick.jpg',true, false, context),
              ],
            ),

          ),
          SizedBox(height: 15.0,)
        ],
      ),
    );
  }
  Widget _Weapon(String Name,String price,String imgPath,bool add,bool isFavorite, context ){
    return Padding(
      padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left:5.0 ,right: 5.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>ShopDetail(
            assetPath: imgPath,
                weaponPrice:price,
                weaponname:Name,
            )
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                spreadRadius: 3.0,
                blurRadius: 5.0
              )
            ],
              color: Colors.white
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite ? Icon(Icons.favorite,color: Colors.red,) :
                        Icon(Icons.favorite_border,color:Colors.red,)
                  ],//is fav
                ),
              ),
              Hero(
                tag:imgPath,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.contain)
                    )
                  ),
                ),
              SizedBox(height: 7.0),
              Text(price,
              style: TextStyle(
                color: Colors.red,fontSize: 12
              ),
              ),
        Text(Name,
        style: TextStyle(
              color: Colors.black,fontSize: 12
        ),
        ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    color:Color(0xFFEBEBEB),//silver
                  height: 1.0,
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left:5.0,right:5.0),
                    child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if(!add) ...[// if add there is no price as its already bought
                    Icon(Icons.shopping_basket,color: Colors.red,size: 12.0,),
                          Text('Buy',
                              style:TextStyle(color:Colors.deepOrange, fontSize: 12.0
                              ),
                              )


                        ]
                      ],
    )
              )

            ],
          ),
        ),
      ),//Inkwell for buttons and on taps
    );
  }
}
