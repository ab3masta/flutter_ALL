import 'package:flutter/material.dart';
import 'package:flutter_all/Services_to_do_the_work/core/model/counter_viewmodel.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class SworkCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelProvider is what provides the view model to the widget tree.
    return ViewModelProvider<SworkCounterViewModel>.withConsumer(
      viewModelBuilder: () => SworkCounterViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${model.counter}', //                           <-- view model
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.increment(); //                                <-- view model
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
