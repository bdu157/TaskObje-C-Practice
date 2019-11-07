//
//  TaskDetailViewController.m
//  TasksPractice
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "TaskDetailViewController.h"
#import "TasksController.h"
#import "Task.h"

@interface TaskDetailViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextView *notesTextView;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateViews];
}


- (IBAction)save:(id)sender
{
    BOOL createsNewTask = (self.task == nil);
    
    if (createsNewTask) {
        Task *task = [[Task alloc] initWithName:self.nameTextField.text notes:self.notesTextView.text dueDate:self.datePicker.date];
        [self.tasksController addTask:task];
    } else {
        self.task.name = self.nameTextField.text;
        self.task.notes = self.notesTextView.text;
        self.task.dueDate = self.datePicker.date;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Private methods

-(void)updateViews
{
    self.title = self.task.name ?: @"Create Task"; // a ?? b in swift
    
    if (!self.isViewLoaded || !self.task) {return;}

    self.nameTextField.text = self.task.name;
    self.notesTextView.text = self.task.notes;
    self.datePicker.date = self.task.dueDate;
}

-(void)setTask:(Task *)task
{
    if (_task != task) {
        _task = task;
        [self updateViews];
    }
}

@end
