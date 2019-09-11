//
//  BridgeDemo.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "BridgeDemo.h"
#import "ObjectA1.h"
#import "ObjectA2.h"
#import "ObjectB1.h"
#import "ObjectB2.h"

@interface BridgeDemo ()

@property (nonatomic, strong)BaseObjectA *objA;

@end

@implementation BridgeDemo

/*
    根据实际业务判断使用哪套具体数据
    A1 -->B1、B2、B3    3种
    A2 -->B1、B2、B3    3种
    A3 -->B1、B2、B3    3种
 */

- (void)fetch {
    //创建一个具体的classA
    _objA = [ObjectA1 new];
    //创建一个具体的classB
    BaseObjectB *b1 = [ObjectB1 new];
    //讲一个具体的classB1指定给抽象的classB
    _objA.objB = b1;
    [_objA handle];
}

@end
