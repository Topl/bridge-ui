import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bridge_state.freezed.dart';
part 'bridge_state.g.dart';

@riverpod
class Bridge extends _$Bridge {
  @override
  BridgeState build() {
    return BridgeState.base();
  }

  swap({Currency? currency}) {
    final curr = currency ??= state.currency == Currency.ethereum ? Currency.bitcoin : Currency.ethereum;
    state = state.copyWith(currency: curr);
  }

  updateValue(double value) {
    state = state.copyWith(value: value);
  }

  get convertedValue => state.rates.convert(state.currency, state.value);

  get formattedValue {
    var newValue = state.value;

    /// temp conversion so that eth gets converted somewhat properly, pretty much only here for demo purposes
    if (state.currency == Currency.ethereum) {
      newValue = (newValue * state.rates.getRate(Currency.ethereum)) / state.rates.getRate(Currency.bitcoin);
    }

    String formattedValue = newValue.toStringAsFixed(3);

    // Remove ALL trailing zeros after the decimal
    if (formattedValue.contains('.') && formattedValue.endsWith('0')) {
      while (formattedValue.endsWith('0')) {
        formattedValue = formattedValue.substring(0, formattedValue.length - 1);
      }
    }

    // Remove the decimal point if it's the last character
    if (formattedValue.endsWith('.')) {
      formattedValue = formattedValue.substring(0, formattedValue.length - 1);
    }

    return formattedValue;
  }

  Future fetchCryptoRates() async {
    var response = await http
        .get(Uri.parse('https://api.coingecko.com/api/v3/simple/price?ids=ethereum,bitcoin&vs_currencies=usd'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load rate');
    }
    Map<String, dynamic> json = jsonDecode(response.body);
    double ethRate = json['ethereum']['usd'];
    double btcRate = json['bitcoin']['usd'];

    state.rates.setRate(Currency.ethereum, ethRate);
    state.rates.setRate(Currency.bitcoin, btcRate);
  }

  void startTransfer() {
    state = state.copyWith(loading: true);

    // Simulate a transfer
    Future.delayed(const Duration(seconds: 5), () {
      state = state.copyWith(loading: false);
    });
  }

// Add methods to mutate the state
}

@freezed
class BridgeState with _$BridgeState {
  const factory BridgeState({
    required Currency currency,
    required double value,
    required CryptoRates rates,
    required bool loading,
  }) = _BridgeState;

  factory BridgeState.base() =>
      BridgeState(currency: Currency.bitcoin, value: 0, rates: CryptoRates.zero(), loading: false);
}

enum Currency { ethereum, bitcoin }

class CryptoRates {
  final Map<Currency, double> rates;

  CryptoRates({required this.rates});

  // constructor that sets all possible currencies to 0 dynamically
  CryptoRates.zero() : rates = {for (var e in Currency.values) e: 0};

  double getRate(Currency currency) {
    return rates[currency] ?? 0;
  }

  double convert(Currency currency, double amount) {
    return double.parse((getRate(currency) * amount).toStringAsFixed(2));
  }

  // sets the rate for a specific currency
  void setRate(Currency currency, double rate) {
    rates[currency] = rate;
  }
}
