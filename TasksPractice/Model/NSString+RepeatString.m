//
//  NSString+RepeatString.m
//  TasksPractice
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "NSString+RepeatString.h"

@implementation NSString (RepeatString)

- (NSString *)dwp_repeatString
{
    return [NSString stringWithFormat:@"%@%@%@", self, self, self];
}

@end
