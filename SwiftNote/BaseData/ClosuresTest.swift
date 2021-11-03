//
//  ClosuresTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class ClosuresTest: NSObject {

    class func test(){
        
        do {
            let studname = { print("Swift 闭包实例。") }
            studname()
        }
        
        do {
            let divide = {(val1: Int, val2: Int) -> Int in
               return val1 / val2
            }
            let result = divide(200, 20)
            print (result)
        }
        
        //闭包表达式
        do {
            let names = ["AT", "AE", "D", "S", "BE"]

            // 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
            func backwards(s1: String, s2: String) -> Bool {
                return s1 > s2
            }
            var reversed = names.sorted(by: backwards)

            print(reversed)
        }
        //参数名称缩写
        do {
            let names = ["AT", "AE", "D", "S", "BE"]

            var reversed = names.sorted( by: { $0 > $1 } )
            print(reversed)
        }
        //运算符函数
        do {
            let names = ["AT", "AE", "D", "S", "BE"]

            var reversed = names.sorted(by: >)
            print(reversed)
        }
        //尾随闭包
        //尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
        /**
         func someFunctionThatTakesAClosure(closure: () -> Void) {
             // 函数体部分
         }

         // 以下是不使用尾随闭包进行函数调用
         someFunctionThatTakesAClosure({
             // 闭包主体部分
         })

         // 以下是使用尾随闭包进行函数调用
         someFunctionThatTakesAClosure() {
           // 闭包主体部分
         }
         */
        do {
            let names = ["AT", "AE", "D", "S", "BE"]

            //尾随闭包
            var reversed = names.sorted() { $0 > $1 }
            print(reversed)
            
            //如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉。
            reversed = names.sorted { $0 > $1 }
            print(reversed)
        }
        //捕获值
        do {
            func makeIncrementor(forIncrement amount: Int) -> () -> Int {
                var runningTotal = 0
                func incrementor() -> Int {
                    runningTotal += amount
                    return runningTotal
                }
                return incrementor
            }

            let incrementByTen = makeIncrementor(forIncrement: 10)

            // 返回的值为10
            print(incrementByTen())

            // 返回的值为20
            print(incrementByTen())

            // 返回的值为30
            print(incrementByTen())
            /**
             以上程序执行输出结果为：

             10
             20
             30
             */
        }
    }
}
