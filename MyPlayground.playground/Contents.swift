import UIKit

/*var str = "Hello, playground"

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack:[String] = []
        var initialParentheses:[String: String] = [")":"(","]":"[","}":"{"]
        
        for c in s {
            if !initialParentheses.keys .contains(String(c)) {
                stack.append(String(c));
            } else if stack.count > 0 && initialParentheses[String(c)] != stack.removeLast() {
                return false
            }
        }
        
        if stack.count == 0 {
            return true;
        } else {
            return false
        }
    }
}

let solution = Solution.init()
let flag = solution.isValid("{(})")
print(flag)

class MyQueue {

    /** Initialize your data structure here. */
     var inputStack = [Int]()
     var outputStack = [Int]()
    init() {
    
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        self.inputStack.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        
        
        if self.outputStack.count > 0 {
            return self.outputStack.removeLast()
        } else {
            while self.inputStack.count > 0 {
                self.outputStack.append(self.inputStack.removeLast())
            }
            return self.outputStack.removeLast()
        }
    }
    
    /** Get the top element. */
    func peek() -> Int {
        
        if self.outputStack.count > 0 {
            return self.outputStack.last ?? 0
        } else {
            while self.inputStack.count > 0 {
                self.outputStack.append(self.inputStack.removeLast())
            }
            return self.outputStack.last ?? 0
        }
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        if self.outputStack.count > 0 {
            return false
        } else if (self.inputStack.count > 0) {
            return false
        } else {
            return true
        }
    }
}

let myQueue = MyQueue()
print(myQueue.empty())

myQueue.push(2)
print(myQueue.empty())
let peek = myQueue.peek()
print(peek)

let pop = myQueue.pop()
print(pop)
print(myQueue.empty())
*/

//class Solution {
//    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//        if nums.count <= 0 {
//            return []
//        }
//
//        var window = [Int]()
//        var res = [Int]()
//
//        var index = 0
//        for x in nums {
//
//            if let windowFirst = window.first, index >= k && windowFirst <= index - k {
//                window.removeFirst()
//            }
//
//            while window.count > 0 &&  nums[window.last!] <= x {
//                window.popLast()
//            }
//            window.append(index)
//
//            if index >= k - 1 {
//                res.append(nums[window.first!])
//            }
//            index = index + 1
//        }
//        return res
//    }
//}

class Solution1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var sMap = [Character:Int]()
        var tMap = [Character:Int]()
        
        for c in s {
            if let cNum = sMap[c] {
                sMap[c] = cNum + 1
            } else {
                sMap[c] = 1
            }
        }
        
        for c in t {
            if let cNum = tMap[c] {
                tMap[c] = cNum + 1
            } else {
                tMap[c] = 1
            }
        }
        
        return sMap == tMap
    }
}

class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()
        var index = 0
        for i in nums {
            let complement = target - nums[index]
            if map.keys.contains(complement) {
                return [map[complement]!,index]
            }
            map[i] = index
            index = index + 1
        }
        
        return []
    }
}

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted {$0 < $1}
        print("sortedNums = \(sortedNums)")
        var res = [[Int]]()
        var index = 0
        for i in sortedNums {
            //这点非常重要，下一个元素与上一个一样，跳过。
            if index > 0 && sortedNums[index] == sortedNums[index - 1] {
                index = index + 1
                continue
            }
            
            if index >= sortedNums.count - 2 {
                break
            }
            
            var left = index + 1
            var right = sortedNums.count - 1
            while left < right {
                let sum = sortedNums[left] + sortedNums[right] + i
                if sum < 0 {
                    left = left + 1
                } else if sum > 0  {
                    right = right - 1
                } else {
                    res.append([i,sortedNums[left],sortedNums[right]])
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        left = left + 1
                    }
                    
                    while left < right && sortedNums[right] == sortedNums[right - 1] {
                        right = right - 1
                    }
                    left = left + 1
                    right = right - 1
                }
            }
            
            index = index + 1
        }
        
        return res
    }
}

var solution = Solution()
let res = solution.threeSum([0,-4,-1,-4,-2,-3,2])
print(res)

