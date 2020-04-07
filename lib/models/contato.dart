class Contact {
  final int id;
  final String name;
  final int accountNumber;

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }

  Contact(this.id, this.name, this.accountNumber);
}
