//
//  TasksTableViewController.m
//  TasksPractice
//
//  Created by Dongwoo Pae on 11/7/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "TasksTableViewController.h"
#import "TasksController.h"
#import "Task.h"
#import "TaskDetailViewController.h"
#import "NSString+RepeatString.h"


@interface TasksTableViewController ()

@property (nonatomic, readonly) TasksController *tasksController;
@property (nonatomic, readonly) NSDateFormatter *dateFormatter;

@end


@implementation TasksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasksController.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    
    Task *task = [self.tasksController.tasks objectAtIndex:indexPath.row];
    cell.textLabel.text = task.name.dwp_repeatString;
    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:task.dueDate].dwp_repeatString;
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Task *task = [self.tasksController.tasks objectAtIndex:indexPath.row];
        [self.tasksController removeTask:task];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowTaskDetail"]) {
        NSIndexPath *selectedRow = self.tableView.indexPathForSelectedRow;
        TaskDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.tasksController = self.tasksController;  //we are getting this from custom getter below (lazy property) it only gets called if we need like this
        detailVC.task = [self.tasksController.tasks objectAtIndex:selectedRow.row];
        
    } else if ([segue.identifier isEqualToString:@"ShowCreateTask"]) {
        TaskDetailViewController *detailVC = segue.destinationViewController;
        detailVC.tasksController = self.tasksController;
    }
}

#pragma mark - Private properties

//lazy property only gets called when it needs to be
@synthesize tasksController = _tasksController;
- (TasksController *)tasksController
{
    if (!_tasksController) {
        //create one
        _tasksController = [[TasksController alloc] init];
    }
    return _tasksController;
}

//lazy property only gets called when it needs to be
@synthesize dateFormatter = _dateFormatter;
- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        //create one
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateStyle = NSDateFormatterShortStyle;
        _dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    return _dateFormatter;
}

@end
