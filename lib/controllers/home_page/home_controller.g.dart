// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<String>? _$initialsComputed;

  @override
  String get initials => (_$initialsComputed ??= Computed<String>(
    () => super.initials,
    name: '_HomeControllerBase.initials',
  )).value;

  late final _$userNameAtom = Atom(
    name: '_HomeControllerBase.userName',
    context: context,
  );

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$levelAtom = Atom(
    name: '_HomeControllerBase.level',
    context: context,
  );

  @override
  int get level {
    _$levelAtom.reportRead();
    return super.level;
  }

  @override
  set level(int value) {
    _$levelAtom.reportWrite(value, super.level, () {
      super.level = value;
    });
  }

  late final _$selectedActionAtom = Atom(
    name: '_HomeControllerBase.selectedAction',
    context: context,
  );

  @override
  int get selectedAction {
    _$selectedActionAtom.reportRead();
    return super.selectedAction;
  }

  @override
  set selectedAction(int value) {
    _$selectedActionAtom.reportWrite(value, super.selectedAction, () {
      super.selectedAction = value;
    });
  }

  late final _$actionsAtom = Atom(
    name: '_HomeControllerBase.actions',
    context: context,
  );

  @override
  ObservableList<QuickAction> get actions {
    _$actionsAtom.reportRead();
    return super.actions;
  }

  bool _actionsIsInitialized = false;

  @override
  set actions(ObservableList<QuickAction> value) {
    _$actionsAtom.reportWrite(
      value,
      _actionsIsInitialized ? super.actions : null,
      () {
        super.actions = value;
        _actionsIsInitialized = true;
      },
    );
  }

  late final _$_HomeControllerBaseActionController = ActionController(
    name: '_HomeControllerBase',
    context: context,
  );

  @override
  void selectAction(int i) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
      name: '_HomeControllerBase.selectAction',
    );
    try {
      return super.selectAction(i);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
level: ${level},
selectedAction: ${selectedAction},
actions: ${actions},
initials: ${initials}
    ''';
  }
}
