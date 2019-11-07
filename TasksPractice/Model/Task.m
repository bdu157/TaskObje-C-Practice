//
//  Task.m
//  TasksPractice
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "Task.h"

@interface Task () { //private extension only available here
    NSString *_internalTaskName;
    NSString *_notes;
    NSDate *_dueDate;
}
@end


@implementation Task

- (instancetype)initWithName:(NSString *)name notes:(NSString *)notes dueDate:(NSDate *)dueDate
{
    self = [super init];
    if (self) {
        //self.internalTaskName to public, _internalTaskName for within this file(private)
        _internalTaskName = name;
        _notes = notes;
        _dueDate = dueDate;
    }
    return self;
}





//@synthesize name = _internalTaskName; //this way name can be linked to private property - internalTaskName

//getting the name of the task
//id aName = aTask.name;
//id aName = [aTask name];

//setting the name of the task
//aTask.name = @"A new name";
//[aTask setName:@"A new name"];

#pragma mark - accessors

//getter
- (NSString *)name
{
    return _internalTaskName.copy;
}

//setter
- (void)setName:(NSString *)name
{
    _internalTaskName = name.copy;
}


@end
