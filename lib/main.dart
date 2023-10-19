// المستوردات الضرورية
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1. تعريف الحالة الأولية للتطبيق
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  // 2. دوال لزيادة وتنقيص العداد
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

void main() {
  runApp(
    // 3. إعداد BlocProvider وتوفير الـ Cubit للتطبيق
    BlocProvider(
      create: (context) => CounterCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bloc and Cubit Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 4. استخدام BlocBuilder لعرض الحالة الحالية
              BlocBuilder<CounterCubit, int>(
                builder: (context, count) {
                  return Text(
                    'Count: $count',
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // 5. زر لزيادة العداد
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 20),
                  // 6. زر لتنقيص العداد
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
