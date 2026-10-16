import 'dart:io';

void main() {
  bool keepOrdering = true;

  while (keepOrdering) {
    // Display prices
    print('====================================================');
    print('Pizza Price: "Small: 5 USD, Medium: 7 USD, Large: 10 USD"');

    // Ask user for pizza size
    print('Please enter your pizza size (small, medium, or large):');
    String? sizeInput = stdin.readLineSync();
    String size = sizeInput?.trim().toLowerCase() ?? '';

    // Determine price using a switch-case statement
    int pricePerPizza = 0;
    bool validSize = true;

    switch (size) {
      case 'small':
        pricePerPizza = 5;
        break;
      case 'medium':
        pricePerPizza = 7;
        break;
      case 'large':
        pricePerPizza = 10;
        break;
      default:
        print('Invalid pizza size entered. Please try again.\n');
        validSize = false;
        break;
    }

    // Skip quantity input if the size was invalid
    if (!validSize) {
      continue;
    }

    // Ask user for quantity
    print('How many pizzas do you want of $sizeInput?');
    String? quantityInput = stdin.readLineSync();
    int quantity = int.tryParse(quantityInput ?? '') ?? 0;

    if (quantity <= 0) {
      print('Invalid quantity. Please order at least 1 pizza.\n');
      continue;
    }

    // Calculate and display total
    int totalPayment = pricePerPizza * quantity;
    print('Your Total Payment is: \$$totalPayment\n');

    // Loop prompt to continue or exit
    print('Would you like to place another order? (yes/no):');
    String? choice = stdin.readLineSync()?.trim().toLowerCase();
    if (choice != 'yes' && choice != 'y') {
      keepOrdering = false;
      print('Thank you for your order!');
    }
  }
}
