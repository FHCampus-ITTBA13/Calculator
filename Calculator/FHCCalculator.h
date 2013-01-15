//
//  FHCCalculator.h
//  Calculator
//
//  Created by FH Campus on 10.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHCCalculator : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@property (nonatomic, readonly) id program;

+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;

@end
