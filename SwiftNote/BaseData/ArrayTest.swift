//
//  ArrayTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class ArrayTest: NSObject {

    class func test(){
        do {//访问数组
            var someInts = [Int](repeating: 10, count: 3)

            var someVar = someInts[0]

            print( "第一个元素的值 \(someVar)" )
            print( "第二个元素的值 \(someInts[1])" )
            print( "第三个元素的值 \(someInts[2])" )
        }
        
        do {//修改数组
            var someInts = [Int]()

            someInts.append(20)
            someInts.append(30)
            someInts += [40]

            var someVar = someInts[0]

            print( "第一个元素的值 \(someVar)" )
            print( "第二个元素的值 \(someInts[1])" )
            print( "第三个元素的值 \(someInts[2])" )
        }
        
        do {
            var someInts = [Int]()

            someInts.append(20)
            someInts.append(30)
            someInts += [40]

            // 修改最后一个元素
            someInts[2] = 50

            var someVar = someInts[0]

            print( "第一个元素的值 \(someVar)" )
            print( "第二个元素的值 \(someInts[1])" )
            print( "第三个元素的值 \(someInts[2])" )
        }
        
        do {//遍历数组
            var someStrs = [String]()

            someStrs.append("Apple")
            someStrs.append("Amazon")
            someStrs.append("Runoob")
            someStrs += ["Google"]

            for item in someStrs {
               print(item)
            }
        }
        
        do {
            var someStrs = [String]()

            someStrs.append("Apple")
            someStrs.append("Amazon")
            someStrs.append("Runoob")
            someStrs += ["Google"]

            for (index, item) in someStrs.enumerated() {
                print("在 index = \(index) 位置上的值为 \(item)")
            }
        }
        
        do {//合并数组
            var intsA = [Int](repeating: 2, count:2)
            var intsB = [Int](repeating: 1, count:3)

            var intsC = intsA + intsB

            for item in intsC {
                print(item)
            }
        }
        
        do {//count 属性
            var intsA = [Int](repeating: 2, count:2)
            var intsB = [Int](repeating: 1, count:3)

            var intsC = intsA + intsB

            print("intsA 元素个数为 \(intsA.count)")
            print("intsB 元素个数为 \(intsB.count)")
            print("intsC 元素个数为 \(intsC.count)")
        }
        
        do {//isEmpty 属性
            var intsA = [Int](repeating: 2, count:2)
            var intsB = [Int](repeating: 1, count:3)
            var intsC = [Int]()

            print("intsA.isEmpty = \(intsA.isEmpty)")
            print("intsB.isEmpty = \(intsB.isEmpty)")
            print("intsC.isEmpty = \(intsC.isEmpty)")
        }
    }
}

/**
 创建数组的方法不推荐使用文章中记载的方法。

 推荐:

 var names: [String] = []
 var lookup: [String: Int] = [:]
 不推荐:

 var names = [String]()
 var lookup = [String: Int]()
 */
