import UIKit
/*
Params:
 The amount of the loan in whole dollars (an Int)
 The number of payments (e.g. 360 for 30-year) (an Int)
 The interest rate per payment period in percent ( a positive floating-point number)
 
 Return:
 the correct value (in dollars and cents, a Float ) of the periodic payment of principal and interest (ignore escrow accounts, taxes, and insurance)
 
 Examples:
 2-month loan of $20,000, 4.4% APR, compounded monthly
 30-year loan of $150,000, 5% APR, one annual payment each year for 30 years
 
 Calculation:
  loanAmount * [((((interestRate / 100) + 1)^numberOfPayments) - 1) * (interestRate / 100) / ((((interestRate / 100) + 1)^numberOfPayments) - 1)]
*/

func Payment(loanAmount: Int, numberOfPayments: Int, interestRate: Float) -> Float {
    let periodicPayment: Float;
    let totalLoanAmount: Float = Float(loanAmount);
    let totalNumberOfPayments: Float = Float(numberOfPayments);
    
    let interestRateToDecimal: Float = interestRate / 100.0;
    
    let fractionTop: Float = pow((interestRateToDecimal + 1.0),totalNumberOfPayments) * interestRateToDecimal;
    let fractionBottom: Float = pow((interestRateToDecimal + 1.0),totalNumberOfPayments) - 1;
    
    let fraction: Float = fractionTop / fractionBottom;
    
    periodicPayment = totalLoanAmount * fraction;
    
    return periodicPayment;
}

print(Payment(loanAmount: 20000, numberOfPayments: 2, interestRate: (4.4/12.0)));
print(Payment(loanAmount: 150000, numberOfPayments: 30, interestRate: 5.0));
