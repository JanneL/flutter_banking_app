/* Class containing everything related to accounts */

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

Future<AccountsList> fetchAccounts(http.Client client) async {
  final response =
      await client.get(
        'https://sandbox.apis.op-palvelut.fi/accounts/v3/accounts/',
        headers: {
                  'x-api-key': '<REPLACE>',
                  'Authorization': '<REPLACE>',
                  'Accept': 'application/json',
                  'Content-Type': 'application/json'
          },
        );
   print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
  // Use the compute function to run parseFunds in a separate isolate
  return compute(accountsListFromJson, response.body);
  }


AccountsList accountsListFromJson(String str) {
    final jsonData = json.decode(str);
    print('*** accountsListFromJson:');
    print(jsonData);
    return AccountsList.fromJson(jsonData);
}

String accountsListToJson(AccountsList data) {
    final dyn = data.toJson();
    print('*** accountsListToJson:');
    print(dyn);
    return json.encode(dyn);
}

class AccountsList {
    List<Account> accounts;
    AccountsListLinks links;

    AccountsList({
        this.accounts,
        this.links,
    });

    factory AccountsList.fromJson(Map<String, dynamic> json) => new AccountsList(
        accounts: new List<Account>.from(json["accounts"].map((x) => Account.fromJson(x))),
        links: AccountsListLinks.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "accounts": new List<dynamic>.from(accounts.map((x) => x.toJson())),
        "_links": links.toJson(),
    };
}

class Account {
    String accountId;
    String identifier;
    String identifierScheme;
    String nickname;
    String name;
    double balance;
    String currency;
    String servicerScheme;
    String servicerIdentifier;
    AccountLinks links;

    Account({
        this.accountId,
        this.identifier,
        this.identifierScheme,
        this.nickname,
        this.name,
        this.balance,
        this.currency,
        this.servicerScheme,
        this.servicerIdentifier,
        this.links,
    });

    factory Account.fromJson(Map<String, dynamic> json) => new Account(
        accountId: json["accountId"],
        identifier: json["identifier"],
        identifierScheme: json["identifierScheme"],
        nickname: json["nickname"],
        name: json["name"],
        balance: json["balance"].toDouble(),
        currency: json["currency"],
        servicerScheme: json["servicerScheme"],
        servicerIdentifier: json["servicerIdentifier"],
        links: AccountLinks.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "identifier": identifier,
        "identifierScheme": identifierScheme,
        "nickname": nickname,
        "name": name,
        "balance": balance,
        "currency": currency,
        "servicerScheme": servicerScheme,
        "servicerIdentifier": servicerIdentifier,
        "_links": links.toJson(),
    };
}

class AccountLinks {
    Self self;
    Self transactions;

    AccountLinks({
        this.self,
        this.transactions,
    });

    factory AccountLinks.fromJson(Map<String, dynamic> json) => new AccountLinks(
        self: Self.fromJson(json["self"]),
        transactions: Self.fromJson(json["transactions"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "transactions": transactions.toJson(),
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

class AccountsListLinks {
    Self self;

    AccountsListLinks({
        this.self,
    });

    factory AccountsListLinks.fromJson(Map<String, dynamic> json) => new AccountsListLinks(
        self: Self.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
    };
}