//
//  TaskDetailViewController.h
//  TasksPractice
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TasksController;
@class Task;

@interface TaskDetailViewController : UIViewController

@property (nonatomic) TasksController *tasksController;
@property (nonatomic) Task *task;

@end

