//
//  CommonSuperFind.m
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/28.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "CommonSuperFind.h"

@implementation CommonSuperFind

//连个view的公共父视图
- (NSArray<UIView *> *)findCommonSuperView: (UIView *)view other: (UIView *)otherView {
    NSMutableArray *result = [NSMutableArray new];
    NSArray *one = [self findSuperView:view];
    NSArray *two = [self findSuperView:otherView];
    
    int i = 0;
    //i小于两个父视图中最小的一个长度
    while (i < MIN((int)one.count, (int)two.count)) {
        //倒序取出父视图
        UIView *superOne = [one objectAtIndex:one.count - i - 1];
        UIView *superOther = [two objectAtIndex:two.count - i - 1];
        if (superOne == superOther) {
            [result addObject:superOne];
            i++;
        }else {
            break;
        }
    }
    return result;
    
}

- (NSArray<UIView *> *)findSuperView: (UIView *)view {
    UIView *tempSuper = view.superview;
    NSMutableArray *result = [NSMutableArray new];
    while (tempSuper) {
        [result addObject:tempSuper];
        tempSuper = tempSuper.superview;
    }
    return result;
}


@end
