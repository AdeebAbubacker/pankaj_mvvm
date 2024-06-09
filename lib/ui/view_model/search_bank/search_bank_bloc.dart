import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/search_bank/search_bank.dart';
import 'package:panakj_app/core/service/bank_service.dart';


part 'search_bank_event.dart';
part 'search_bank_state.dart';
part 'search_bank_bloc.freezed.dart';

class SearchBankBloc extends Bloc<SearchBankEvent, SearchBankState> {
    final _bankController = StreamController<List<BankDB>>.broadcast();
  final _updateStreamController = StreamController<bool>();
  final BankDropdownService bankDropdownService;
  SearchBankBloc(this.bankDropdownService) : super(SearchBankState.initial()) {
    on<_Search>((event, emit) async {
      emit(SearchBankState.initial());
      try {
        // Placeholder for fetching data from the service
        final bankData =
            await bankDropdownService.getSearchBank(searchKeyword: event.bank);

          storeDataInHive(bankData.data!.toList());
       
        emit(state.copyWith(
            searchBank: bankData,
            isLoading: false,
            successorFailure: optionOf(right(bankData))));
      } catch (e) {
        // Handle error and update state
        emit(state.copyWith(
            isError: true,
            isLoading: false,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
    });
  }
   Future<void> storeDataInHive(List<Bank> data) async {
    final bankBox = await Hive.openBox<BankDB>('bankBox');

    // Store the new data in Hive
    data.forEach((bank) {
      var existingBank = bankBox.get(bank.id);

      if (existingBank != null) {
        // If the object exists, update it
         existingBank.name = bank.name!; 
        
        bankBox.put(bank.id, existingBank);
      } else {
        // If the object doesn't exist, add it
        bankBox.put(
          bank.id,
          BankDB(
            id: bank.id as int,
            name: bank.name as String,
            deletedAt: 'null',
          ),
        );
      }
    });
         // Notify listeners about the state change
    _updateStreamController.add(true);
    _bankController.add(bankBox.values.toList());
  }
}
