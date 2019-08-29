//
//  mediumFind.m
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/28.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "mediumFind.h"

@implementation mediumFind

int findMedium(int a[], int aLength) {
    int low = 0;
    int high = aLength - 1;
    
    int mid = (aLength - 1)/2;
    int div = ParSort(a, low, high);
    
    while (div != mid) {
        if (mid < div) {
            div = ParSort(a, low, div - 1);
        }else {
            div = ParSort(a, div + 1, high);
        }
    }
    
    return a[mid];
}

int ParSort(int a[], int start, int end) {
    int low = start;
    int high = end;
    int key = a[end];
    
    while (low < high) {
        while (low < high && a[low] <= key) {
            ++low;
        }
        
        while (low < high && a[high] >= key) {
            --high;
        }
        
        if (low < high) {
            int temp = a[low];
            a[low] = a[high];
            a[high] = temp;
        }
    }
    int temp = a[high];
    a[high] = a[end];
    a[end] = temp;
    return low;
}

@end
