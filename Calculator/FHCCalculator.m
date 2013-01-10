//
//  FHCCalculator.m
//  Calculator
//
//  Created by FH Campus on 10.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import "FHCCalculator.h"
#import <math.h>

@interface FHCCalculator ()

@property (nonatomic, strong) NSMutableArray *operandStack;

@end

@implementation FHCCalculator

- (id)init {
    self = [super init];
    
    if (self != nil) {
        self.operandStack = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)pushOperand:(double)operand {
    NSNumber *numberObject = @(operand);
    //NSNumber *numberObject = [NSNumber numberWithDouble:operand];
    
    [self.operandStack addObject:numberObject];
}

- (double)performOperation:(NSString *)operation {
    double result = 0.;

    if ([operation isEqualToString:@"+"]) {
        result = [self poppedOperand] + [self poppedOperand];
    } else if ([operation isEqualToString:@"*"]) {
        result = [self poppedOperand] * [self poppedOperand];
    } else if ([operation isEqualToString:@"-"]) {
        double operand = [self poppedOperand];
        result = [self poppedOperand] - operand;
    } else if ([operation isEqualToString:@"/"]) {
        double operand = [self poppedOperand];
        
        if (operand != 0.) {
            result = [self poppedOperand] / operand;
        }
    } else if ([operation isEqualToString:@"sqrt"]) {
        result = sqrt([self poppedOperand]);
    }
    
    [self pushOperand:result];
    
    return result;
}

- (double)poppedOperand {
    NSNumber *lastOperand = [self.operandStack lastObject];
    
    if (lastOperand != nil) {
        [self.operandStack removeLastObject];
    }
    
    return [lastOperand doubleValue];
}

@end
