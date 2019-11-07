//
//  Task.h
//  TasksPractice
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

- (instancetype)initWithName:(NSString *)name notes:(NSString *)notes dueDate:(NSDate *)dueDate;
// name, notes, dueDate
// NSString, NSArray, NSDictionary, NSSet - copy so it is not reference type - object types NS....
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic) NSDate *dueDate;

@end

