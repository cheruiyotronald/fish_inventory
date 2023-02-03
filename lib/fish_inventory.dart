import 'package:flutter/material.dart';

class FishInventory extends StatefulWidget {
  const FishInventory({super.key});

  @override
  State<FishInventory> createState() => _FishInventoryState();
}

class _FishInventoryState extends State<FishInventory> {
  @override
  String? valueschoose;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _amount = TextEditingController();
    final _tot = TextEditingController();
    double cal;
    double result;


    return Scaffold(
      body: SafeArea(
        child:   Container(
          child: Column(
            children: [
               Text(
                'Fish Inventory', style: TextStyle(fontSize: 20, color: Colors.red)),
                SizedBox(height: 15,),
                TextField(
                  controller: _amount,
                  decoration: InputDecoration(
                    labelText: 'Fish Weight',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                  ),
                ),
                SizedBox(height: 15,),
                DropdownButton<String>(
                  value: this.valueschoose,
                  items:<String>['Kilograms', 'Grams'].map((String value){
                    return DropdownMenuItem<String>(
                      value:value,
                      child: Text(value)
                    );
                  }).toList(),
                  onChanged: (value) => setState(()=> this.valueschoose = value,
                ),),
                 const SizedBox(height: 15,),

                
                TextField(
                  controller: _tot,
                  decoration: InputDecoration(
                    labelText: 'Total Price in USD',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                  ),
                ),

                GestureDetector(

                  onTap: (){

                    if(valueschoose == 'Kilograms')
                    {
                      cal = double.parse(_amount.text) * 140;
                      result = cal;
                      _tot.text = result.toString();
                    }
                    else if(valueschoose=='Grams')
                    {
                      cal = double.parse(_amount.text)/1000 * 140;
                      result =cal;
                      _tot.text = result.toString();
                    }

                  },

                
                  child: Container(
                      alignment: Alignment.center,
                  height: size.height / 14,
                  width: size.width,
                  
                    child: const Text(
                      'Calculate', style: TextStyle(color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      )
                    ),
                  ),
                )
                
            ],
          ),
        ),
      ),
    );
  }
}
