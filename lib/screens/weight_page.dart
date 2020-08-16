import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/models/weight.dart';
import '../state/weight_state.dart';

class WeightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Sample"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var state= Provider.of<WeightState>(context, listen: false);
          var result = await showDialog<double>(context: context,builder: (context)=>NumberPickerDialog.decimal(initialDoubleValue: 20, minValue: 19, maxValue: 200),);
        if(result!=null && result>0){
          state.add(Weight(value: result, time: DateTime.now(),),);
        }
          },
        child: Icon(Icons.add),
      ),
      body: Consumer<WeightState>(builder: (context, state, widget) {
        var weights = state.weights;

        return Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Current Weight", textScaleFactor: 1.2,),
                        Text(" " + weights.last.value.toString(), textScaleFactor: 2,),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, int index) {
                    var weight = weights[index];
                    return ListTile(
                      trailing: Text(
                        weight.value.toString(),
                        textScaleFactor: 2,
                      ),
                      title: Text(
                          "${weight.time.day}.${weight.time.month}.${weight.time.year}"),
                    );
                  },
                  itemCount: state.weights.length,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
