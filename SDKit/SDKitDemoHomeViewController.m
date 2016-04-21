//
//  SDKitDemoHomeViewController.m
//  SDKit
//
//  Created by gsd on 16/4/21.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import "SDKitDemoHomeViewController.h"

NSString *const des0 = @"添加多种样式的提示小圆点";

@implementation SDKitDemoHomeViewController
{
    NSArray *_dataArray;
    NSArray *_uiDemoArray;
    NSArray *_nsDemoArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"SDKit演示";
    
    _uiDemoArray = @[des0];
    _nsDemoArray = @[];
    _dataArray = @[_uiDemoArray, _nsDemoArray];
    
}

#pragma mark - tableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *classString = [NSString stringWithFormat:@"DemoVC%ld%ld", (long)indexPath.section, (long)indexPath.row];
    Class vcClass = NSClassFromString(classString);
    UIViewController *vc = [vcClass new];
    vc.title = classString;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _dataArray[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"SDKitDemoHomeViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [_dataArray[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

@end
