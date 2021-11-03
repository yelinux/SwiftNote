//
//  DictTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class DictTest: NSObject {
    
    class func test(){
        do {//访问字典
            var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

            var someVar = someDict[1]

            print( "key = 1 的值为 \(someVar)" )
            print( "key = 2 的值为 \(someDict[2])" )
            print( "key = 3 的值为 \(someDict[3])" )
        }
        
        do {//修改字典
            var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

            var oldVal = someDict.updateValue("One 新的值", forKey: 1)

            var someVar = someDict[1]

            print( "key = 1 旧的值 \(oldVal)" )
            print( "key = 1 的值为 \(someVar)" )
            print( "key = 2 的值为 \(someDict[2])" )
            print( "key = 3 的值为 \(someDict[3])" )
        }
        
        do {
            var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

            var oldVal = someDict[1]
            someDict[1] = "One 新的值"
            var someVar = someDict[1]

            print( "key = 1 旧的值 \(oldVal)" )
            print( "key = 1 的值为 \(someVar)" )
            print( "key = 2 的值为 \(someDict[2])" )
            print( "key = 3 的值为 \(someDict[3])" )
        }
        
        do {//移除 Key-Value 对
            var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

            var removedValue = someDict.removeValue(forKey: 2)

            print( "key = 1 的值为 \(someDict[1])" )
            print( "key = 2 的值为 \(someDict[2])" )
            print( "key = 3 的值为 \(someDict[3])" )
        }
        
        do {
            var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

            someDict[2] = nil

            print( "key = 1 的值为 \(someDict[1])" )
            print( "key = 2 的值为 \(someDict[2])" )
            print( "key = 3 的值为 \(someDict[3])" )
        }
        
        do {//遍历字典
            var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

            for (key, value) in someDict {
               print("字典 key \(key) -  字典 value \(value)")
            }
        }
        
        do {
            var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

            for (key, value) in someDict.enumerated() {
                print("字典 key \(key) -  字典 (key, value) 对 \(value)")
            }
        }
        
        //字典转换为数组
        //你可以提取字典的键值(key-value)对，并转换为独立的数组。实例如下：
        do {
            var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

            let dictKeys = [Int](someDict.keys)
            let dictValues = [String](someDict.values)

            print("输出字典的键(key)")

            for (key) in dictKeys {
                print("\(key)")
            }

            print("输出字典的值(value)")

            for (value) in dictValues {
                print("\(value)")
            }
        }
        
        do {//count 属性
            var someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
            var someDict2:[Int:String] = [4:"Four", 5:"Five"]

            print("someDict1 含有 \(someDict1.count) 个键值对")
            print("someDict2 含有 \(someDict2.count) 个键值对")
        }
        
        do {//isEmpty 属性
            var someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
            var someDict2:[Int:String] = [4:"Four", 5:"Five"]
            var someDict3:[Int:String] = [Int:String]()

            print("someDict1 = \(someDict1.isEmpty)")
            print("someDict2 = \(someDict2.isEmpty)")
            print("someDict3 = \(someDict3.isEmpty)")
        }
    }
}
