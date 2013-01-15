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

@property (nonatomic, strong) NSMutableArray *programStack;

@end

@implementation FHCCalculator

- (id)init {
    self = [super init];
    
    if (self != nil) {
        self.programStack = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (NSString *)descriptionOfProgram:(id)program {
    return @"TODO: Implement";
}

+ (double)runProgram:(id)program {
    NSMutableArray *stack = nil;
    
    if ([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
    }
    
    return [self poppedOperandOfStack:stack];
}

+ (double)poppedOperandOfStack:(NSMutableArray *)stack {
    double result = 0.;
    id topOfStack = [stack lastObject];
    
    if (topOfStack != nil) {
        [stack removeLastObject];
    }
    
    if ([topOfStack isKindOfClass:[NSNumber class]]) {
        result = [topOfStack doubleValue];
    } else if ([topOfStack isKindOfClass:[NSString class]]) {
        NSString *operation = topOfStack;
        
        if ([operation isEqualToString:@"+"]) {
            result = [self poppedOperandOfStack:stack] + [self poppedOperandOfStack:stack];
        } else if ([operation isEqualToString:@"*"]) {
            result = [self poppedOperandOfStack:stack] * [self poppedOperandOfStack:stack];
        } else if ([operation isEqualToString:@"-"]) {
            double operand = [self poppedOperandOfStack:stack];
            result = [self poppedOperandOfStack:stack] - operand;
        } else if ([operation isEqualToString:@"/"]) {
            double operand = [self poppedOperandOfStack:stack];
            
            if (operand != 0.) {
                result = [self poppedOperandOfStack:stack] / operand;
            }
        } else if ([operation isEqualToString:@"sqrt"]) {
            result = sqrt([self poppedOperandOfStack:stack]);
        }
    }
    
    return result;
}

- (void)pushOperand:(double)operand {
    NSNumber *numberObject = @(operand);
    
    [self.programStack addObject:numberObject];
}

- (double)performOperation:(NSString *)operation {
    [self.programStack addObject:operation];
    
    return [FHCCalculator runProgram:self.program];
}

- (id)program {
    return [self.programStack copy];
}

@end
