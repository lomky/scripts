Script to read a CSV set of transactions into the Beancount format.

Based off of [pgr0ss/ynab_to_ledger](https://github.com/pgr0ss/ynab_to_ledger).

Exported YNAB CSV has been manipulated in Excel first:

  - Categories fixed
  - Transactions double-accounted
  - columns renamed

Work do to after: 

  - dedup transfers
