//
//  YDViewController.m
//  YDPreventCrash
//
//  Created by chong2vv on 05/27/2023.
//  Copyright (c) 2023 chong2vv. All rights reserved.
//

#import "YDViewController.h"
#import <YDLogger/YDLogger.h>

@interface YDViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (copy, nonatomic) NSDictionary *mapping;

@end

@implementation YDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"简单示例";
    [self loadData];
}

- (void)loadData {
    
    /**
     简单的测试示例，具体的防护效果可以详见YDAvoidCrashCategory内的各个分类实现
     */
    self.mapping =  @{
        @"Array": ^(void) {
            NSArray *array = @[@"1", @"2"];
            // 数组越界
            NSString *str = [array objectAtIndex:10];
        },
        @"NSString": ^(void) {
            NSString *str = [NSString stringWithUTF8String:nil];
        },
        @"Dictionary": ^(void) {
            NSMutableDictionary *dic = [NSMutableDictionary new];
            NSString *value = nil;
            NSString *key = nil;
            // 字典全空
            [dic setValue:value forKey:key];
            
        },
        @"Set": ^(void) {
            // set存空
            NSSet *set = [NSSet setWithObject:nil];
        },
        @"AttributedString": ^(void) {
            //AttributedString传空
            NSAttributedString *str = [[NSAttributedString alloc] initWithString:nil];
        },
        @"UserDefaults": ^(void) {
            NSString *key = nil;
            //NSUserDefaults获取空，会判断返回nil
            [[NSUserDefaults standardUserDefaults] valueForKey:key];
        },
        @"View": ^(void) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{
                // 子线程刷新UI
                [self.homeTableView layoutSubviews];
            });
        },
        @"查看日志": ^(void) {
            YDLogListViewController *vc = [[YDLogListViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    };
    
    [self.homeTableView reloadData];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mapping.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"homeTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    NSString *title = [self.mapping.allKeys objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = [self.mapping.allKeys objectAtIndex:indexPath.row];
    void (^block)(void) = self.mapping[title];
    if (block) {
        block();
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
