//
//  UIView+SDViewToolsBasic.h
//  SDKit
//
//  Created by gsd on 16/4/19.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"

/** 
 将你需要给category添加的实例属性直接添加到这里
 例：@property (nonatomic, strong) UIView *sd_leftBorder;
 调用方法：[self.sd_categoryPropertiesManager sd_leftBorder];
 */
@interface SDViewToolsCategoryPropertiesManager : NSObject

@property (nonatomic, strong) UIButton *alertDotButton;

/** 当文字较多时maxHeight限制小圆点高度从而呈现椭圆式形状 */
@property (nonatomic) CGFloat sd_alertDotMaxHeight;

@end





@interface UIView (SDViewToolsBasic)

@property (nonatomic, readonly) SDViewToolsCategoryPropertiesManager *sd_categoryPropertiesManager;



@end
