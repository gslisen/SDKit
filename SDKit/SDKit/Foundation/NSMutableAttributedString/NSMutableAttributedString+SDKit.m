//
//  NSMutableAttributedString+SDKit.m
//  SDKit
//
//  Created by 陈华荣 on 16/4/19.
//  Copyright © 2016年 gsd. All rights reserved.
//

#import "NSMutableAttributedString+SDKit.h"

@implementation NSMutableAttributedString (SDKit)

- (instancetype)initWithStrings:(NSArray<NSString *> *)texts attributesArray:(NSArray<NSDictionary<NSString *,id> *> *)attrsArray withSpace:(NSArray<NSNumber *> *)space{
    
    if (self = [super init]) {

    }
    return [self go:texts andAttributesArray:attrsArray withSpace:space];
}

- (instancetype)go:(NSArray *)textArray andAttributesArray:(NSArray *)attrsArray withSpace:(NSArray<NSNumber *> *)space{
    
    
    __block NSMutableAttributedString *string = [[NSMutableAttributedString alloc]init];
    
    __weak typeof(self)weakSelf = self;
    [textArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSUInteger attrsCount = attrsArray.count;
        if (idx <= (attrsCount-1) ) {
            [string appendAttributedString:[strongSelf initWithString:obj attributes:attrsArray[idx]]];
        }else{
            [string appendAttributedString:[strongSelf initWithString:obj attributes:attrsArray[attrsCount-1]]];
        }
        
        if (idx != textArray.count-1 && idx <= space.count-1) {
            [string appendAttributedString:[self spaceWidthWithNumberBlackSpace:space[idx]]];
        }else{
            [string appendAttributedString:[self spaceWidthWithNumberBlackSpace:0]];
        }
    }];
    
    return string;
}

- (NSMutableAttributedString *)spaceWidthWithNumberBlackSpace:(NSNumber *)number{
    NSString *string = @"";
    NSUInteger count = [number integerValue];
    for (NSUInteger i = 0;i < count ; i++) {
        string = [string stringByAppendingFormat:@" "];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    return attributedString;
}

@end
