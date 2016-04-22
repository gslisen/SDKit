//
//  UIView+SDAlertDotView.h
//  SDKit
//
//  Created by gsd on 16/4/21.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SDAlertDotView)

#pragma mark -- 基本方法

/** 添加一个提示小圆点到调用此方法的view上（默认在父view右上方显示，距离父view上0右0，可以传递float类型的参数topOffset、rightOffset调整小圆点位置） */
- (void)sd_showAlertDotWithDotSize:(CGSize)size topOffset:(CGFloat)topOffset rightOffset:(CGFloat)rightOffset;

/** 添加一个提示小圆点到调用此方法的view上（默认在父view右上方显示，距离父view上0右0，可以传递float类型的参数topOffset、rightOffset调整小圆点位置） */
- (void)sd_showAlertDotWithText:(NSString *)text textFontSize:(CGFloat)fontSize topOffset:(CGFloat)topOffset rightOffset:(CGFloat)rightOffset;

/** 删除view上的提示小圆点 */
- (void)sd_hideAlertDot;

@property (nonatomic, readonly) BOOL sd_isShowingAlertDot;

#pragma mark -- 扩展方法

/** 设置提示小圆点的颜色 */
@property (nonatomic) UIColor *sd_alertDotColor;

/** 返回提示小圆点（UIButton类型） */
- (UIButton *)sd_alertDotButton;

/** 设置提示小圆点显示的文字 */
@property (nonatomic) NSString *sd_alertDotText;

/** 设置提示小圆点显示的文字的颜色 */
@property (nonatomic) UIColor *sd_alertDotTextColor;

/** 当文字较多时maxHeight限制小圆点高度从而呈现椭圆式形状 */
@property (nonatomic) CGFloat sd_alertDotMaxHeight;

@end
