import UIKit


class Solution {
//    两个数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //         let count = nums.count
        //         var dic = [Int : Int]()
        
        //         for i in 0..<count {
        //             dic[nums[i]] = i
        //         }
        
        //         for i in 0..<count {
        //             let found = target - nums[i]
        //             if let j = dic[found], i != j {
        //                 return [i, j]
        //             }
        //         }
        //         return []
        var numberIndexDict = [Int:Int]()
        // 遍历数组
        for (index, num) in nums.enumerated() {
            // 判断字典中是否存在key = target - num
            guard let pairedIndex = numberIndexDict[target - num] else {
                // 把自身放入hash表
                numberIndexDict[num] = index
                continue
            }
            // 配对的数已存在
            return [pairedIndex, index]
        }
        return []
    }
    
//    三个数之和
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res : [[Int]] = [[Int]]()
        if (nums.count == 0) {return []}
        let nums = nums.sorted{(a, b) -> Bool in return a < b}
        let length = nums.count
        for i in 0..<length {
            if (nums[i] > 0) {break;}
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var first = i + 1
            var last = length - 1
            while(first < last) {
                let result = nums[i] + nums[first] + nums[last]
                if (result == 0) {
                    res.append([nums[i], nums[first], nums[last]])
                    while (first < last && nums[first] == nums[first + 1]) {
                        first = first + 1
                    }
                    while (first < last && nums[last] == nums[last - 1]) {
                        last = last - 1
                    }
                    first = first + 1
                    last = last - 1
                }else if (result > 0) {
                    last = last - 1
                }else {
                    first = first + 1
                }
                
            }
            
        }
        return res
    }
}
