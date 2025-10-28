# Tax Calculator

This small application calculates applicable taxes for each item in the input and generates a final receipt.

## Design and decisions

File structure:
- `bin/` contains executables;
- `models/` contains base entities;
- `parsers/` contains parsers for different incoming data structures;
- `serializers/` is responsible for final formatting of the items;
- `strategies/` encapsulates rules for the tax calculation;
- `calculator.rb` represents the central place where the taxes are calculated;
- `file_reader.rb` provides a method to read the inputs;
- `processor.rb` combines all the logic.

Here are some key decisions I made during implementation:
1. It is not practical to parse data from the console. Most of the time businesses need to process files, sometimes large ones. So the application works with files;
2. Used Base classes for parsers, serialisers and strategies providing public interfaces that subclasses have to follow;
3. Followed SOLID principles to ensure maintainability and extensibility. Plus, Service objects, Strategy pattern, Domain Entities;
4. Started with integration tests, which were more suitable to verify the overall behavior of the application;
5. Wrapped the entire project in a Ruby namespace to avoid conflicts;
6. Used BigDecimal for monetary values instead of Float to avoid rounding issues.

## Installation

1. Ensure Ruby (3.4+) is installed. No additional dependencies are required

2. Clone the repository:

```bash
git clone https://github.com/nlevchuk/tax-calculator-ruby.git
cd tax-calculator-ruby/
```

## Usage

The provided inputs and expected outputs are covered by tests, so you can run them to verify the behavior (see the next section).

To run the application manually, use the following command in the terminal:

```sh
bin/run test/fixtures/inputs/1.txt
bin/run test/fixtures/inputs/2.txt
bin/run test/fixtures/inputs/3.txt
bin/run test/fixtures/inputs/invalid.txt
```

## Tests

For the testing purposes, the Minitest package was used. It provides a minimal yet sufficient set of methods for a good testing experience. Both the inputs and outputs files for the technical task are located in their respective folders within `test/fixtures/` directory.

```sh
bin/test
```

## The original assessment

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets:

#### Input 1:

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

#### Result 1:

```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

#### Input 2:

```
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
```

#### Result 2:

```
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```

#### Input 3:

```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```

#### Result 3:

```
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 6.70
Total: 98.38
```
