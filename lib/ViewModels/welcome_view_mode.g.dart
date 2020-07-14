// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_view_mode.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WelcomeViewModel on WelcomeViewModelBase, Store {
  final _$nummAtom = Atom(name: 'WelcomeViewModelBase.numm');

  @override
  int get numm {
    _$nummAtom.reportRead();
    return super.numm;
  }

  @override
  set numm(int value) {
    _$nummAtom.reportWrite(value, super.numm, () {
      super.numm = value;
    });
  }

  final _$WelcomeViewModelBaseActionController =
      ActionController(name: 'WelcomeViewModelBase');

  @override
  void increase() {
    final _$actionInfo = _$WelcomeViewModelBaseActionController.startAction(
        name: 'WelcomeViewModelBase.increase');
    try {
      return super.increase();
    } finally {
      _$WelcomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numm: ${numm}
    ''';
  }
}
