//
//  FHCViewController.m
//  Calculator
//
//  Created by FH Campus on 10.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import "FHCViewController.h"
#import "FHCCalculator.h"

@interface FHCViewController ()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) FHCCalculator *calculator;

@end


@implementation FHCViewController

- (FHCCalculator *)calculator {
    if (_calculator == nil) {
        _calculator = [[FHCCalculator alloc] init];
    }
    
    return _calculator;
}

- (IBAction)handleDigitPress:(UIButton *)sender {
    NSString *digitString = sender.currentTitle;
    NSString *displayText = self.displayLabel.text;
    NSString *updatedText = [displayText stringByAppendingString:digitString];

    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.displayLabel.text = updatedText;
    } else {
        self.displayLabel.text = digitString;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }

    
    // NSLog(@"button pressed: %@", digitString);
}

- (IBAction)handleOperationPressed:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self handleEnterPress];
    }
    
    NSString *operation = sender.currentTitle;
    double result = [self.calculator performOperation:operation];
    
    self.displayLabel.text = [NSString stringWithFormat:@"%f", result];
}

- (IBAction)handleEnterPress {
    NSString *operandString = self.displayLabel.text;
    double operand = [operandString doubleValue];
    
    [self.calculator pushOperand:operand];
    
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

@end
