import 'package:flutter/material.dart';
import 'package:projeto_despesas/components/transaction_item.dart';
import 'package:projeto_despesas/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  const TransactionList(this.transaction, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nenhuma transação cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (ctx, index) {
              final tr = transaction[index];
              return TransactionItem(tr: tr, onRemove: onRemove);
            },
          );
  }
}
