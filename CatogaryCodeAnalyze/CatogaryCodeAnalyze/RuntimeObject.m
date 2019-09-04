//
//  RuntimeObject.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/2.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "RuntimeObject.h"
#import <objc/runtime.h>

@implementation RuntimeObject

//实现交换
+(void)load {
    Method test = class_getClassMethod(self, @selector(test));
    Method otherTest = class_getClassMethod(self, @selector(otherTest));
    method_exchangeImplementations(test, otherTest);
}

void testIMP(void) {
    NSLog(@"test invoke");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(test)) {
        NSLog(@"resolveInstanceMethod:");
        
        //动态添加test实现
        class_addMethod(self, @selector(test), testIMP, "v@:");
        
        return YES;
    }else {
        return [super resolveInstanceMethod:sel];
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector:");
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        NSLog(@"methodSignatureForSelector");
        //v代表返回值是void @代表第一个参数类型是id类型，即self  :代表第二个参数是SEL类型的 即@selector(test)
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else {
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation:");
}



- (void)otherTest {
    [self otherTest];
    NSLog(@"otherTest");
}


@end
