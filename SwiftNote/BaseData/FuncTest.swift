//
//  FuncTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class FuncTest: NSObject {

    class func test(){
        vari(members: 4,3,5)
        vari(members: 4.5, 3.1, 5.6)
        vari(members: "Google", "Baidu", "Runoob")
        
        var x = 1
        var y = 5
        swapTwoInts(&x, &y)
        print("x 现在的值 \(x), y 现在的值 \(y)")
        
        
        //可作为局部
        func inputs(no1: Int, no2: Int) -> Int {
            return no1/no2
        }
        print(inputs(no1: 20, no2: 10))
        print(inputs(no1: 36, no2: 6))
        
        func inputstr() {
           print("笔记记录")
           print("http://www...")
        }
        inputstr()
        
        func sum(a: Int, b: Int) -> Int {
           return a + b
        }
        var addition: (Int, Int) -> Int = sum
        print("输出结果: \(addition(40, 89))")
        
        do {//函数类型作为参数类型、函数类型作为返回类型
            func sum(a: Int, b: Int) -> Int {
                return a + b
            }
            var addition: (Int, Int) -> Int = sum
            print("输出结果: \(addition(40, 89))")

            func another(addition: (Int, Int) -> Int, a: Int, b: Int) {
                print("输出结果: \(addition(a, b))")
            }
            another(addition: sum, a: 10, b: 20)
        }
        
        do {//函数嵌套
            func calcDecrement(forDecrement total: Int) -> () -> Int {
               var overallDecrement = 0
               func decrementer() -> Int {
                  overallDecrement -= total
                  return overallDecrement
               }
               return decrementer
            }
            let decrem = calcDecrement(forDecrement: 30)
            print(decrem())
        }
    }
    
    //可变参数
    class func vari<N>(members: N...){
        for i in members {
            print(i)
        }
    }
    
    //常量，变量及 I/O 参数
    //一般默认在函数中定义的参数都是常量参数，也就是这个参数你只可以查询使用，不能改变它的值。
    //如果想要声明一个变量参数，可以在参数定义前加 inout 关键字，这样就可以改变这个参数的值了。
    class func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
}
