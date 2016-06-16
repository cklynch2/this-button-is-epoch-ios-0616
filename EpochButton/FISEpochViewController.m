//
//  FISEpochViewController.m
//  EpochButton
//
//  Created by Flatiron School on 6/16/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISEpochViewController.h"

@interface FISEpochViewController ()
@property (weak, nonatomic) IBOutlet UILabel *epochLabel;

@end

@implementation FISEpochViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)epochMethod {
    return [[NSDate date] timeIntervalSince1970];
}

- (IBAction)epochButton:(id)sender {
    NSString *epochDateDisplay = [NSString stringWithFormat:@"%@ \nThis does not account for Leap Years! Ugh", [self convertUnixSecondsToYearsDaysHoursSeconds]];
    self.epochLabel.text = epochDateDisplay;
}

- (NSString *)convertUnixSecondsToYearsDaysHoursSeconds {
    CGFloat epochDate = [self epochMethod];
    NSUInteger epochDateInt = (NSUInteger) (floor(epochDate));
    NSUInteger years = epochDateInt/31536000;
    NSUInteger secondsAfterDividingOutYears = epochDateInt % 31536000;
    NSUInteger days = secondsAfterDividingOutYears/86400;
    NSUInteger secondsAfterDividingOutDays = secondsAfterDividingOutYears % 86400;
    NSUInteger hours = secondsAfterDividingOutDays/3600;
    NSUInteger secondsAfterDividingOutHours = secondsAfterDividingOutDays % 3600;
    NSUInteger minutes = secondsAfterDividingOutHours/60;
    NSUInteger secondsAfterDividingOutMinutes = secondsAfterDividingOutHours % 60;
    return [NSString stringWithFormat:@"Years: %lu | Days: %lu | Hours: %lu\ngit Minutes: %lu | Seconds: %lu", years, days, hours, minutes, secondsAfterDividingOutMinutes];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
