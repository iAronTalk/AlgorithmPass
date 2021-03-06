# 300.Longest Increasing Subsequence - Medium
**最长上升子序列**
给定一个无序的整数数组，找到其中最长上升子序列的长度。
```
示例:

输入: [10,9,2,5,3,7,101,18]
输出: 4
解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
说明:

可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
你算法的时间复杂度应该为 O(n2) 。
进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?
```
**可能解法**

- 暴力递归
- DP

**CODINNG**

```
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }

        var dp = [Int].init(repeating: 1, count: nums.count + 1)
        var res = 1
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[j] + 1, dp[i])
                }
            }
            res = max(dp[i], res)
        }

        return res
    }
}
```
