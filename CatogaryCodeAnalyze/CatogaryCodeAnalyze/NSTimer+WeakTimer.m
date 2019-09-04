//
//  NSTimer+WeakTimer.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/3.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

//中间对象
@interface TimerWeakObject : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;//定时器到时之后的回调方法
@property (nonatomic, weak) NSTimer *timer;

//对持有的target判断，
- (void)fire: (NSTimer *)timer;

@end

@implementation TimerWeakObject

- (void)fire:(NSTimer *)timer {
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
            [self.target performSelector:self.selector withObject:timer.userInfo];
        }
    }else {
        [self.timer invalidate];
    }
}

@end

@implementation NSTimer (WeakTimer)

+ (NSTimer *)scheduldWeakTimerWithTimerInterval:(NSTimeInterval)interval
                                         target:(id)aTarget
                                       selector:(SEL)aSelector
                                       userInfo:(id)userInfo
                                        repeats:(BOOL)repeats {
    
    TimerWeakObject *obj = [TimerWeakObject new];
    obj.target = aTarget;
    obj.selector = aSelector;
    obj.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:obj selector:@selector(fire:) userInfo:userInfo repeats:YES];
    return obj.timer;
    
}
//                             --------
//                             |中间对象| 中间对象持有两个弱引用对象，NSTimer回调是在中间对象中
//                             --------
//                             .弱引用  .
//                            .          .
//  ---------     ---------  .             .-------     -------
//  |RunLoop|     |NSTimer| .               | 对象 |<--- | VC  |
//  ---------     ---------                 -------     -------

@end
