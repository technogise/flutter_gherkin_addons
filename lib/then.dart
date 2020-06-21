import 'package:gherkin/gherkin.dart';

import 'common.dart';

class GenericThen<TWorld extends World> extends ThenWithWorld<TWorld> {
  String _pattern;
  Zero<TWorld> _step;

  GenericThen(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep() async {
    await _step(this);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericThen then<TWorld extends World>(String pattern, Zero<TWorld> step,[StepDefinitionConfiguration configuration]) {
  return GenericThen<TWorld>(pattern, step,configuration);
}

class GenericThen1<TWorld extends World, Input1>
    extends Then1WithWorld<Input1, TWorld> {
  String _pattern;
  One<TWorld, Input1> _step;

  GenericThen1(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(Input1 first) async {
    await _step(this, first);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericThen1 then1<TWorld extends World, Input1>(
    String pattern, One<TWorld, Input1> step,[StepDefinitionConfiguration configuration]) {
  return GenericThen1<TWorld, Input1>(pattern, step,configuration);
}

class GenericThen2<TWorld extends World, Input1, Input2>
    extends Then2WithWorld<Input1, Input2, TWorld> {
  String _pattern;
  Two<TWorld, Input1, Input2> _step;

  GenericThen2(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(Input1 first, Input2 second) async {
    await _step(this, first, second);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericThen2 then2<TWorld extends World, Input1, Input2>(
    String pattern, Two<TWorld, Input1, Input2> step,[StepDefinitionConfiguration configuration]) {
  return GenericThen2<TWorld, Input1, Input2>(pattern, step,configuration);
}

class GenericThen3<TWorld extends World, Input1, Input2, Input3>
    extends Then3WithWorld<Input1, Input2, Input3, TWorld> {
  String _pattern;
  Three<TWorld, Input1, Input2, Input3> _step;

  GenericThen3(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(Input1 first, Input2 second, Input3 third) async {
    await _step(this, first, second, third);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericThen3 then3<TWorld extends World, Input1, Input2, Input3>(
    String pattern, Three<TWorld, Input1, Input2, Input3> step,[StepDefinitionConfiguration configuration]) {
  return GenericThen3<TWorld, Input1, Input2, Input3>(pattern, step,configuration);
}

class GenericThen4<TWorld extends World, Input1, Input2, Input3, Input4>
    extends Then4WithWorld<Input1, Input2, Input3, Input4, TWorld> {
  String _pattern;
  Four<TWorld, Input1, Input2, Input3, Input4> _step;

  GenericThen4(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(
      Input1 first, Input2 second, Input3 third, Input4 fourth) async {
    await _step(this, first, second, third, fourth);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericThen4 then4<TWorld extends World, Input1, Input2, Input3, Input4>(
    String pattern, Four<TWorld, Input1, Input2, Input3, Input4> step,[StepDefinitionConfiguration configuration]) {
  return GenericThen4<TWorld, Input1, Input2, Input3, Input4>(pattern, step,configuration);
}

class GenericThen5<TWorld extends World, Input1, Input2, Input3, Input4,
Input5>
    extends Then5WithWorld<Input1, Input2, Input3, Input4, Input5, TWorld> {
  String _pattern;
  Five<TWorld, Input1, Input2, Input3, Input4, Input5> _step;

  GenericThen5(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(Input1 first, Input2 second, Input3 third,
      Input4 fourth, Input5 fifth) async {
    await _step(this, first, second, third, fourth, fifth);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericThen5
then5<TWorld extends World, Input1, Input2, Input3, Input4, Input5>(
    String pattern,
    Five<TWorld, Input1, Input2, Input3, Input4, Input5> step,[StepDefinitionConfiguration configuration]) {
  return GenericThen5<TWorld, Input1, Input2, Input3, Input4, Input5>(
      pattern, step,configuration);
}