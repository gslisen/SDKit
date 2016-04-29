/*
 不是我写的  一个老美写的 获取系统导航返回按钮事件
 使用方法
 copy 这2个文件到项目里
 在pop页面（返回页面）复写-(BOOL)navigationShouldPopOnBackButton方法
 https://github.com/gslisen/cailiao.git
 */

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
-(BOOL)navigationShouldPopOnBackButton;
@end

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end
