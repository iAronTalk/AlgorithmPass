import UIKit

/*
 找出数组中重复的数字。

 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。
 示例 1：
 输入：
 [2, 3, 1, 0, 2, 5, 3]
 输出：2 或 3
  
 限制：
 2 <= n <= 100000
 */
//leetcode链接：https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/

 class Solution {
     func findRepeatNumber(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return -1
        }
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return num
            } else {
                set.insert(num)
            }
        }
        return -1
     }
 }
