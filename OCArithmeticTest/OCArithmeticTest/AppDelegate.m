//
//  AppDelegate.m
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/26.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "AppDelegate.h"
#import "ReverseString.h"
#import "ReverseList.h"
#import "MergeSortedList.h"
#import "HashFind.h"
#import "mediumFind.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    字符串反转
//    char ch[] = "hello,world";
//    char_reverse(ch);
//    printf("reverse result is %s \n ", ch);
    
//    数组反转
//    ReverseList *list = [ReverseList new];
//    [list traverseLink];
    
//    有序数组合并
//    int a[5] = {1,4,6,7,9};
//    int b[8] = {2,3,5,6,8,10,11,12};
//    int result[13];
//    mergeList(a, 5, b, 8, result);
//    for (int i = 0; i < 13; i++) {
//        printf("%d ", result[i]);
//    }
    
//    hash算法 求字符串第一个出现的不重复字符
//    char cha[] = "abaccdeff";
//    char fc = findFirstChar(cha);
//    printf("this char is : %c", fc);
    
//    求无序数组中的中位数
    int list[9] = {12, 3, 10, 8, 6, 7, 11, 13, 9};
    int list1[10] = {12, 3, 10, 8, 6, 7, 11, 13, 9, 4};
    int medium = findMedium(list, 9);
    int medium1 = findMedium(list1, 10);
    printf("jishu the medium is %d\n", medium);
    printf("oushu the medium is %d", medium1);
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
