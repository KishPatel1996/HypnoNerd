//
//  BNRReminderViewController.m
//  HynoNerd
//
//  Created by Kishan Patel on 1/14/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRReminderViewController.h"


@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end
@implementation BNRReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        self.tabBarItem.title = @"Reminder";
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

- (IBAction)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"BNRRVC loaded it's view");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
