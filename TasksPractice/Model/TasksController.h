//
//  TasksController.h
//  TasksPractice
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TasksController : NSObject

@property (nonatomic, readonly, copy) NSArray<Task *> *tasks;  //readonly so no one can manupulate this it only gets manupulated through methods below

-(void)addTask:(Task *)aTask;
-(void)removeTask:(Task *)aTask;

@end
