//
//  StringTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class StringTest: NSObject {

    //static 和 class  修饰的方法都用于指定类方法，不同的是，class修饰的可以被子类重写
    class func test(){
        do {//局部作用域do
            // 使用字符串字面量
            var stringA = "Hello, World!"
            print( stringA )

            // String 实例化
            var stringB = String("Hello, World!")
            print( stringB )
        }
        
        //判空
        do {
            // 使用字符串字面量创建空字符串
            var stringA = ""

            if stringA.isEmpty {
               print( "stringA 是空的" )
            } else {
               print( "stringA 不是空的" )
            }

            // 实例化 String 类来创建空字符串
            let stringB = String()

            if stringB.isEmpty {
               print( "stringB 是空的" )
            } else {
               print( "stringB 不是空的" )
            }
        }
        
        do {
            // stringA 可被修改
            var stringA = "笔记："
            stringA += "http://www..."
            print( stringA )

//            // stringB 不能修改
//            let stringB = String("笔记：")
//            stringB += "http://www..."
//            print( stringB )
        }
        
        //字符串中插入值
        do {
            var varA   = 20
            let constA = 100
            var varC:Float = 20.0

            var stringA = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
            print( stringA )
        }
        
        //字符串连接
        do {
            let constA = "笔记："
            let constB = "http://www..."

            var stringA = constA + constB

            print( stringA )
        }
        //字符串长度
        do {
            var varA   = "http://www..."

            print( "\(varA), 长度为 \(varA.count)" )
        }
        //字符串比较
        do {
            var varA   = "Hello, Swift!"
            var varB   = "Hello, World!"

            if varA == varB {
               print( "\(varA) 与 \(varB) 是相等的" )
            } else {
               print( "\(varA) 与 \(varB) 是不相等的" )
            }
        }
        
        //Unicode 是一个国际标准，用于文本的编码，Swift 的 String 类型是基于 Unicode建立的。你可以循环迭代出字符串中 UTF-8 与 UTF-16 的编码
        do {
            var unicodeString   = "笔记记录"

            print("UTF-8 编码: ")
            for code in unicodeString.utf8 {
               print("\(code) ")
            }

            print("\n")

            print("UTF-16 编码: ")
            for code in unicodeString.utf16 {
               print("\(code) ")
            }
        }
        
        //字符串的遍历 Swift 5:
        do {
            let str = "笔记记录http://www..."

            print("---- 正序遍历 ----")
            var i = 0
            for ch in str {
                print("\(i): \(ch)")
                i += 1
            }

            print("---- 逆序遍历 ----")
            var j = str.count
            for ch in str.reversed() {
                j -= 1
                print("\(j): \(ch)")
            }

            print("---- 基于索引的正序遍历 ----")
            for i in 0..<str.count {
                let ch: Character = str[str.index(str.startIndex, offsetBy: i)]
                print("\(i): \(ch)")
            }

            print("---- 基于索引的逆序遍历 ----")
            //for i in stride(from: str.count - 1, to: -1, by: -1) {
            for i in stride(from: str.count - 1, through: 0, by: -1) {
                let ch: Character = str[str.index(str.startIndex, offsetBy: i)]
                print("\(i): \(ch)")
            }

            print("---- 基于EnumeratedSequence的遍历 ----")
            for (i, ch) in str.enumerated() {
                print("\(i): \(ch)")
            }
        }
    }
}

class StringChildTest : StringTest {
    override class func test() {
        super.test()
    }
}

/**
 字符串函数及运算符
 Swift 支持以下几种字符串函数及运算符：

 序号    函数/运算符 & 描述
 1
 isEmpty

 判断字符串是否为空，返回布尔值

 2
 hasPrefix(prefix: String)

 检查字符串是否拥有特定前缀

 3
 hasSuffix(suffix: String)

 检查字符串是否拥有特定后缀。

 4
 Int(String)

 转换字符串数字为整型。 实例:
 let myString: String = "256"
 let myInt: Int? = Int(myString)
 5
 String.count

 Swift 3 版本使用的是 String.characters.count

 计算字符串的长度

 6
 utf8

 您可以通过遍历 String 的 utf8 属性来访问它的 UTF-8 编码

 7
 utf16

 您可以通过遍历 String 的 utf8 属性来访问它的 utf16 编码

 8
 unicodeScalars

 您可以通过遍历String值的unicodeScalars属性来访问它的 Unicode 标量编码.

 9
 +

 连接两个字符串，并返回一个新的字符串

 10
 +=

 连接操作符两边的字符串并将新字符串赋值给左边的操作符变量

 11
 ==

 判断两个字符串是否相等

 12
 <

 比较两个字符串，对两个字符串的字母逐一比较。

 13
 !=

 比较两个字符串是否不相等。
 */
