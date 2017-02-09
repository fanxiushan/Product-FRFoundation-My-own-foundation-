//
//  TestAssist.m
//  FRFoundation
//
//  Created by xiushan.fan on 9/2/17.
//  Copyright © 2017年 Frank. All rights reserved.
//


#import "TestAssist.h"

const NSInteger kBiggesCharNum      = 30;
const NSInteger kSmallestCharNum    = 5;

@implementation TestAssist

+ (NSArray *)generateStringArray {
    char *charArr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableArray *strArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i< 100; i++) {
        NSString *str = [NSString stringWithCString:charArr encoding:NSUTF8StringEncoding];
        NSMutableString *string = [NSMutableString stringWithCapacity:0];
        NSInteger numberOfCha = arc4random()%kBiggesCharNum;
        while (numberOfCha < kSmallestCharNum) {
            numberOfCha = arc4random()%kBiggesCharNum;
        }
        for (int j = 0; j < numberOfCha; j++) {
            unichar cha = [str characterAtIndex:arc4random()%(str.length)];
            [string appendFormat:@"%c",cha];
        }
        [strArray addObject:string];
    }
    return strArray;
}

@end
