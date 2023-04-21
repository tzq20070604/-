//
//  main.swift
//  算法练习
//
//  Created by tangzhiqiang on 2023/4/20.
//



import Foundation


// 剑指 Offer 03. 数组中重复的数字
// https://leetcode.cn/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/%20class%20Solution%20%7B/
func test03() {
    func findRepeatNumber(_ nums: [Int]) -> Int {
             var set = Set<Int>()
             for num in nums {
                 if set.contains(num) {
                     return num
                 } else {
                     set.insert(num)
                 }
             }
        return 0
    }
   let num = findRepeatNumber([1,2,2,3])
   print(num)
}


func test04() {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        var find = false
        //  一维数组的个数
        var n = matrix.count
        if n == 0 {return find}
        
        // 第1列的个数
        var m = matrix[0].count
        
        if m == 0 {return find}
        var first = matrix[0][0]
        var last = matrix[n - 1][m - 1]
        if target < first || target > last {return find}
        var col = 0
        for (index, value) in matrix[0].enumerated() {
            if value == target {
                return true
            } else if (value > target) {
                col = index;
                break;
            }
        }
        if col == 0 { col = m - 1}
        
        var row = 0
        for i in 0 ... n - 1 {
            if matrix[i][0] == target {
                return true
            } else if (matrix[i][0] > target) {
                row = i;
                break;
            }
        }
        if row == 0 { row = n - 1}
        
        // 这个值在 row 和 col 之间
        for i in 0 ... row {
            for j in 0 ... col {
                if matrix[i][j] == target {
                    return true
                }
            }
        }
        
        return find
    }
    
   let find = findNumberIn2DArray([[5], [6]], 6)
    print(find)
}

func test05() {
    func replaceSpace(_ s: String) -> String {
        var result = ""
        for c in s {
            if c == " " {
                result.append("%20")
                
            } else {
                result.append(c)
            }
        }
       return result
    }
    let str = replaceSpace("aaa bbb")
    print(str)
}


func test06() {
     class ListNode {
          public var val: Int
          public var next: ListNode?
          public init(_ val: Int) {
          self.val = val
          self.next = nil
        }
    }
    
    func reversePrint(_ head: ListNode?) -> [Int] {
        var tmp = head?.next
        var newHead = head
        newHead?.next = nil
        while tmp != nil {
            var next = tmp?.next
            tmp?.next = newHead
            newHead = tmp
            tmp = next
        }
        
        var arr = [Int]()
        while newHead != nil {
            arr.append(newHead!.val)
            newHead = newHead?.next
        }
        return arr
    }
}

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
    
func test07() {
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var dict = [Int : Int]()
        for (index, value) in inorder.enumerated() {
            dict[value] = index
        }
        return buildTreeWithBounds(preorder: preorder, inorder: inorder, preLeft: 0, preRight: preorder.count - 1, inLeft: 0, inRight: preorder.count - 1, dict:dict)
    }
    
    func buildTreeWithBounds(preorder: [Int], inorder: [Int], preLeft:Int, preRight:Int, inLeft:Int, inRight:Int, dict:[Int : Int]) -> TreeNode? {
        // 1. 找出跟节点
        if (preLeft > preRight) {return nil}
        var rootNode = TreeNode(preorder[preLeft])
        
        // 2.根据根节点在中序遍历中的位置 找出中序遍历的 左子树和右子树
        var rootIndex = dict[preorder[preLeft]]!
        // 根据左子树和右子树，找出前序遍历的左子树和右子树
        var preLeft1 =  preLeft + 1
        var preRight1 = preLeft + rootIndex - inLeft
        var inLeft1 =  inLeft
        var inRight1 = rootIndex - inLeft - 1
        
        
        var preLeft2 =  preLeft + rootIndex - inLeft + 1
        var preRight2 = preRight
        var inLeft2 =  rootIndex + 1
        var inRight2 = inRight
        
        // 根据前序遍历的左子树和中序遍历的左子树，恢复左子树
        rootNode.left = buildTreeWithBounds(preorder: preorder, inorder: inorder, preLeft: preLeft1, preRight: preRight1, inLeft: inLeft1, inRight: inRight1, dict: dict)
        rootNode.right = buildTreeWithBounds(preorder: preorder, inorder: inorder, preLeft: preLeft2, preRight: preRight2, inLeft: inLeft2, inRight: inRight2, dict: dict)
        // 根据前序遍历的右子树和中序遍历的右子树，恢复右子树
        return rootNode
    }
}

func test09() {
    class CQueue {
        var stack1 = [Int]()
        var stack2 = [Int]()
        init() {

        }
        // 栈只有pop和push操作，队列尾部加，头部删除
        // 插入
        func appendTail(_ value: Int) {
            stack1.append(value)
        }
        
        func deleteHead() -> Int {
            if stack2.last != nil {
                return stack2.removeLast()
            } else {
                while stack1.last != nil {
                    stack2.append(stack1.last!)
                    stack1.removeLast()
                }
                if stack2.last != nil {
                    return stack2.removeLast()
                }
            }
            return -1
        }
    }
}

func test10_i() {
        var sum1:Int = 0 // 前一项
        var sum2:Int = 1 // 后一项
        var sum:Int = 0
        func fib(_ n: Int) -> Int {
            if n <= 1 { return n}
            for _ in 2 ... n {
               sum = sum1 + sum2
               if (sum >= 1000000007) {
                   sum = sum % 1000000007
               }
               sum1 = sum2
               sum2 = sum
            }
            return sum
        }
}

func test10_ii() {
    var step1 = 1 // 前1项
        var step2 = 1 // 后1项
        var step = 0 // 当前项
        func numWays(_ n: Int) -> Int {
            if n == 0 {return 1}
            if n == 1 {return 1}
            for _ in 2 ... n {
                step = step1 + step2
                if (step > 1000000007) {
                    step = step % 1000000007
                }
                step1 = step2
                step2 = step
            }
            return step
        }
}

func test11() {
    // 2分法，关键在于确定中点
    func minArray(_ numbers: [Int]) -> Int {
            if (numbers.isEmpty) {
                return 0
            } else if (numbers.count == 1) {
                return numbers[0]
            }
            return find(numbers: numbers, left: 0, right: numbers.count - 1)
        }
        
        func find(numbers: [Int], left:Int, right:Int) -> Int {
            if left == right {
                return numbers[right]
            } else {
               var mid = (left + right) / 2
                if numbers[mid] > numbers[right] {
                   return find(numbers: numbers, left: mid + 1, right: right)
                } else if (numbers[mid] < numbers[right]) {
                   return find(numbers: numbers, left: left, right: mid)
                } else {
                    var i = numbers[left]
                    for tmp in numbers {
                       if tmp < i {
                           i = tmp
                       }
                    }
                    return i
                }
            }
        }
}

func test12() {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let wordArr = Array(word)
        for indexRow in 0 ..< board.count {
            for indexCol in 0 ..< board[0].count {
              let find = findCh(board: board, wordArr: wordArr, atIndex: 0, row:indexRow, col: indexCol, hasInArr:[])
                if find {
                    return find
                }
            }
        }
        return false
    }
    
    func findCh(board:[[Character]], wordArr:[Character], atIndex:Int, row:Int, col:Int, hasInArr:[(Int, Int)]) -> Bool {
        if atIndex >= wordArr.count {
            return true
        }
        
        if row < 0 || row > board.count - 1 || col < 0 || col > board[0].count - 1 {
            return false
        }
        
        if board[row][col] != wordArr[atIndex] {
            return false
        }
        let hasIn = hasInArr.contains(where: { (row1, col1) in
            return (row1, col1) == (row, col)
        })
        if hasIn { return false }
        var locationArr = hasInArr
        locationArr.append((row, col))
        for location in [(row - 1, col), (row + 1, col), (row, col - 1), (row, col + 1)] {
            let find = findCh(board: board, wordArr:wordArr, atIndex: atIndex + 1, row:location.0, col:location.1, hasInArr:locationArr)
            if find { return true }
        }
        return false
    }
   var exist = exist([["C","A","A"],["A","A","A"],["B","C","D"]], "AAB")
   print(exist)
}

// DFS
func test13() {
        var hasInArr = [(Int, Int)]()
        var curNode = (0, 0)
        
        func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
            return goNode(curNode:curNode, m: m, n: n, k: k)
        }
       
        // 能否达到当前的点 达到1 不能达到0
        func goNode(curNode:(Int, Int),m: Int, n: Int, k: Int) -> Int {
            if (curNode.0 < 0 || curNode.0 > m - 1 || curNode.1 < 0 || curNode.1 > n - 1) {
                return 0
            }
            let contain = hasInArr.contains { (a, b) in
                return (a, b) == (curNode.0, curNode.1)
            }
            if contain { return 0}
            
            if (curNode.1 / 10 + curNode.1 % 10 + curNode.0 / 10 + curNode.0 % 10) > k {
                return 0
            }

            hasInArr.append(curNode)
            print("\(curNode.0) +++++++++++ \(curNode.1)")
            
            var nextLocations = [(curNode.0, curNode.1 + 1), (curNode.0 + 1, curNode.1)]
            return 1 + goNode(curNode:nextLocations[0],m: m, n: n, k: k)
                     + goNode(curNode:nextLocations[1],m: m, n: n, k: k)
        }
    print(movingCount(16, 8, 4))
}

// BFS
func test13_1() {
        var hasInArr = [(Int, Int)]()
        var queue = [(Int, Int)]()
        func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
            queue.append((0, 0))
            while !queue.isEmpty {
                let curNode = queue.remove(at: 0)
                if (curNode.0 < 0 || curNode.0 > m - 1 || curNode.1 < 0 || curNode.1 > n - 1) {
                    continue
                }
                let contain = hasInArr.contains { (a, b) in
                    return (a, b) == (curNode.0, curNode.1)
                }
                if contain { continue }
                
                if (curNode.1 / 10 + curNode.1 % 10 + curNode.0 / 10 + curNode.0 % 10) > k {
                    continue
                }
                hasInArr.append(curNode)
                queue.append((curNode.0, curNode.1 + 1))
                queue.append((curNode.0 + 1, curNode.1))
            }
            return hasInArr.count
        }
       
    print(movingCount(16, 8, 4))
}

test13_1()

func test14() {
    
}
