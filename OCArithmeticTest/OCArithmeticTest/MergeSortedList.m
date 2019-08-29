//
//  MergeSortedList.m
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/28.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "MergeSortedList.h"

@implementation MergeSortedList

void mergeList(int a[], int aLength, int b[], int bLength, int result[]) {
    int p = 0;
    int q = 0;
    int i = 0;
    
    while (p < aLength && q < bLength) {
        if (a[p] <= b[q]) {
            result[i] = a[p];
            p++;
        }else {
            result[i] = b[q];
            q++;
        }
        i++;
    }
    
    while (p < aLength) {
        result[i] = a[p++];
        i++;
    }
    
    while (q < bLength) {
        result[i] = b[q++];
        i++;
    }
    
}


@end
