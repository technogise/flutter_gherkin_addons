import 'package:gherkin/gherkin.dart';

import 'common.dart';

class GenericGiven<TWorld extends World> extends GivenWithWorld<TWorld> {
  String _pattern;
  Zero<TWorld> _step;

  GenericGiven(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep() async {
    await _step(this);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericGiven given<TWorld extends World>(String pattern, Zero<TWorld> step,[StepDefinitionConfiguration configuration]) {
  return GenericGiven<TWorld>(pattern, step,configuration);
}

class GenericGiven1<TWorld extends World, Input1>
    extends Given1WithWorld<Input1, TWorld> {
  String _pattern;
  One<TWorld, Input1> _step;

  GenericGiven1(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(Input1 first) async {
    await _step(this, first);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericGiven1 given1<TWorld extends World, Input1>(
    String pattern, One<TWorld, Input1> step,[StepDefinitionConfiguration configuration]) {
  return GenericGiven1<TWorld, Input1>(pattern, step,configuration);
}

class GenericGiven2<TWorld extends World, Input1, Input2>
    extends Given2WithWorld<Input1, Input2, TWorld> {
  String _pattern;
  Two<TWorld, Input1, Input2> _step;

  GenericGiven2(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(Input1 first, Input2 second) async {
    await _step(this, first, second);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericGiven2 given2<TWorld extends World, Input1, Input2>(
    String pattern, Two<TWorld, Input1, Input2> step,[StepDefinitionConfiguration configuration]) {
  return GenericGiven2<TWorld, Input1, Input2>(pattern, step,configuration);
}

class GenericGiven3<TWorld extends World, Input1, Input2, Input3>
    extends Given3WithWorld<Input1, Input2, Input3, TWorld> {
  String _pattern;
  Three<TWorld, Input1, Input2, Input3> _step;

  GenericGiven3(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(Input1 first, Input2 second, Input3 third) async {
    await _step(this, first, second, third);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericGiven3 given3<TWorld extends World, Input1, Input2, Input3>(
    String pattern, Three<TWorld, Input1, Input2, Input3> step,[StepDefinitionConfiguration configuration]) {
  return GenericGiven3<TWorld, Input1, Input2, Input3>(pattern, step,configuration);
}

class GenericGiven4<TWorld extends World, Input1, Input2, Input3, Input4>
    extends Given4WithWorld<Input1, Input2, Input3, Input4, TWorld> {
  String _pattern;
  Four<TWorld, Input1, Input2, Input3, Input4> _step;

  GenericGiven4(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(
      Input1 first, Input2 second, Input3 third, Input4 fourth) async {
    await _step(this, first, second, third, fourth);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericGiven4 given4<TWorld extends World, Input1, Input2, Input3, Input4>(
    String pattern, Four<TWorld, Input1, Input2, Input3, Input4> step,[StepDefinitionConfiguration configuration]) {
  return GenericGiven4<TWorld, Input1, Input2, Input3, Input4>(pattern, step,configuration);
}

class GenericGiven5<TWorld extends World, Input1, Input2, Input3, Input4,
        Input5>
    extends Given5WithWorld<Input1, Input2, Input3, Input4, Input5, TWorld> {
  String _pattern;
  Five<TWorld, Input1, Input2, Input3, Input4, Input5> _step;

  GenericGiven5(this._pattern, this._step,[StepDefinitionConfiguration configuration]):super(configuration);

  @override
  Future<void> executeStep(Input1 first, Input2 second, Input3 third,
      Input4 fourth, Input5 fifth) async {
    await _step(this, first, second, third, fourth, fifth);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericGiven5
    given5<TWorld extends World, Input1, Input2, Input3, Input4, Input5>(
        String pattern,
        Five<TWorld, Input1, Input2, Input3, Input4, Input5> step,[StepDefinitionConfiguration configuration]) {
  return GenericGiven5<TWorld, Input1, Input2, Input3, Input4, Input5>(
      pattern, step,configuration);
}
