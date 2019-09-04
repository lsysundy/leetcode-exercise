//
//  NSTimer+WeakTimer.h
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/3.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (WeakTimer)

+ (NSTimer *)scheduldWeakTimerWithTimerInterval:(NSTimeInterval)interval
                                         target:(id)aTarget
                                       selector:(SEL)aSelector
                                       userInfo:(id)userInfo
                                        repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
