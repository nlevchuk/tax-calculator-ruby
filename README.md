# Tax Calculator

This is an application that process a shopping basket, calculates applicable taxes (see description in the end of the file) for each item, and prints a receipt.

## Installation

1. Ensure Ruby (3.4+) is installed. No additional dependencies are required

2. Clone the repository:

```bash
git clone https://github.com/nlevchuk/tax-calculator.git
cd tax-calculator/
```

## Usage

The provided inputs and expected outputs are covered by tests, so you can run them to verify the behavior (see the next section).

To run the application manually with your own input data, use the following command in the terminal:

```sh
ruby run.rb "                                                                                                                   
2 book at 12.49                                                                                                                 
1 music CD at 14.99                                                                                                             
1 chocolate bar at 0.85"
```

## Run Tests

```sh
ruby -Ilib:test test/test_tax_calculator.rb
```

## Design decisions

When approaching this assessment, I identified the following main steps:

1. Parse the input;
2. Calculate prices and taxes;
3. Print the result.

Here are some key decisions I made during implementation:

1. Applied Single Responsibility Principle and Dependency Inversion Principle to ensure maintainability and extensibility;
2. Started with integration tests, which were more suitable for prototyping and verifying the overall behavior of the application;
3. Wrapped the entire project in a Ruby namespace to avoid conflicts with common class names like `Input` and `Output`;
4. Used BigDecimal for monetary values instead of Float to avoid rounding issues;
5. Initially implemented the Item entity using Struct, but later converted it into a full class as its responsibilities grew.

## The assessment

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets:

### Input

#### Input 1:

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

#### Input 2:

```
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
```

#### Input 3:

```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```

### Output

#### Output 1:

```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

#### Output 2:

```
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```

#### Output 3:

```
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```

Note: The sales Tax amount listed in Output 3 appears to be incorrect. Based on the calculations and verified test results, the correct Sales Taxes should be 6.70, not 7.90.
