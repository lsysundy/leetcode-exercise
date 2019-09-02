//
//  MObject.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/8/30.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "MObject.h"

@implementation MObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = 0;
    }
    return self;
}

- (void)increase {

    [self willChangeValueForKey:@"value"];
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

//- (void)setValue:(int)value {
//    NSLog(@"%d", value);
//}

@end
