//
//  CustomButton.m
//  Event
//
//  Created by 刘帅仪 on 2019/8/29.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.userInteractionEnabled || [self isHidden] || self.alpha <= 0.01) {
        return  nil;
    }
    
    if ([self pointInside:point withEvent:event]) {
        __block UIView *hit = nil;
        //遍历子视图
        //NSEnumerationReverse：倒序遍历
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //点击的点转换到对应子视图的坐标
            CGPoint vonvertPoint = [self convertPoint:point toView:obj];
            hit = [obj hitTest:vonvertPoint withEvent:event];
            if (hit) {
                *stop = YES;
            }
        }];
        
        if (hit) {
            return hit;
        }else {
            return self;
        }
        
    }else {
        return nil;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    
    CGFloat x2 = self.frame.size.width / 2;
    CGFloat y2 = self.frame.size.height / 2;
    
    //平方差公式 =>计算当前点击的点到方形button中心点的距离
    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    if (dis <= self.frame.size.width / 2) {
        return YES;
    }else {
        return NO;
    }
}

@end
