//
//  BaseObjectA.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "BaseObjectA.h"

@implementation BaseObjectA

/*
    A1 -->B1、B2、B3    3种
    A2 -->B1、B2、B3    3种
    A3 -->B1、B2、B3    3种
 */

- (void)handle {
    //override to subClass
    
    [self.objB fetchData];
}

@end
