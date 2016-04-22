//
//  UIView+SDViewToolsBasic.m
//  SDKit
//
//  Created by gsd on 16/4/19.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import "UIView+SDViewToolsBasic.h"
#import <objc/runtime.h>

@implementation SDViewToolsCategoryPropertiesManager

- (UIButton *)alertDotButton
{
    if (!_alertDotButton) {
        _alertDotButton = [UIButton new];
    }
    return _alertDotButton;
}

@end

@implementation UIView (SDViewToolsBasic)

- (SDViewToolsCategoryPropertiesManager *)sd_categoryPropertiesManager
{
    SDViewToolsCategoryPropertiesManager *manager = objc_getAssociatedObject(self, _cmd);
    if (!manager) {
        manager = [SDViewToolsCategoryPropertiesManager new];
        objc_setAssociatedObject(self, _cmd, manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return manager;
}

@end
