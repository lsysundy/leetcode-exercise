//
//  CommonSuperFind.h
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/28.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonSuperFind : NSObject

- (NSArray<UIView *> *)findCommonSuperView: (UIView *)view other: (UIView *)otherView;

@end

NS_ASSUME_NONNULL_END
