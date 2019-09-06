//
//  MCObject.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/5.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "MCObject.h"

@implementation MCObject

static NSThread *thread = nil;

//标记是否要继续时间循环
static BOOL runAlways = YES;

+(NSThread *)threadForDispatch {
    if (thread == nil) {
//        线程安全的方式设置thread
        @synchronized (self) {
            if (thread == nil) {
                thread = [[NSThread alloc] initWithTarget:self selector:@selector(runRequest) object:nil];
                [thread setName:@"com.imooc.thread"];
                [thread start];
            }
        }
    }
    return thread;
}

+ (void)runRequest {
//    创建source, source的上下文，
    CFRunLoopSourceContext context = {0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
    CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
//    创建runloop，同时向runloop的defaultMode下面添加source
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    
//    如果可以运行
    while (runAlways) {
//        每次运行循环一圈都可以对runloop进行释放
        @autoreleasepool {
//            令当前runloop运行在defaultMode下面，添加和运行需要在相同mode下，否则会产生while死循环
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
        }
    }
    
//    某一时期 静态变量runAlways = NO时 可以保证跳出runloop，线程退出
    CFRunLoopRemoveSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    CFRelease(source);
}

@end
