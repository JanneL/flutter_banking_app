// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);
import '../src/accounts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../account_detail_view.dart';


Future<Transactions> fetchTransactions(http.Client client) async {
  final response =
      await client.get(
        'https://sandbox.apis.op-palvelut.fi/accounts/v3/accounts/',
        headers: {
                  'x-api-key': 'UwokNy95Nq3ePgOM3SeO5SzaVZzqGM5Z',
                  'Authorization': 'Bearer 6c18c234b1b18b1d97c7043e2e41135c293d0da9',
                  'Accept': 'application/json',
                  'Content-Type': 'application/json'
          },
        );
   print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
  // Use the compute function to run parseFunds in a separate isolate
  return compute(transactionsFromJson, response.body);
  }

Transactions transactionsFromJson(String str) {
    final jsonData = json.decode(str);
    return Transactions.fromJson(jsonData);
}

String transactionsToJson(Transactions data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Transactions {
    List<Transaction> transactions;
    TransactionsLinks links;

    Transactions({
        this.transactions,
        this.links,
    });

    factory Transactions.fromJson(Map<String, dynamic> json) => new Transactions(
        transactions: new List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
        links: TransactionsLinks.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "transactions": new List<dynamic>.from(transactions.map((x) => x.toJson())),
        "_links": links.toJson(),
    };
}

class TransactionsLinks {
    Self self;

    TransactionsLinks({
        this.self,
    });

    factory TransactionsLinks.fromJson(Map<String, dynamic> json) => new TransactionsLinks(
        self: Self.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
    };
}

class Self {
    String href;

    Self({
        this.href,
    });

    factory Self.fromJson(Map<String, dynamic> json) => new Self(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Transaction {
    String transactionId;
    String accountId;
    String archiveId;
    String amount;
    String currency;
    String creditDebitIndicator;
    String accountBalance;
    String bookingDateTime;
    String valueDateTime;
    String status;
    String isoTransactionCode;
    String opTransactionCode;
    Creditor creditor;
    dynamic debtor;
    TransactionLinks links;

    Transaction({
        this.transactionId,
        this.accountId,
        this.archiveId,
        this.amount,
        this.currency,
        this.creditDebitIndicator,
        this.accountBalance,
        this.bookingDateTime,
        this.valueDateTime,
        this.status,
        this.isoTransactionCode,
        this.opTransactionCode,
        this.creditor,
        this.debtor,
        this.links,
    });

    factory Transaction.fromJson(Map<String, dynamic> json) => new Transaction(
        transactionId: json["transactionId"],
        accountId: json["accountId"],
        archiveId: json["archiveId"],
        amount: json["amount"],
        currency: json["currency"],
        creditDebitIndicator: json["creditDebitIndicator"],
        accountBalance: json["accountBalance"],
        bookingDateTime: json["bookingDateTime"],
        valueDateTime: json["valueDateTime"],
        status: json["status"],
        isoTransactionCode: json["isoTransactionCode"],
        opTransactionCode: json["opTransactionCode"],
        creditor: Creditor.fromJson(json["creditor"]),
        debtor: json["debtor"],
        links: TransactionLinks.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "accountId": accountId,
        "archiveId": archiveId,
        "amount": amount,
        "currency": currency,
        "creditDebitIndicator": creditDebitIndicator,
        "accountBalance": accountBalance,
        "bookingDateTime": bookingDateTime,
        "valueDateTime": valueDateTime,
        "status": status,
        "isoTransactionCode": isoTransactionCode,
        "opTransactionCode": opTransactionCode,
        "creditor": creditor.toJson(),
        "debtor": debtor,
        "_links": links.toJson(),
    };
}

class Creditor {
    String accountIdentifier;
    String accountIdentifierType;
    String accountName;
    String servicerIdentifier;
    String servicerIdentifierType;

    Creditor({
        this.accountIdentifier,
        this.accountIdentifierType,
        this.accountName,
        this.servicerIdentifier,
        this.servicerIdentifierType,
    });

    factory Creditor.fromJson(Map<String, dynamic> json) => new Creditor(
        accountIdentifier: json["accountIdentifier"],
        accountIdentifierType: json["accountIdentifierType"],
        accountName: json["accountName"],
        servicerIdentifier: json["servicerIdentifier"],
        servicerIdentifierType: json["servicerIdentifierType"],
    );

    Map<String, dynamic> toJson() => {
        "accountIdentifier": accountIdentifier,
        "accountIdentifierType": accountIdentifierType,
        "accountName": accountName,
        "servicerIdentifier": servicerIdentifier,
        "servicerIdentifierType": servicerIdentifierType,
    };
}

class TransactionLinks {
    Self account;

    TransactionLinks({
        this.account,
    });

    factory TransactionLinks.fromJson(Map<String, dynamic> json) => new TransactionLinks(
        account: Self.fromJson(json["account"]),
    );

    Map<String, dynamic> toJson() => {
        "account": account.toJson(),
    };
}
