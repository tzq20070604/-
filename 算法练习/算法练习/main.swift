//
//  main.swift
//  算法练习
//
//  Created by tangzhiqiang on 2023/4/20.
//



import Foundation

class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
     self.val = val
     self.next = nil
   }
}

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
            
            let nextLocations = [(curNode.0, curNode.1 + 1), (curNode.0 + 1, curNode.1)]
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


func test14_I() {
    func cuttingRope(_ n: Int) -> Int {
            var maxArr = [(Int)](repeating: 0, count: n + 1)
            if (n == 0) {
                return 0
            } else if (n == 1) {
                return 1
            } else if (n == 2) {
                return 1
            }
            maxArr[0] = 0
            maxArr[1] = 1
            maxArr[2] = 1
            for i in 3 ... n {
                for j in 1 ..< i {
                  maxArr[i] = max(j * (i - j), j * maxArr[i - j], maxArr[i])
                }
            }
            return maxArr[n]
        }
}

func test14_II() {
    func cuttingRope(_ n: Int) -> Int {
        if n <= 4 {
            return n
        }
        var maxArr = [(Int)](repeating: 0, count: n + 1)
        maxArr[0] = 0
        maxArr[1] = 1
        maxArr[2] = 2
        maxArr[3] = 3
        maxArr[4] = 4
        
        for i in 5 ... n {
            maxArr[i] = maxArr[i - 3] * 3 % 1000000007
        }
        return maxArr[n]
    }
   print(cuttingRope(120))
}

func test15() {
    func hammingWeight(_ n: Int) -> Int {
      var m = n
      var index = 0
      while m == 0 {
          if (m & 0x01 == 0x01) {
              index = index + 1
          }
          m = m >> 1
      }
      return index
    }
}

func test16() {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 || fabs(x) < Double.leastNonzeroMagnitude {
            return 1.0
        } else if (n > 0) {
            return myPowDfs(x, n)
        } else {
            return 1.0 / myPowDfs(x, -n)
        }
    }
    
    func myPowDfs(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1.0}
        if n == 1 { return x}
        if n & 0x01 == 1 {
            var tmp = myPow(x, (n - 1) >> 1)
            return x * tmp * tmp
        } else {
            var tmp = myPow(x, n >> 1)
            return tmp * tmp
        }
    }
}

func test17() {
    func printNumbers(_ n: Int) -> [Int] {
          var tmp = n
          var count = 1
          while tmp != 0 {
             count = count * 10
             tmp = tmp - 1
          }
          var arr = [Int](repeating: 1, count: count - 1)
          return arr.enumerated().map {
            return $0.offset + 1
          }
    }
    
    func printNumbersString(_ n: Int) -> Void {
          var tmp = n
          var count = 1
          while tmp != 0 {
             count = count * 10
             tmp = tmp - 1
          }
        var ss:[Character] = ["0"]
        for _ in 1 ... count - 1 {
            addOne(numArr: &ss)
        }
    }
    
    func addOne(numArr:inout [Character]) {
        var hasOutput = false
        for i in 0 ... numArr.count - 1 {
            var index = numArr.count - 1 - i
            let ch = numArr[index]
            
            // 处理进位
            if hasOutput {
                if ch == "9" {
                    numArr[index] = "0"
                    hasOutput = true
                } else {
                    numArr[index] = ddd(ch:numArr[index])
                    hasOutput = false
                }
            }
            
            // 处理末位加1
            if (numArr.count - 1 == index) {
                if ch == "9" {
                    numArr[index] = "0"
                    hasOutput = true
                } else {
                    numArr[index] = ddd(ch: numArr[index])
                }
            }
            
            
        }
        if (hasOutput) {
            numArr.insert("1", at: 0)
        }
        print(String(numArr))
    }
    
    func ddd(ch:Character) -> Character {
        let arr:[Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let index = arr.firstIndex(of: ch)!
        return arr[(index + 1) % arr.count]
    }
    print(printNumbersString(4))
}

func test17_I() {
    func printNumbers(_ n: Int) -> [Int] {
        if (n == 0) {return []}
          var tmp = n
          var count = 1
          while tmp != 0 {
             count = count * 10
             tmp = tmp - 1
          }
        var ss:[Character] = ["0"]
        for _ in 1 ... count - 1 {
            opration(numArr:&ss, index:0)
            print(String(ss))
        }
        return [count - 1]
    }
    
    func opration(numArr:inout [Character], index:Int) {
        if (index == numArr.count) {
            numArr.insert("1", at: 0)
            return
        }
        let i = numArr.count - 1 - index
        if numArr[i] == "9" {
            numArr[i] = "0"
            opration(numArr: &numArr, index: index + 1)
        } else {
            numArr[i] = ddd(ch: numArr[i])
        }
    }
    
    func ddd(ch:Character) -> Character {
        let arr:[Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
//      var sss:String = String(arr)
        
        let index = arr.firstIndex(of: ch)!
        return arr[(index + 1) % arr.count]
    }
    
    printNumbers(0)
}


func test18() {
    class ListNode {
         public var val: Int
         public var next: ListNode?
         public init(_ val: Int) {
         self.val = val
         self.next = nil
       }
   }
    
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
            var tmp = head
            var last = tmp
            if tmp?.val == val {
                return tmp?.next
            }
            // 找到
            while tmp != nil {
                if tmp!.val == val {
                    last?.next = tmp?.next
                    break
                } else {
                    last = tmp
                    tmp = tmp?.next
                }
            }
            return head
        }
}

// 层序遍历
func test18_I() {
    class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int) {
            self.val = val
            self.children = []
        }
    }
    
    func levelOrder(_ root: Node?) -> [[Int]] {
        var nodeArr = [[Int]]()
        if root == nil {return nodeArr}
        
        var queue = [Node]()
        queue.append(root!)
        var levelArr = [Int]()
        var curLevelCount = 1
        var curlevel = 1
        var nextLevelCount = 0
        while !queue.isEmpty {
           var node = queue.removeFirst()
            curLevelCount = curLevelCount - 1
            levelArr.append(node.val)
           // 旧的一层结束
           if (curLevelCount == 0) {
               print("\(curlevel)层结束")
               curlevel = curlevel + 1
               curLevelCount = nextLevelCount
               nextLevelCount = 0
               nodeArr.append(levelArr)
               levelArr = [Int]()
               print("\(curlevel)层开始")
           }
            for item in node.children {
                queue.append(item)
                nextLevelCount = nextLevelCount + 1
            }
        }
        return nodeArr
    }
}

func test19() {
    // 递归
    func isMatch(_ s: String, _ p: String) -> Bool {
        var sArr = Array(s)
        var pArr = Array(p)
        return isMatchDfs(sArr, pArr)
    }
    
    func isMatchDfs(_ sArr:[Character], _ pArr:[Character]) -> Bool {
        if sArr.count == 0 {
            if pArr.count & 0x01 == 1 {
                return false
            }
            for (i , value) in pArr.enumerated() {
                if i & 0x01 == 1 {
                    if (value != "*") {
                        return false
                    }
                }
            }
            return true
        }
        if pArr.count == 0 {
            return false
        }
        let s1 = sArr[0]
        let p1 = pArr[0]
        var p2:Character = "t"
        if (pArr.count >= 2) {
            p2 = pArr[1]
        }
        if (p2 != "*") {
            if (s1 == p1 || p1 == ".") {
                return isMatchDfs(Array(sArr[1...]), Array(pArr[1...]))
            } else {
                return false
            }
        } else {
            /*
            * 生效 1 和多次
            * 不生效 0 次
            */
            if (s1 == p1 || p1 == ".") {
                return isMatchDfs(Array(sArr[1...]), Array(pArr[0...])) || (pArr.count >= 2 && isMatchDfs(Array(sArr[0...]), Array(pArr[2...])))
            } else {
                return (pArr.count >= 2 && isMatchDfs(Array(sArr[0...]), Array(pArr[2...])))
            }
        }
    }
}


func test20() {
    func isNumber(_ s: String) -> Bool {
           let str = s.trimmingCharacters(in: CharacterSet.whitespaces)
           let chArr = Array(str)
           // print(chArr)
           if str.isEmpty { return false }
           var hasNum = false
           var hasEore = false
           var hasDot = false
           for (index, value) in chArr.enumerated() {
               if value == "+" || value == "-" {
                   if  index >= 1 && (chArr[index - 1] != "e" && chArr[index - 1] != "E") {
                       return false
                   }
               } else if value == "." {
                   if hasDot || hasEore {
                       return false
                   }
                   hasDot = true
               } else if value == "e" || value == "E"{
                   if hasEore || !hasNum {
                       return false
                   }
                   hasEore = true
                   hasNum = false
               } else if (value >= "0" && value <= "9") {
                   hasNum = true
               } else {
                   // print("____")
                  return false
               }
           }
           return hasNum
       }
    
    print(isNumber("-1E-16"))
}

func test21() {
    func exchange(_ nums: [Int]) -> [Int] {
          var arr = nums
          var i = 0
          var j = nums.count - 1
          while i < j {
            var one = arr[i] & 0x01 == 0 // 偶数
            var two = arr[j] & 0x01 == 1 // 奇数
            if one && two {
                arr[i] = arr[i] ^ arr[j]
                arr[j] = arr[i] ^ arr[j]
                arr[i] = arr[i] ^ arr[j]
                i = i + 1
                j = j - 1
            } else if one {
                j = j - 1
            } else if two {
                i = i + 1
            } else {
                i = i + 1
                j = j - 1
            }
          }
          return arr
     }
}

func test22() {
    class ListNode {
         public var val: Int
         public var next: ListNode?
         public init(_ val: Int) {
         self.val = val
         self.next = nil
       }
   }
    
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head
        var kNode:ListNode? = nil
        var step = 0
        while node != nil {
            if step == k {
                kNode = head
            } else if (step > k) {
                kNode = kNode?.next
            }
            step = step + 1
            node = node?.next
        }
        return kNode
    }
}

func test24() {
    class ListNode {
         public var val: Int
         public var next: ListNode?
         public init(_ val: Int) {
         self.val = val
         self.next = nil
       }
    }
    func reverseList(_ head: ListNode?) -> ListNode? {
       // 用一个指针指向当前要反转的表头，用一个临时变量保持待反转表头的下一个节点
       var oldHead = head
       var newHead:ListNode? = nil
       while oldHead != nil {
           let next = oldHead?.next
           oldHead?.next = newHead
           newHead = oldHead
           oldHead = next
       }
       return newHead
    }
}

func test25() {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil { return l2 }
            if l2 == nil { return l1 }
            var small:ListNode? = l1!.val <= l2!.val ? l1 : l2
            var big:ListNode? = l1!.val <= l2!.val ? l2 : l1
            var next = small?.next
            small?.next = mergeTwoLists(next, big)
            return small
    }
}

func test26_I() {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
                if B == nil || A == nil { return false }
                return receive(A, B, false)
            }
            
    func receive(_ A: TreeNode?, _ B: TreeNode?, _ hasEqual:Bool) -> Bool {
        if B == nil { return true }
        if A == nil { return false }
        if (hasEqual) {
            if (A?.val == B?.val) {
                return (receive(A?.left, B?.left, true) && receive(A?.right, B?.right, true))
            } else {
                return false
            }
        } else {
            var e = receive(A?.left, B, false) || receive(A?.right, B, false)
            if (A?.val == B?.val) {
                return e || (receive(A?.left, B?.left, true) && receive(A?.right, B?.right, true))
            } else {
                return e
            }
        }
    }
}

func test26() {
    // 先找到相同的节点
    // 对相同的节点进行比较
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
            if B == nil || A == nil { return false }
                return help(A, B) || isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
    }
                
    func help(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil { return true }
        if A == nil { return false }
        return (A?.val == B?.val) && help(A?.left, B?.left) && help(A?.right, B?.right)
    }
}

func test27() {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return root }
        var left = root?.left
        root?.left = root?.right
        root?.right = left
        mirrorTree(root?.left)
        mirrorTree(root?.right)
        return root
    }
}

func test28() {
    func isSymmetric(_ root: TreeNode?) -> Bool {
            if root == nil { return true }
                return isSolution(root?.left, root?.right)
    }

    func isSolution(_ A: TreeNode?,_ B: TreeNode?) -> Bool {
        if A == nil && B == nil { return true}
        if A == nil || B == nil {return false}
        return A?.val == B?.val && isSolution(A?.left, B?.right) && isSolution(A?.right, B?.left)
    }
}

func test29() {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
          return ergodic(matrix: matrix, curRowStart: 0, curColStart: 0, minRow: 0, maxRow: matrix.count - 1, minCol:0, maxCol: matrix[0].count - 1)
        }
        
        func ergodic(matrix:[[Int]],curRowStart:Int, curColStart:Int, minRow:Int,maxRow:Int,minCol:Int,maxCol:Int) -> [Int] {
            var curRow = curRowStart
            var curCol = curColStart
            if curRow > maxRow || curRow < minRow || curCol > maxCol || curCol < minCol || minRow > maxRow || minCol > maxCol {
                return []
            }
            var arr = [Int]()
            var a1 = 0
            var a2 = 0
            var b1 = 0
            var b2 = 0
            while true {
                if a1 + a2 + b1 + b2 > 0, curRow == minRow, curCol == minCol {
                    break
                }
                if (minCol == maxCol) { // 只有1列
                    for i in minRow ... maxRow {
                        arr.append(matrix[i][minCol])
                    }
                    return arr
                }
                if (minRow == maxRow) { // 只有1行
                    for i in minCol ... maxCol {
                        arr.append(matrix[minRow][i])
                    }
                    return arr
                }
                if (curRow == minRow && curCol < maxCol) {
                    arr.append(matrix[curRow][curCol])
                    curCol = curCol + 1
                    a1 = a1 + 1
                } else if (curCol == maxCol && curRow < maxRow) {
                    arr.append(matrix[curRow][curCol])
                    curRow = curRow + 1
                    b2 = b2 + 1
                } else if (curRow == maxRow && curCol > minCol) {
                    arr.append(matrix[curRow][curCol])
                    curCol = curCol - 1
                    a2 = a2 + 1
                } else if (curRow > minRow && curCol == minCol) {
                    arr.append(matrix[curRow][curCol])
                    curRow =  curRow - 1
                    b1 = b1 + 1
                } else {
                    break
                }
            }
            let next = ergodic(matrix: matrix, curRowStart: curRow + 1, curColStart:curCol + 1, minRow:minRow + (a1 >= 1 ? 1 : 0), maxRow:maxRow - (a2 >= 1 ? 1: 0), minCol: minCol + (b1 >= 1 ? 1: 0), maxCol: maxCol - (b2 >= 1 ? 1: 0))
            arr.append(contentsOf: next)
            return arr
        }
    
    print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
}

func test30() {
    
    // 还有一种储存差值法
    class MinStack {
        var stack1 = [Int]()
        var minStack = [Int]()
        init() {
           
        }
        
        func push(_ x: Int) {
            stack1.append(x)
            let last = minStack.last
            if let unpackLast = last, unpackLast < x {
                    minStack.append(unpackLast)
            } else {
                minStack.append(x)
            }
        }
        
        func pop() {
            if stack1.count > 0 {
                stack1.removeLast()
                minStack.removeLast()
            }
        }
        
        func top() -> Int {
            if (stack1.count > 0) {
                return stack1.last!
            } else {
                return 0
            }
            
        }
        
        func min() -> Int {
            if (minStack.count > 0) {
                return minStack.last!
            } else {
                return 0
            }
        }
    }
}

// 还原入栈和出栈的过程
func test31() {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        if pushed.isEmpty && popped.isEmpty {
            return true
        }
        if (pushed.count != popped.count) { return false }
        var pushArr = pushed
        var popArr = popped
        var count = pushArr.count - 1
        var stack = [Int]()
        for i in 0 ... count {
            var value = pushArr[i]
            stack.append(value)
            while value == popArr.first {
                stack.removeLast()
                popArr.removeFirst()
                if (!stack.isEmpty && !stack.isEmpty) {
                    value = stack.last!
                }
            }
        }
       return popArr == stack.reversed()
    }
    print(validateStackSequences(
        [1,2,3,4,5], [4,5,3,1,2]))
}

func test32_I() {
    func levelOrder(_ root: TreeNode?) -> [Int] {
        var queue = [TreeNode]()
        var ans = [Int]()
        if root == nil { return ans}
        queue.append(root!)
        while !queue.isEmpty {
            var size = queue.count - 1
            while size >= 0 {
                let node = queue.removeFirst()
                ans.append(node.val)
                size = size - 1
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
        }
        return ans
    }
}

func test32_II() {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var queue = [TreeNode]()
        var ans = [[Int]]()
        if root == nil { return ans}
        queue.append(root!)
        while !queue.isEmpty {
            var size = queue.count - 1
            var arr = [Int]()
            while size >= 0 {
                let node = queue.removeFirst()
                arr.append(node.val)
                size = size - 1
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            if (!arr.isEmpty) {
                ans.append(arr)
            }
        }
        return ans
    }
}

func test32_III() {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var queue = [TreeNode]()
        var ans = [[Int]]()
        if root == nil { return ans}
        queue.append(root!)
        while !queue.isEmpty {
            var size = queue.count - 1
            var arr = [Int]()
            while size >= 0 {
                let node = queue.removeFirst()
                arr.append(node.val)
                size = size - 1
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            if (!arr.isEmpty) {
                if ans.count & 0x01 == 1 {
                    ans.append(arr)
                } else {
                    ans.append(arr.reversed())
                }
            }
        }
        return ans
    }
}

func test33() {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
      // 先找到左右子树
      // 然后分别判断左右子树
      if postorder.count <= 1 {
         return true
      }
        var leftTree:[Int]? = nil
        var rightTree:[Int]? = nil
        var index = 0
        var lastIndex = -1
        let count = postorder.count
        let rootValue = postorder[count - 1]
        while index < count {
            if postorder[index] < rootValue {
                lastIndex = index
            }
            index = index + 1
        }
        // 找到左子树的根节点
        if (lastIndex != -1) {
            leftTree = Array(postorder[0 ... lastIndex])
        }
        
        if (lastIndex + 1 <= count - 2) {
            rightTree = Array(postorder[lastIndex + 1 ... count - 2])
        }
        if (leftTree != nil) {
            for value in leftTree! {
                if value > rootValue { return false }
            }
        }
        if (rightTree != nil) {
            for value in rightTree! {
                    if value < rootValue { return false }
            }
        }
            
        return verifyPostorder(leftTree ?? [Int]()) && verifyPostorder(rightTree ?? [Int]())
    }
    print(verifyPostorder([1,2,3,10,8,9,4,5]))
}

// 使用单调栈来解决二叉搜索树
func test33_I() {
    
}

func test34() {
    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
       var res = [[Int]]()
       pathSumAdd(root, target, [], &res)
       return res
    }
    func pathSumAdd(_ root: TreeNode?, _ delt: Int, _ curArr:[Int], _ res: inout [[Int]]) {
        if root == nil { return }
        var dipCurArr = curArr
        var delt1 = delt - root!.val
        if delt1 < 0 { return }
        if root?.left == nil && root?.right == nil {
            if delt1 == 0 {
                print(root!.val)
                dipCurArr.append(root!.val)
                res.append(dipCurArr)
            }
            return;
        }
        dipCurArr.append(root!.val)
        pathSumAdd(root?.left, delt1, dipCurArr, &res)
        pathSumAdd(root?.right, delt1, dipCurArr, &res)
    }
}

func test34_I() {
    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
           var res = [[Int]]()
           var curArr = [Int]()
           pathSumAdd(root, target, &curArr, &res)
           return res
        }
    func pathSumAdd(_ root: TreeNode?, _ delt: Int, _ curArr: inout [Int], _ res: inout [[Int]]) {
            if root == nil { return }
            var delt1 = delt - root!.val
            curArr.append(root!.val)
            if root?.left == nil && root?.right == nil {
                if delt1 == 0 {
                    res.append(curArr)
                }
            } else {
                 pathSumAdd(root?.left, delt1, &curArr, &res)
                 pathSumAdd(root?.right, delt1, &curArr, &res)
            }
            curArr.removeLast()
    }
}

func test35() {
    // 因为Swift指针比较麻烦，所以使用Java了，其实也可以使用Swift，但是LeedCode没有
    /**
     HashMap<Node, Node> hash = new HashMap<Node, Node>();
         Node copyRandomList(Node head) {
             if (head == null) { return null;}
             if (!hash.containsKey(head)) {
                Node newHead = new Node(head.val);
                hash.put(head, newHead);
                newHead.next = copyRandomList(head.next);
                newHead.random = copyRandomList(head.random);
                return newHead;
             }
             return hash.get(head);
          }
     */
}

func test36() {
    /** 先中序遍历二叉树到一维数组，然后遍历数组连成指针*/
    /**
     public Node treeToDoublyList(Node root) {
           if (root == null) { return null;}
           List<Node> arr = dfsNode(root);
           int length = arr.size();
           if (length == 1) {
               Node node = arr.get(0);
               node.left = node;
               node.right = node;
               return node;
           }
          
           for (int index = 0; index < length; index++ ) {
               Node value = arr.get(index);
              if (index == 0) {
                  value.left = arr.get(length - 1);
                  value.right = arr.get(index + 1);
              } else if (index == length - 1) {
                  value.right = arr.get(0);
                  value.left = arr.get(index - 1);
              } else {
                  value.left = arr.get(index - 1);
                  value.right = arr.get(index + 1);
              }
           }
             return arr.get(0);
         }
         
         public List<Node> dfsNode(Node node) {
              if (node == null) {
                  return null;
              }
              List<Node> arr = new ArrayList<Node>();;
              if (node.left != null) {
                    List<Node> leftArr = dfsNode(node.left);
                    arr.addAll(leftArr);
              }
              arr.add(node);
              if (node.right != null) {
                    List<Node> rigjtArr = dfsNode(node.right);
                    arr.addAll(rigjtArr);
              }
              return arr;
         }
     */
}

func test37() {
    /** 保存二叉树 Swift没有对应的验证 */
    /*
    public String serialize(TreeNode root) {
            if(root == null) return "[]";
            StringBuilder res = new StringBuilder("[");
            Queue<TreeNode> queue = new LinkedList<>() {{ add(root); }};
            while(!queue.isEmpty()) {
                TreeNode node = queue.poll();
                if(node != null) {
                    res.append(node.val + ",");
                    queue.add(node.left);
                    queue.add(node.right);
                }
                else res.append("null,");
            }
            res.deleteCharAt(res.length() - 1);
            res.append("]");
            return res.toString();
        }

        public TreeNode deserialize(String data) {
            if(data.equals("[]")) return null;
            String[] vals = data.substring(1, data.length() - 1).split(",");
            TreeNode root = new TreeNode(Integer.parseInt(vals[0]));
            Queue<TreeNode> queue = new LinkedList<>() {{ add(root); }};
            int i = 1;
            while(!queue.isEmpty()) {
                TreeNode node = queue.poll();
                if(!vals[i].equals("null")) {
                    node.left = new TreeNode(Integer.parseInt(vals[i]));
                    queue.add(node.left);
                }
                i++;
                if(!vals[i].equals("null")) {
                    node.right = new TreeNode(Integer.parseInt(vals[i]));
                    queue.add(node.right);
                }
                i++;
            }
            return root;
        }

//    作者：jyd
//    链接：https://leetcode.cn/problems/xu-lie-hua-er-cha-shu-lcof/solution/mian-shi-ti-37-xu-lie-hua-er-cha-shu-ceng-xu-bian-/
//    来源：力扣（LeetCode）
//    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
}



func test38() {
    func permutation(_ s: String) -> [String] {
        var str = s
        if str.isEmpty {return []}
        if str.count == 1 {return [str]}
        let count = str.count
        var strArr = [String]()
        var prifixSet = Set<Character>()
        for index in 0 ... count - 1 {
            let index = str.index(s.startIndex, offsetBy: index)
            var str1 = str
            var ch = str1.remove(at: index)
            if (prifixSet.contains(ch)) {
                continue;
            } else {
                prifixSet.insert(ch)
            }
            var nextStrArr = permutation(str1)
            strArr.append(contentsOf: nextStrArr.map { String(ch) + $0})
        }
        return strArr
    }
}

func test39() {
    // 因为题目已知条件有限制，这里不做无用的边界条件判断
    func majorityElement(_ nums: [Int]) -> Int {
        var stack = [Int]()
        for value in nums {
            if !stack.isEmpty, stack.last != value {
                stack.removeLast()
            } else {
                stack.append(value)
            }
        }
        return stack.last!
    }
}

// 普通排序
func test40() {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        var sortArr = arr
        if sortArr.count <= k { return sortArr}
        for i in 0 ... k - 1 {
            for j in i + 1 ... k - 1 {
                if sortArr[j] < sortArr[i] {
                    sortArr[i] = sortArr[i] ^ sortArr[j]
                    sortArr[j] = sortArr[i] ^ sortArr[j]
                    sortArr[i] = sortArr[i] ^ sortArr[j]
                }
            }
        }
        return Array(sortArr[0 ... k-1])
    }
}

// 快速排序
func test40_I() {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        var sortArr = arr
        if sortArr.count <= k { return sortArr}
        if k == 0 { return [Int]() }
        var index = fastArrSort(sortArr:&sortArr, leftp: 0, rightp: sortArr.count - 1)
        while index != k - 1 {
            if index > k - 1 {
                index = fastArrSort(sortArr:&sortArr, leftp:0, rightp: index - 1)
            } else {
                index = fastArrSort(sortArr:&sortArr, leftp:index + 1, rightp: sortArr.count - 1)
            }
        }
        return Array(sortArr[0...k-1])
    }
    
    // 一次定位
    func fastArrSort(sortArr:inout [Int], leftp:Int, rightp:Int) -> Int {
        if leftp >= rightp {
            return rightp
        }
        var left = leftp
        var right = rightp
        let piquet = sortArr[left]
        while (left < right) {
            while left < right, sortArr[right] >= piquet {
                right = right - 1
            }
            while left < right, sortArr[left] <= piquet {
                left = left + 1
            }
            if (left < right) {
                (sortArr[left], sortArr[right]) = (sortArr[right], sortArr[left])
            }
        }
       // left 和 right 相等
        (sortArr[left], sortArr[leftp]) = (sortArr[leftp], sortArr[left])
        return left
    }
        
    print(getLeastNumbers([3, 2, 1], 2))
}

// 快速排序
func test40_II() {
    func fastSort(sortArr:[Int]) ->[Int] {
        var varSortArr = sortArr
        fastArrSort(sortArr: &varSortArr, leftp: 0, rightp: varSortArr.count - 1)
        return varSortArr
    }
    
    // 一次定位
    func fastArrSort(sortArr:inout [Int], leftp:Int, rightp:Int) {
        if leftp >= rightp {
            return
        }
        var left = leftp
        var right = rightp
        let piquet = sortArr[left]
        while (left < right) {
            while left < right, sortArr[right] >= piquet {
                right = right - 1
            }
            while left < right, sortArr[left] <= piquet {
                left = left + 1
            }
            if (left < right) {
                (sortArr[left], sortArr[right]) = (sortArr[right], sortArr[left])
            }
        }
       // left 和 right 相等
        (sortArr[left], sortArr[leftp]) = (sortArr[leftp], sortArr[left])
        fastArrSort(sortArr: &sortArr, leftp: leftp, rightp: left - 1)
        fastArrSort(sortArr: &sortArr, leftp: left + 1, rightp: rightp)
    }
    
    print(fastSort(sortArr: [0,0,1,2,4,2,2,3,1,4]))
    print("%d",[1,2,3,4].startIndex)
    print(String(format: "%x %ld", 128, 20))
}


func test41() {
    //! 自定义 堆
    class MyStackHeap {
      //！ 标记大顶堆 还是 小顶堆, 默认是小顶堆
      var isMaxFlag = false
      var heap:[Int]!
      //!  有效元素个数，也是堆最后一个元素的角标
      var count = 0
      
      init(_ flag:Bool = false) {
        self.isMaxFlag = flag
        // 堆元素从 角标 1 开始
        heap = [0]
      }
      
      func add(_ val:Int) {
        insert(val)
      }
      
      func poll()->Int {
        let num = heap[1]
        heap.swapAt(1, count)
        heap.remove(at: count)
        count -= 1
        heapify()
        return num
      }
      
      func peak() -> Int {
        return heap[1]
      }
      
      private func insert(_ key: Int) {
        count+=1
        heap.append(key)
        var j = count
        while j/2 > 0 && comparator(heap[j],heap[j/2]) {
          heap.swapAt(j, j/2)
          j = j/2
        }
      }
      
      func comparator(_ num1:Int,_ num2:Int) -> Bool {
        if isMaxFlag {
          return num2 < num1
        } else {
          return num1 < num2
        }
      }
        
      private func heapify()  {
        var index = 1
        while true {
          var postionIndex = index
          if index*2 <= count && !comparator(heap[index], heap[index*2]) {
            postionIndex = index*2
          }
             
          if index*2+1 <= count && !comparator(heap[postionIndex], heap[index*2+1]) {
            postionIndex = index*2+1
          }
             
          if postionIndex == index {
            //! 说明不需要进行操作
            break
          }
          heap.swapAt(index, postionIndex)
          index = postionIndex
        }
      }
    }
    class MedianFinder {
        var bigHeap:MyStackHeap = MyStackHeap(true)
        var smallHeap:MyStackHeap = MyStackHeap(false)
        var count:Int = 0
        /** initialize your data structure here. */
        init() {
            
        }
        
        func addNum(_ num: Int) {
            if count & 0x01 == 1 { //奇数
                 bigHeap.add(num)
                 let top2 = bigHeap.poll()
                 smallHeap.add(top2)
                 count = count + 1
            } else {
                smallHeap.add(num)
                let top = smallHeap.poll()
                bigHeap.add(top)
                count = count + 1
            }
        }
        
        func findMedian() -> Double {
            if count & 0x01 == 1 { //奇数
                return Double(smallHeap.peak())
            } else {
                return Double(smallHeap.peak() + bigHeap.peak()) / 2.0
            }
        }
    }
}

func test42() {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if (nums.count == 1) {
           return nums[0]
        }
        var result = [(Int, Int)]()
        result.append((nums[0],0))
        var sum:Int = 0
        var mumMax = nums[0]
        for index in 1 ... nums.count - 1 {
            mumMax = max(nums[index], mumMax)
            let left = max(result[index - 1].0 + nums[index], nums[index])
            let right = max(result[index - 1].0, result[index - 1].1)
            result.append((left, right))
            sum = max(result[index].0, result[index].1, sum)
        }
        if sum == 0 {
            return mumMax
        }
        return sum
    }
    print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
}

func test43() {
    func countDigitOne(_ n: Int) -> Int {
            var nums = numberArr(number: n)
            var sum = 0
            for k in 0 ... nums.count - 1 { // 出现次数
                // 低位有效
                var pos = Int(Double(floatLiteral:(pow(10, Double(k + 1)))))
                var pos1 = pos / 10
                var low = n % pos
                var lowCount = 0
                if (pos1 <= low && low < pos1 * 2) {
                    lowCount = low - pos1 + 1
                } else if (low >= pos1) {
                    lowCount = pos1
                }
                sum += (n / pos) * pos1 + lowCount
            }
            return sum
        }
        
    func numberArr(number:Int)->[Int] {
            var i = number
            var numArr = [Int]()
            while i >= 10 {
                let j = i % 10
                i = i / 10
                numArr.append(j)
            }
            numArr.append(i)
            return numArr
    }
}

func test44() {
    func findNthDigit(_ n: Int) -> Int {
        if (n <= 9) {
            return n
        }
        var sum:Int = 0
        var pre:Int = 0
        let length = numberArr(number: n).count
        var size = 1
        for i in 1 ... length {
            sum += i * 9 * Int(Double(floatLiteral: pow(10, Double(i - 1))))
            if (sum > n) {
                break;
            }
            pre = sum
            size = i
        }
        
        
        // 取得当前要表示的数
        let left = n - pre
        let yu = (n - pre) % (size + 1)
        let cur:Int = maxSizeNum(size:size) + (left / (size + 1)) + (yu == 0 ? 0 : 1)
        let result = numberArr(number: cur)
        if (yu == 0) {
            return result.last!
        } else {
            return result[yu - 1]
        }
    }
    
    func numberArr(number:Int)->[Int] {
        var i = number
        var numArr = [Int]()
        while i >= 10 {
            let j = i % 10
            i = i / 10
            numArr.append(j)
        }
        numArr.append(i)
        return numArr.reversed()
    }
    
    func maxSizeNum(size:Int) -> Int {
        if (size <= 0) {
            return 0
        }
       return Int(Double(floatLiteral: pow(10, Double(size)))) - 1
    }
    print(findNthDigit(1000))
}


func test45() {
    func minNumber(_ nums: [Int]) -> String {
        var strArr = nums.map {return String($0)}
        var sortArr = strArr.sorted {
            return $0 + $1 < $1 + $0
        }
        return sortArr.joined()
    }
    print(minNumber([7,23,44,89]))
}

func test46() {
    func translateNum(_ num: Int) -> Int {
       let nums = numberArr(number: num)
       if nums.count <= 1 { return nums.count }
       var arr = [(Int, Int)]()
       arr.append((1, 0))
       for i in 1 ... nums.count - 1 {
           var x = arr[i - 1].0 + arr[i - 1].1
           var y = 0
           if (nums[i - 1] != 0 && nums[i - 1] * 10 + nums[i] <= 25) {
               y = arr[i - 1].0
           }
           arr.append((x, y))
       }
        return arr[nums.count - 1].0 + arr[nums.count - 1].1
    }
    
    func numberArr(number:Int)->[Int] {
        var i = number
        var numArr = [Int]()
        while i >= 10 {
            let j = i % 10
            i = i / 10
            numArr.append(j)
        }
        numArr.append(i)
        return numArr.reversed()
    }
}

func test47() {
    func maxValue(_ grid: [[Int]]) -> Int {
        var arr:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: grid[0].count), count: grid.count)
        let m = grid.count - 1
        let n = grid[0].count - 1
        for i in 0 ... m {
            for j in 0 ... n {
                if (i == 0 && j == 0) {
                    arr[0][0] = grid[0][0]
                } else if (i == 0 && j >= 1){
                    arr[i][j] = arr[i][j - 1] + grid[i][j]
                } else if (j == 0 && i >= 1) {
                    arr[i][j] = arr[i - 1][j] + grid[i][j]
                } else {
                    arr[i][j] = max(arr[i - 1][j] + grid[i][j], arr[i][j - 1] + grid[i][j])
                }
            }
        }
        return arr[m][n]
    }
    print(maxValue([
        [1,3,1],
        [1,5,1],
        [4,2,1]
      ]))
}

func test48() {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let arr = Array(s)
        var front = 0
        var behind = 0
        var dict = [Character : Bool]()
        var res = 0
        var maxNum = 0
        while behind <= front && front < arr.count {
            while behind <= front && front < arr.count, dict[arr[front]] == nil {
                dict[arr[front]] = true
                res = res + 1
                front = front + 1
                maxNum = max(res, maxNum)
            }
            while  behind <= front && front < arr.count && arr[behind] != arr[front] {
                dict[arr[behind]] = nil
                res = res - 1
                behind = behind + 1
            }
            
            if behind <= front && front < arr.count && arr[behind] == arr[front] {
                dict[arr[behind]] = nil
                res = res - 1
                behind = behind + 1
            }
        }
        return maxNum
    }
    print(lengthOfLongestSubstring("abcabcbb"))
}

func test49() {
    func nthUglyNumber(_ n: Int) -> Int {
            if (n <= 1) {
                return n
            }
            var arr:[Int] = [Int]()
            arr.append(1)
            while arr.count <= n - 1 {
                var minNum = arr.last! * 2
                for i in (0 ... arr.count - 1).reversed() {
                    if arr[i] * 5 < arr.last! {
                        break
                    }
                    for j in [2, 3, 5] {
                        if (arr[i] * j > arr.last!) {
                            minNum = min(arr[i] * j, minNum)
                        }
                    }
                }
                arr.append(minNum)
            }
            return arr.last!
    }
}

func test50() {
    func firstUniqChar(_ s: String) -> Character {
        var dict = [Character:Int]()
        let arr = Array(s)
        for ch in arr {
           dict[ch] = (dict[ch] ?? 0) + 1
        }
        var res:Character = " "
        for ch in arr {
            if dict[ch] == 1 {
                res = ch
                break
            }
        }
        return res
    }
}

func test51() {
    func reversePairs(_ nums: [Int]) -> Int {
        // 归并排序 逆序的总和等于左数组和右数组，已经左右数组之间的逆序，因此可以使用递归的方式来解决问题
        var numArr = nums
        if numArr.count <= 1 { return 0 }
        return reverseArr(&numArr, start: 0, end: numArr.count - 1)
    }
    
    func reverseArr(_ numArr:inout [Int], start:Int, end:Int) -> Int {
        if start == end {
            return 0
        } else if (start == end - 1) {
            if (numArr[start] > numArr[end]) {
                let tmp = numArr[start]
                numArr[start] = numArr[end]
                numArr[end] = tmp
                return 1
            }
            return 0
        } else {
           let middle = start + ((end - start) >> 1)
           let count1 = reverseArr(&numArr, start:start, end: middle)
           let count2 = reverseArr(&numArr, start: middle + 1, end: end)
           var res = [Int]()
           let count3 = reverseTwoSortArr(&numArr, res:&res, left1: start, right1: middle, left2: middle + 1, right2: end)
           numArr.replaceSubrange(start ... end, with: res)
           return count1 + count2 + count3
        }
    }
    
    func reverseTwoSortArr(_ numArr:inout [Int], res:inout [Int], left1:Int, right1:Int, left2:Int, right2:Int) -> Int {
        if left1 <= right1 && left2 <= right2 {
            if (numArr[left1] <= numArr[left2]) {
                res.append(numArr[left1])
                return reverseTwoSortArr(&numArr, res: &res, left1:left1 + 1, right1:right1, left2:left2, right2:right2)
            } else {
                res.append(numArr[left2])
                let unSort = right1 - left1 + 1
                return unSort + reverseTwoSortArr(&numArr,res: &res, left1:left1, right1:right1, left2:left2 + 1, right2:right2)
            }
        }
        if (left1 <= right1) {
            res.append(contentsOf:numArr[left1 ... right1])
        }
        
        if (left2 <= right2) {
            res.append(contentsOf:numArr[left2 ... right2])
        }
        return 0
    }
    print(reversePairs([1,2,1,2,1]))
}

func test52() {
    // 双指针 没有swift语言
    func getIntersectionNode(headA:ListNode, headB:ListNode) -> ListNode? {
        var nodeA = headA
        var nodeB = headB
        while nodeA === nodeB {
            if (nodeA.next == nil && nodeB.next == nil) {
                return nil
            }
            if (nodeA.next == nil) {
                nodeA = headB
            } else {
                nodeA = nodeA.next!
            }
            
            if (nodeB.next == nil) {
                nodeB = headA
            } else {
                nodeB = nodeB.next!
            }
        }
        return nodeA
    }
}

func test53_I() {
    // 排序数组 二分法
    func search(_ nums: [Int], _ target: Int) -> Int {
           var start = 0
           var end = nums.count - 1
           var count = 0
           while start <= end {
               var middle = start + ((end - start) >> 1)
               if (nums[middle] < target) {
                   start = middle + 1
               } else if (nums[middle] > target) {
                   end = middle - 1
               } else {
                   count = 1
                   var flag = middle
                   while flag > start {
                       if (nums[flag - 1] == target) {
                           flag = flag - 1
                           count = count + 1
                       } else {
                           break
                       }
                   }
                   
                   flag = middle
                   while flag < end {
                       if (nums[flag + 1] == target) {
                           flag = flag + 1
                           count = count + 1
                       } else {
                           break
                       }
                   }
                   break;
               }
           }
          return count
    }
}

func test53_II() {
    func missingNumber(_ nums: [Int]) -> Int {
            var start = 0
            var end = nums.count - 1
          
            while start <= end {
                let middle = start + ((end - start) >> 1)
                if (nums[middle] > middle) {
                    end = middle - 1
                } else {
                    start = middle + 1
                }
            }
            return start
    }
}

func test54() {
    
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var kVal = 0
        middleSort(root, k:k, count: &count, kVal: &kVal)
        return kVal
    }
    
    func middleSort(_ root: TreeNode?, k:Int, count:inout Int, kVal:inout Int) {
        if root == nil {
            return
        }
        middleSort(root?.left,k:k,count: &count, kVal: &kVal)
        count = count + 1
        if (count == k) {
            kVal = root?.val ?? 0
            return
        } else {
            middleSort(root?.right,k:k,count: &count, kVal: &kVal)
        }
    }
}

func test55_I() {
    func maxDepth(_ root: TreeNode?) -> Int {
            if (root == nil) { return 0 }
            return max(maxDepth(root?.left), maxDepth(root?.right))  + 1
        }
}

func test55_II() {
    // 后序遍历最合理
    // 后序遍历最合理
        func isBalanced(_ root: TreeNode?) -> Bool {
            if (root == nil) {
                return true
            }
            return ergodicTree(root).0
        }
        
    // 这种需要底层返回2个返回值的情况，建议果断使用元组，本题返回值第一个作为是否成功，第二个作为返回该节点的最大深度
    // 如果不这样做，则需要使用2个inout 变量，或者使用一个inout变量和返回值，或使用全局变量，都不好理解
        func ergodicTree(_ root: TreeNode?) -> (Bool, Int) {
            if (root == nil) {
                return (true, 0)
            } else {
               var res1 = ergodicTree(root?.left)
               var res2 = ergodicTree(root?.right)
                if (res1.0 && res2.0 && (max(res1.1, res2.1) - min(res1.1, res2.1)) <= 1) {
                    return (true, max(res1.1, res2.1) + 1)
                } else {
                    // 已经是false了，后面的深度可以不用管
                    return (false, 0)
                }
            }
        }
}

func test56_I () {
    // 思路比较奇特
    func singleNumbers(_ nums: [Int]) -> [Int] {
        var c:Int = 0
        for i in 0 ... nums.count - 1 {
            c = c ^ nums[i]
        }
        var cc = c
        // 知道a1 ^ a2 等于多少
        var st = 1
        while (cc & 0x01) == 0x00 {
            cc = (cc >> 1)
            st = (st << 1)
        }

        var d = 0
        for i in 0 ... nums.count - 1 {
            if ((nums[i] & st) == st) {
               d = d ^ nums[i]
            }
        }
        return [d, c ^ d]
    }
}

func test56_II () {
    // 思路比较奇特
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0
        for m in 0 ... 31 {
            var count = 0
            for i in 0 ... nums.count - 1 {
                if ((nums[i] >> m) & 0x01) == 0x01 {
                    count = count + 1
                }
            }
            if count % 3 != 0 { // 说明该位为1
                a = a | (1 << m)
            }
        }
        return a
    }
    print(singleNumber([3,4,3,3]))
}

func test57_I() {
    // 先用二分法找到可能的范围，再使用首尾指针，2个数相加还是要注意，防止溢出，最好使用相减
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if (nums.count == 1) {
            return []
        }
        var start = 0
        var maxRight = nums.count - 1
        var other = target - nums[0]
        var end = maxRight
        while maxRight > start && nums[maxRight] >= other {
            end = maxRight
            maxRight = maxRight >> 1
        }
        while start < end {
            if nums[start] == target - nums[end] {
                return [nums[start], nums[end]]
            } else if (nums[start] > target - nums[end]) {
                end = end - 1
            } else {
                start = start + 1
            }
        }
        return []
    }
}

func test57_II() {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
       var i = 2
       var arr = [[Int]]()
       while true {
          let dd = target - Int(exactly: i * (i - 1) / 2)!
          if dd > 0 {
              if (dd % i == 0) {
                 let ch = dd / i
                 arr.insert((ch ... ch + i - 1).map({ $0 }), at: 0)
              }
          } else {
              break;
          }
          i = i + 1
       }
       return arr
     }
}

func test58() {
    func reverseWords(_ s: String) -> String {
        let arr = s.components(separatedBy: CharacterSet.whitespaces).filter { return $0.count > 0
        }
        return arr.reversed().joined(separator: " ")
    }
}

func test58_I() {
    func reverseWords(_ s: String) -> String {
            let ss = s.trimmingCharacters(in: CharacterSet.whitespaces)
            if (ss.count <= 1) { return ss}
            let arr = Array(ss)
            var res = [String]()
            var cur = ""
            for i in (0 ... ss.count - 1).reversed() {
                let ch = arr[i]
                if i == 0 {
                    cur.insert(ch, at: cur.startIndex)
                    res.append(cur)
                } else if ch == " " {
                    if (cur != "") {
                        res.append(cur)
                    }
                    cur = ""
                } else {
                    cur.insert(ch, at: cur.startIndex)
                }
            }
            return res.joined(separator:" ")
    }
}

func test58_II() {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        var ss = s
        let range = s.startIndex ... s.index(s.startIndex, offsetBy: n)
        let bb = ss[range]
        ss.removeSubrange(range)
        ss.append(contentsOf: bb)
        return ss
    }
}

func test59_I() {
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
            if nums.count <= 1 { return nums }
            var res = [Int]()
            var queue = [Int]()
            // 建窗口阶段
            queue.append(0)
            for j in 0 ... k-1 {
                while queue.count > 0 && nums[queue.last!] <= nums[j] {
                    queue.removeLast()
                }
                queue.append(j)
            }
            res.append(nums[queue.first!])
            
            if nums.count == k {
                return res
            }
            // 移动窗口阶段
            for i in 1 ... nums.count - k {
                // 加入右侧元素
                while queue.count > 0 && nums[queue.last!] <= nums[i + k - 1] {
                    queue.removeLast()
                }
                queue.append(i + k - 1)
                // 移除左侧元素，从左侧开始找到第一个在范围内的元素
                while queue.count > 0 {
                    if queue.first! < i {
                        queue.removeFirst()
                    } else {
                        break;
                    }
                }
                 // 这一步是走不到，因为至少有一个元素
                res.append(nums[queue.first!])
            }
            return res
    }
    print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
}

func test59_II() {
    class MaxQueue {
        var queueArr = [Int]()
        var maxArr = [Int]()
        
        init() {

        }
        
        func max_value() -> Int {
            if (maxArr.count == 0) {
                return -1
            } else {
                return maxArr.first!
            }
        }
        
        func push_back(_ value: Int) {
            queueArr.append(value)
            while maxArr.count > 0 && maxArr.last! < value {
                maxArr.removeLast()
            }
            maxArr.append(value)
        }
        
        func pop_front() -> Int {
            if queueArr.count == 0 {
                return -1
            }
            let first = queueArr.first
            queueArr.removeFirst()
            if maxArr.count > 0 && maxArr.first == first {
                maxArr.removeFirst()
            }
            return first!
        }
    }
}

func test60() {
   
    func dicesProbability(_ n: Int) -> [Double] {
        var arr = [[Int]](repeating: [Int](repeating: 0, count: 6 * n + 1), count: n + 1)
        for step in 1 ... n { // 有n步
            if step == 1 {
                for j in 1 ... 6 { // 每一步走的距离
                    arr[step][j] = 1
                }
            } else {
                // 上一步可能的取值
                for sun in step - 1 ... (step - 1) * 6 {
                    for j in 1 ... 6 { // 每一步走的距离
                        if (arr[step - 1][sun] != 0) {
                            arr[step][sun + j] += arr[step - 1][sun]
                        }
                    }
                }
            }
        }
        var res = arr[n].filter { return $0 > 0}
        var sum:Double = 1.0 / Double(res.reduce(0, +))
        return res.map { Double($0) * sum}
    }
    print(dicesProbability(2))
}

func test61() {
    func isStraight(_ nums: [Int]) -> Bool {
            var sortNums = nums.sorted { return $0 < $1 }
            sortNums.removeAll { return $0 == 0 }
            for i in 0 ... sortNums.count - 2 {
                // 保证不重复
                if sortNums[i] == sortNums[i + 1] {
                    return false
                }
            }
            return sortNums.last! - sortNums.first! <= 4
    }
}

func test62() {
    // https://leetcode.cn/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/solution/si-bu-he-xin-gong-shi-qing-song-nong-don-3vln/
    // 其实是动态规划问题，参考上面的讨论
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var arr = [Int]()
        arr.append(0)
        arr.append(1)
        for i in 2 ... n {
            arr.append((arr[i - 1] + m) % n)
        }
        return arr[n]
    }
    print(lastRemaining(8, 3))
}

func test63() {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {return 0}
        var value = 0
        for i in 0 ... prices.count - 2 {
            var maxValue = 0
            for j in i + 1 ... prices.count - 1 {
                maxValue = max(maxValue,prices[j])
            }
           value = max(maxValue - prices[i], value)
        }
        return value
    }
}

func test63_I() {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {return 0}
        var start = 0 // 起点值下标
        var maxDelt = 0
        while start <= prices.count - 1 {
            var index = start // 最大值下标
            for j in start ... prices.count - 1 {
                if prices[j] > prices[index] {
                    index = j
                }
            }
            if index == start {
                start = index + 1
            } else {
                var minIndex = start
                for m in start ... index - 1 {
                    if (prices[m] < prices[minIndex]) {
                        minIndex = m
                    }
                }
                maxDelt = max(prices[index] - prices[minIndex], maxDelt)
                start = index + 1
            }
        }
        return maxDelt
    }
    print(maxProfit([7,1,5,3,6,4]))
}

func test63_II() {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {return 0}
        var minValue = Int.max
        var profit = 0
        for i in 0 ... prices.count - 1 {
            if prices[i] < minValue {
                minValue = prices[i]
            } else {
                profit = max(prices[i] - minValue, profit)
            }
        }
        return profit
    }
}

func test64() {
    var res = 0
    func sumNums(_ n: Int) -> Int {
       n >= 1 && sumNums(n - 1) == 0
       res = res + n
       return res
    }
}

func test64_I() {
    var res = 0
    func sumNums(_ n: Int) -> Int {
       mutiply(time:0, A:n+1, B:n, sum:&res)
       return res >> 1
    }

    func mutiply(time:Int, A:Int, B:Int, sum:inout Int) {
       time <= 14 && {(((B >> time) & 0x01) == 0x01) && {sum += (A << time); return true }(); mutiply(time:time + 1,  A: A, B:B, sum:&sum); return true}()
    }
    sumNums(3)
}

func test65() {
    func add(_ a: Int, _ b: Int) -> Int {
        var aa = a
        var bb = b
        while bb != 0 {
            let tmp = aa & bb
            aa = aa ^ bb
            bb = (tmp << 1)
        }
        return aa
    }
    
    print(add(6, 6))
}

func test66() {
    func constructArr(_ a: [Int]) -> [Int] {
        if a.count <= 1 { return a }
        if a.count == 2 { return [a[1], a[0]] }
        var leftArr = [Int]( 1 ... 1)
        var rightArr = [Int](1 ... 1)
        for i in 1 ... a.count - 1 {
            leftArr.append(leftArr.last! * a[i - 1])
            rightArr.insert(rightArr.first! * a[a.count - i], at: 0)
        }
        var res = [Int]()
        for i in 0 ... a.count - 1 {
            res.append(leftArr[i] * rightArr[i])
        }
        return res
    }
    print(constructArr([1, 2, 3, 4, 5]))
    
}

func test67() {
    func strToInt(_ str: String) -> Int {
        var string = str.trimmingCharacters(in: CharacterSet.whitespaces)
        var arr = Array(string)
        if (arr.count == 0) { return 0 }
        let contain = ("0" ... "9").contains(arr.first!)
        var add = false
        var minus = false
        var num = false
        if !(arr.first == "+" || arr.first == "-" || contain) {
            return 0
        } else {
            if (arr.first == "+") {
                add = true
            } else if (arr.first == "-") {
                minus = true
            } else {
                num = true
            }
        }
        if arr.count == 1 {
            if (num) {
                return Int(String(arr.first!))!
            } else {
                return 0
            }
        }
        var numsArr = [Character]()
        let contain1 = ("1" ... "9").contains(arr.first!)
        if (contain1) {
            numsArr.insert(arr.first!, at: 0)
        }
        // 得到除掉空格和前导0、尾部无用的字符串数组
        for index in 1 ... arr.count - 1 {
            if ("0" ... "9").contains(arr[index]) {
                if !(numsArr.count == 0 && arr[index] == "0") {
                    numsArr.append(arr[index])
                }
            } else {
                break;
            }
        }
        return calulateValueArr(numsArr: numsArr, minus: minus)
    }
    
    func calulateValueArr(numsArr:[Character], minus:Bool) -> Int {
        if numsArr.count == 0 {
            return 0
        }
        var res:Int = 0
        var step = 1
        var max = (1 << 31) - 1
        var min = 1 << 31
        for i in (0 ... numsArr.count - 1).reversed() {
            let n:Int = Int(String(numsArr[i]))!
            if (minus) {
                if res > min - n * step {
                    res = min
                    return 0 - min
                }
            } else {
                if res > max - n * step {
                    res = max
                    return res
                }
            }
            res += n * step
            if step > (min - 9 * step) {
                if i > 0 {
                    if (minus) {
                        return 0 - min
                    } else {
                        return max
                    }
                }
            } else {
                step = step * 10
            }
        }
        if (minus) {
            return 0 - res
        } else {
            return res
        }
    }
    print(strToInt("   -42"))
}

func test68_I() {
    /*
     // 二叉搜索树
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        if (p->val > q->val) {
            TreeNode *tmp = p;
            p = q;
            q = tmp;
         }
        if (root->val == p->val || root->val == q->val) {
            return root;
        } else {
            if (root->val < p->val) {
              return lowestCommonAncestor(root->right, p, q);
            } else if (root->val > q->val) {
              return lowestCommonAncestor(root->left, p, q);
            } else {
                return root;
            }
        }
    }
     */
}
func test68_II() {
    /**
     // C++ 递归的使用
     TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
          if (root == NULL) {
              return NULL;
          }
          if (root->val == p->val || root->val == q-> val) {
              return root;
          } else {
             TreeNode *leftNode = lowestCommonAncestor(root->left, p, q);
             TreeNode *rightNode = lowestCommonAncestor(root->right, p, q);
             if (leftNode && rightNode) {
                 return root;
             } else {
                 if (leftNode) {
                     return leftNode;
                 } else {
                     return rightNode;
                 }
             }
          }
      }
   */
}
