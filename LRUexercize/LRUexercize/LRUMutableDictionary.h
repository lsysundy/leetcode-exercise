//
//  LRUMutableDictionary.h
//  LRUexercize
//
//  Created by 刘帅仪 on 2019/9/18.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRUMutableDictionary : NSMutableDictionary

@property (nonatomic, assign, readonly)NSUInteger count;

// maxCountLRU: 执行LRU算法时的最大存储的元素数量
- (instancetype)initWithMaxCountLRU: (NSUInteger)maxCountLRU;

- (NSEnumerator *)keyEnumerator;

@end

NS_ASSUME_NONNULL_END
