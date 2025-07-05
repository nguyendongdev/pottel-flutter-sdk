// EKYC PROVIDER RIVERPOD

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'ekyc_provider.g.dart';

enum EkycType {
  cartBack,
  cartFront,
  selfie,
}

@riverpod
class Ekyc extends _$Ekyc {
  @override
  Ekyc build() {
    return Ekyc();
  }

  void setEkyc(Ekyc ekyc) {
    state = ekyc;
  }

  Ekyc getEkyc() {
    return state;
  }
}

@riverpod
class TypesScreen extends _$TypesScreen {
  @override
  EkycType build() {
    return EkycType.cartFront;
  }

  void setEkycType(EkycType ekycType) {
    state = ekycType;
  }

  String getEkycType() {
    return state.toString();
  }
}

@Riverpod(keepAlive: true)
class NumberIdRegis extends _$NumberIdRegis {
  @override
  int build() {
    return 0;
  }

  void setNumberIdRegis(int numberIdRegis) {
    state = numberIdRegis;
  }

  int getNumberIdRegis() {
    return state;
  }
}
