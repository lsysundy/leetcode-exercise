//
//  GroupObject.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/4.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "GroupObject.h"

@interface GroupObject ()
{
    dispatch_queue_t concurrent_queue;
    NSMutableArray <NSURL *> *arrayURLs;
}
@end

@implementation GroupObject

- (instancetype)init {
    if (self = [super init]) {
        concurrent_queue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
        arrayURLs = [NSMutableArray array];
    }
    return self;
}

- (void)handle {
//    创建一个group
    dispatch_group_t group = dispatch_group_create();
//    for循环遍历各个元素执行操作
    for (NSURL *url in arrayURLs) {
//        异步组分派到并发队列中
        dispatch_group_async(group, concurrent_queue, ^{
            NSLog(@"url is %@",url);
        });
    }
    
    dispatch_group_notify(group, concurrent_queue, ^{
//        添加到组中的所有任务执行完成后调用该block
        NSLog(@"所有图片下载完成");
    });
}

@end
