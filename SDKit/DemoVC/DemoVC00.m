//
//  DemoVC00.m
//  SDKit
//
//  Created by gsd on 16/4/21.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import "DemoVC00.h"
#import "SDKit.h"

#import "UIView+SDAutoLayout.h"

@implementation DemoVC00

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *dotColors = @[[UIColor redColor], [UIColor greenColor], [UIColor brownColor], [UIColor purpleColor], [UIColor orangeColor]];
    
    [dotColors enumerateObjectsUsingBlock:^(UIColor* obj, NSUInteger idx, BOOL *stop) {
        UIButton *btn = [UIButton new];
        NSString *buttontitle = [NSString stringWithFormat:@"按钮%ld", idx];
        [btn setTitle:buttontitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor yellowColor];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = idx;
        
        CGFloat y = 80 + idx * 60;
        btn.frame = CGRectMake(0, y, 150, 40);
        btn.centerX = self.view.width * 0.5;
        [self.view addSubview:btn];
        
        SDLog(@"测试打印信息2：%@！", btn);

        if (idx < 2) {
            long wh = idx * 2 + 8;
            CGSize dotSize = CGSizeMake(wh, wh);
            // 显示纯色提示小圆点
            [btn sd_showAlertDotWithDotSize:dotSize topOffset:6 rightOffset:6]; // 显示提示小圆点，默认为红色
        } else if (idx == dotColors.count - 1) {
            // 显示带文字的提示小圆点
            [btn sd_showAlertDotWithText:@"新" textFontSize:10 topOffset:8 rightOffset:8];
        } else if (idx == dotColors.count - 2) {
            // 显示带文字的提示小圆点
            [btn sd_showAlertDotWithText:@"19" textFontSize:13 topOffset:8 rightOffset:8];
        } else {
            // 限制小圆点高度，文字内容过多会显示椭圆形状
            btn.sd_alertDotMaxHeight = 17;
            // 显示带文字的提示小圆点
            [btn sd_showAlertDotWithText:@"101" textFontSize:13 topOffset:8 rightOffset:8];
        }
        
        btn.sd_alertDotColor = [obj colorWithAlphaComponent:0.6];
    }];
}

- (void)buttonClicked:(UIButton *)btn
{
    if (btn.tag < 2 || btn.tag == 4) {
        // 隐藏小圆点
        [btn sd_hideAlertDot];
    } else {
        NSString *title = btn.sd_alertDotText;
        int value = [title intValue];
        value--;
        if (value > 0) {
            // 显示带文字的提示小圆点
            [btn sd_showAlertDotWithText:[NSString stringWithFormat:@"%d", value] textFontSize:13 topOffset:8 rightOffset:8];
        } else {
            // 隐藏小圆点
            [btn sd_hideAlertDot];
        }
    }
}

@end
