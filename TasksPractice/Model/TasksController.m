//
//  TasksController.m
//  TasksPractice
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "TasksController.h"
#import "Task.h"

@interface TasksController ()

@property (nonatomic) NSMutableArray<Task *> *internalTasks;

@end

@implementation TasksController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalTasks = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addTask:(Task *)aTask
{
    [self.internalTasks addObject:aTask];
}
-(void)removeTask:(Task *)aTask
{
    [self.internalTasks removeObject:aTask];
}

-(NSArray<Task *> *)tasks
{
    return self.internalTasks.copy;
}

@end
