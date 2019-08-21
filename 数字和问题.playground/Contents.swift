import UIKit

//    两个数之和
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let count = nums.count
    var dic = [Int : Int]()
    
    for i in 0..<count {
        dic[nums[i]] = i
    }
    
    for i in 0..<count {
        let found = target - nums[i]
        if let j = dic[found], i != j {
            return [nums[i], nums[j]]
        }
    }
    return []
    
//    var numberIndexDict = [Int:Int]()
//    // 遍历数组
//    for (index, num) in nums.enumerated() {
//        // 判断字典中是否存在key = target - num
//        guard let pairedIndex = numberIndexDict[target - num] else {
//            // 把自身放入hash表
//            numberIndexDict[num] = index
//            continue
//        }
//        // 配对的数已存在
//        return [pairedIndex, index]
//    }
//    return []
}

twoSum([1, 0, -1, 0, -2, 2], 0)

//    三个数之和
func threeSum(_ nums: [Int], _ target: Int) -> [[Int]] {
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

threeSum([1, 0, -1, 0, -2, 2], 0)

//    JavaScript
//let nums = [-1, 0, 1, 2, -1, -4]
//let res = []
//let length = nums.length;
//nums.sort((a, b) => a - b) // 先排个队，最左边是最弱（小）的，最右边是最强(大)的
//if (nums[0] <= 0 && nums[length - 1] >= 0) { // 优化1: 整个数组同符号，则无解
//    for (let i = 0; i < length - 2;) {
//        if (nums[i] > 0) break; // 优化2: 最左值为正数则一定无解
//        let first = i + 1
//        let last = length - 1
//        do {
//            if (first >= last || nums[i] * nums[last] > 0) break // 两人选相遇，或者三人同符号，则退出
//            let result = nums[i] + nums[first] + nums[last]
//            if (result === 0) { // 如果可以组队
//                res.push([nums[i], nums[first], nums[last]])
//                console.log(res)
//            }
//            if (result <= 0) { // 实力太弱，把菜鸟那边右移一位
//                while (first < last && nums[first] === nums[++first]) { } // 如果相等就跳过
//            } else { // 实力太强，把大神那边右移一位
//                while (first < last && nums[last] === nums[--last]) { }
//            }
//        } while (first < last)
//        while (nums[i] === nums[++i]) { }
//    }
//}

//    四个数之和
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    /*
     采用4个指针的形式，前两个遍历，后两个用来检验数据是否正确
     1、i指针从0开始到倒数第三个；
     2、j指针从i后面开始到倒数第二个；
     3、left从前往后，right从后往前，活动范围是从j开>始到最后，left和right类似两数之和的问题。
     */
    let length = nums.count
    if length < 4 {
        return []
    }
    var nums = nums.sorted()
    var res : [[Int]] = [[Int]]()
    for i in 0..<length-2 {
        //取出指针i可能重复的情况
        if i != 0 && nums[i] == nums[i-1]{
            continue
        }
        for j in i+1..<length{
            // 去除j可能重复的情况
            if j != i+1 && nums[j] == nums[j-1]{
                continue
            }
            
            var left = j+1
            var right = length-1
            
            while left<right{
                //不满足条件或者重复的，继续遍历
                if (left != j+1 && nums[left]==nums[left-1]) || (nums[i]+nums[j]+nums[left]+nums[right]<target){
                    left += 1
                }else if (right != length-1 && nums[right]==nums[right+1]) || (nums[i]+nums[j]+nums[left]+nums[right]>target){
                    right -= 1
                }else{
                    res.append([nums[i], nums[j], nums[left], nums[right]])
                    
                    //满足条件，进入下一次遍历
                    left += 1
                    right -= 1
                }
            }
        }
    }
    return res
}

fourSum([1, 0, -1, 0, -2, 2], 0)


//参考leetCode & https://blog.csdn.net/lin1109221208/article/details/98504156
func kSum (_ nums: [Int], _ target: Int, _ k: Int) -> [[Int]] {
    var nums = nums.sorted()
    var stack: [Int] = [Int].init(repeating: 0x3f3f3f3f, count: k)
    var stack_index : Int = -1
    var begin = 0
    
    //递归开始
    var ans : [[Int]] = K_Sum_Recursive(nums, &stack, &stack_index, k, begin, target)//K_Sum_Recursive(nums, &stack, &stack_index, k, begin, target)
    return ans
}
var stack: [Int] = [Int].init(repeating: 0x3f3f3f3f, count: 3)
var stack_index : Int = -1

kSum([1, 0, -1, 0, -2, 2], 0, 3)

/**
 * K数之和问题的模板方法，所有K数问题都可以调用这个方法
 * @param nums 输入的数组
 * @param stack 定义的一个长度为 k_sum 问题中的 k 的数组，初始化为0x3f3f3f3f
 * @param stack_index 栈指针，初始化值为-1
 * @param k 表明当前问题被 分解/递归 成了 k数之和 的问题
 * @param begin 当前问题要固定的值的起点
 * @param target 当前 k数之和 的目标和
 * @return 当前 k数之和 的解集，要在上一层合并到最终解集里去
 */
func K_Sum_Recursive(_ nums: [Int], _ stack: inout [Int], _ stack_index: inout Int, _ k: Int, _ start: Int, _ target: Int)->[[Int]]{
    var ans : [[Int]] = [[Int]]()
    //当递归到两数之和时，不再进行递归，直接使用左右指针法解决
    if k==2 {
        var temp_ans : [Int]
        var left = start
        var right = nums.count-1
        while left<right{
            if nums[left]+nums[right]>target{
                //过大，右指针左移
                right -= 1
            }else if nums[left]+nums[right]<target{
                //过小，左指针右移
                left += 1
            }else{
                //相等，加入序列，左右指针同时向内移动一次
                temp_ans = [Int]()
                stack_index += 1
                stack[stack_index] = nums[left]
                stack_index += 1
                stack[stack_index] = nums[right]
                
                //当前栈中的元素符合要求，将其加入list中，并将list加入当前问题的解集
                for i in 0...stack_index{
                    temp_ans.append(stack[i])
                }
                ans.append(temp_ans)
                
                //栈的清理工作
                stack[stack_index] = 0x3f3f3f3f
                stack_index -= 1
                stack[stack_index] = 0x3f3f3f3f
                stack_index -= 1
                
                left += 1
                right -= 1
                while left<right && nums[left]==nums[left-1]{
                    left += 1
                }
                while left<right && right<nums.count-1 && nums[right]==nums[right+1]{
                    right -= 1
                }
                
//                var i = start
//                var j = length-1
//                while i < j {
//                    if (nums[i] + nums[j] == target) {
//                        ans.append([nums[i], nums[j]])
//                        while( i<j && nums[i] == nums[i+1] ) { i = i + 1 }
//                        while( i<j && nums[j] == nums[j-1] ) { j = j - 1 }
//                        i += 1
//                        j -= 1
//                    }else if (nums[i] + nums[j] < target){
//                        i += 1
//                    }else if (nums[i] + nums[j] > target) {
//                        j -= 1
//                    }
//                }

                
            }
        }
    }else{
        var target_temp : Int
        for i in start..<nums.count-k+1{
            if i > start && nums[i]==nums[i-1]{
                continue
            }
            
            //在固定一个数后，问题被降级为一个 k-1数之和 的问题
            //确定 k-1数之和 的目标和
            target_temp = target - nums[i]
            //将当前选定的数字压入栈中，便于最后加入解集中
            stack_index += 1
            stack[stack_index] = nums[i]
            //递归调用 k-1数之和 的问题求解
            var ans_temp = K_Sum_Recursive(nums, &stack, &stack_index, k-1, i+1, target_temp)
            //选定当前数字的情况下，k-1数之和 问题求解完毕
            //将该数字出栈，为选择下一个备选值做准备
            stack[stack_index] = 0x3f3f3f3f
            stack_index -= 1
            //将当前解集加入当前 k数之和 的解集中
            ans.append(contentsOf: ans_temp)
        }
    }
    return ans
}





