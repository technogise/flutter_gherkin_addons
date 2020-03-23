import 'package:gherkin/gherkin.dart';
typedef Zero<TWorld extends World>(StepDefinitionBase<TWorld> world);
typedef One<TWorld extends World,Input1>(StepDefinitionBase<TWorld> world,Input1 first);
typedef Two<TWorld extends World,Input1,Input2>(StepDefinitionBase<TWorld> world,Input1 first,Input2 second);
typedef Three<TWorld extends World,Input1,Input2,Input3>(StepDefinitionBase<TWorld> world,Input1 first,Input2 second,Input3 third);
typedef Four<TWorld extends World,Input1,Input2,Input3,Input4>(StepDefinitionBase<TWorld> world,Input1 first,Input2 second,Input3 third,Input4 fourth);
typedef Five<TWorld extends World,Input1,Input2,Input3,Input4,Input5>(StepDefinitionBase<TWorld> world,Input1 first,Input2 second,Input3 third,Input4 fourth,Input5 fifth);
