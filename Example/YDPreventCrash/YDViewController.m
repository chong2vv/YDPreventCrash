//
//  YDViewController.m
//  YDPreventCrash
//
//  Created by chong2vv on 05/27/2023.
//  Copyright (c) 2023 chong2vv. All rights reserved.
//

#import "YDViewController.h"
#import <YDLogger/YDLogger.h>

@interface YDViewController ()

@end

@implementation YDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)testCrash:(id)sender {
    NSArray *array = @[@"1", @"2"];
    NSString *str = [array objectAtIndex:10];
    NSLog(@"%@", str);
}

- (IBAction)viewLog:(id)sender {
    
    YDLogListViewController *vc = [[YDLogListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
