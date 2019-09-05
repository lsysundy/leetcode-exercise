//
//  UserCenter.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/4.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "UserCenter.h"

@interface UserCenter ()
{
//    定义一个并发队列
    dispatch_queue_t concurrent_queue;
//    用户数据中心，可以多线程需要数据访问
    NSMutableDictionary *userCenterDic;
}
@end

@implementation UserCenter

- (instancetype)init{
    if (self = [super init]) {
        concurrent_queue = dispatch_queue_create("read_write_queue", DISPATCH_QUEUE_CONCURRENT);
        userCenterDic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id)objectForKey: (NSString *)key {
    
    __block id obj;
//    同步读取执行数据
    dispatch_sync(concurrent_queue, ^{
        obj = [userCenterDic objectForKey:key];
    });
    return obj;
}

- (void)setObject: (id)obj forKey: (NSString *)key {
//    一步栅栏调用设置数据
    dispatch_barrier_sync(concurrent_queue, ^{
        [userCenterDic setObject:obj forKey:key];
    });
}

@end
