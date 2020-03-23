import 'package:gherkin/gherkin.dart';

import 'common.dart';

class GenericWhen<TWorld extends World> extends WhenWithWorld<TWorld> {
  String _pattern;
  Zero<TWorld> _step;

  GenericWhen(this._pattern, this._step);

  @override
  Future<void> executeStep() async {
    await _step(this);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericWhen when<TWorld extends World>(String pattern, Zero<TWorld> step) {
  return GenericWhen<TWorld>(pattern, step);
}

class GenericWhen1<TWorld extends World, Input1>
    extends When1WithWorld<Input1, TWorld> {
  String _pattern;
  One<TWorld, Input1> _step;

  GenericWhen1(this._pattern, this._step);

  @override
  Future<void> executeStep(Input1 first) async {
    await _step(this, first);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericWhen1 when1<TWorld extends World, Input1>(
    String pattern, One<TWorld, Input1> step) {
  return GenericWhen1<TWorld, Input1>(pattern, step);
}

class GenericWhen2<TWorld extends World, Input1, Input2>
    extends When2WithWorld<Input1, Input2, TWorld> {
  String _pattern;
  Two<TWorld, Input1, Input2> _step;

  GenericWhen2(this._pattern, this._step);

  @override
  Future<void> executeStep(Input1 first, Input2 second) async {
    await _step(this, first, second);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericWhen2 when2<TWorld extends World, Input1, Input2>(
    String pattern, Two<TWorld, Input1, Input2> step) {
  return GenericWhen2<TWorld, Input1, Input2>(pattern, step);
}

class GenericWhen3<TWorld extends World, Input1, Input2, Input3>
    extends When3WithWorld<Input1, Input2, Input3, TWorld> {
  String _pattern;
  Three<TWorld, Input1, Input2, Input3> _step;

  GenericWhen3(this._pattern, this._step);

  @override
  Future<void> executeStep(Input1 first, Input2 second, Input3 third) async {
    await _step(this, first, second, third);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericWhen3 when3<TWorld extends World, Input1, Input2, Input3>(
    String pattern, Three<TWorld, Input1, Input2, Input3> step) {
  return GenericWhen3<TWorld, Input1, Input2, Input3>(pattern, step);
}

class GenericWhen4<TWorld extends World, Input1, Input2, Input3, Input4>
    extends When4WithWorld<Input1, Input2, Input3, Input4, TWorld> {
  String _pattern;
  Four<TWorld, Input1, Input2, Input3, Input4> _step;

  GenericWhen4(this._pattern, this._step);

  @override
  Future<void> executeStep(
      Input1 first, Input2 second, Input3 third, Input4 fourth) async {
    await _step(this, first, second, third, fourth);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericWhen4 when4<TWorld extends World, Input1, Input2, Input3, Input4>(
    String pattern, Four<TWorld, Input1, Input2, Input3, Input4> step) {
  return GenericWhen4<TWorld, Input1, Input2, Input3, Input4>(pattern, step);
}

class GenericWhen5<TWorld extends World, Input1, Input2, Input3, Input4, Input5>
    extends When5WithWorld<Input1, Input2, Input3, Input4, Input5, TWorld> {
  String _pattern;
  Five<TWorld, Input1, Input2, Input3, Input4, Input5> _step;

  GenericWhen5(this._pattern, this._step);

  @override
  Future<void> executeStep(Input1 first, Input2 second, Input3 third,
      Input4 fourth, Input5 fifth) async {
    await _step(this, first, second, third, fourth, fifth);
  }

  @override
  RegExp get pattern => RegExp(_pattern);
}

GenericWhen5
    when5<TWorld extends World, Input1, Input2, Input3, Input4, Input5>(
        String pattern,
        Five<TWorld, Input1, Input2, Input3, Input4, Input5> step) {
  return GenericWhen5<TWorld, Input1, Input2, Input3, Input4, Input5>(
      pattern, step);
}
