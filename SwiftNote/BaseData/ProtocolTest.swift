//
//  ProtocolTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

protocol classa {
    
    var marks: Int { get set }
    var result: Bool { get }
    
    func attendance() -> String
    func markssecured() -> String
    
}

protocol classb: classa {
    
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
    
}

protocol daysofaweek {
    mutating func show()
}

protocol tcpprotocol {
    init(no1: Int)
}

class ProtocolTest: NSObject {

    class func test(){
        
        /**
         对属性的规定
         协议用于指定特定的实例属性或类属性，而不用指定是存储型属性或计算型属性。此外还必须指明是只读的还是可读可写的。

         协议中的通常用var来声明变量属性，在类型声明后加上{ set get }来表示属性是可读可写的，只读属性则用{ get }来表示。
         */
        do {
            class classc: classb {
                var marks = 96
                let result = true
                var present = false
                var subject = "Swift 协议"
                var stname = "Protocols"
                
                func attendance() -> String {
                    return "The \(stname) has secured 99% attendance"
                }
                
                func markssecured() -> String {
                    return "\(stname) has scored \(marks)"
                }
            }

            let studdet = classc()
            studdet.stname = "Swift"
            studdet.marks = 98
            studdet.markssecured()

            print(studdet.marks)
            print(studdet.result)
            print(studdet.present)
            print(studdet.subject)
            print(studdet.stname)
        }
        
        /**
         对 Mutating 方法的规定
         有时需要在方法中改变它的实例。

         例如，值类型(结构体，枚举)的实例方法中，将mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改它所属的实例及其实例属性的值。
         */
        do {
            enum days: daysofaweek {
                case sun, mon, tue, wed, thurs, fri, sat
                mutating func show() {
                    switch self {
                    case .sun:
                        self = .sun
                        print("Sunday")
                    case .mon:
                        self = .mon
                        print("Monday")
                    case .tue:
                        self = .tue
                        print("Tuesday")
                    case .wed:
                        self = .wed
                        print("Wednesday")
                    case .thurs:
                        self = .thurs
                        print("Wednesday")
                    case .fri:
                        self = .fri
                        print("Firday")
                    case .sat:
                        self = .sat
                        print("Saturday")
                    default:
                        print("NO Such Day")
                    }
                }
            }

            var res = days.wed
            res.show()
        }
        
        //协议构造器规定在类中的实现
        do {
            class mainClass {
                var no1: Int // 局部变量
                init(no1: Int) {
                    self.no1 = no1 // 初始化
                }
            }

            class subClass: mainClass, tcpprotocol {
                var no2: Int
                init(no1: Int, no2 : Int) {
                    self.no2 = no2
                    super.init(no1:no1)
                }
                // 因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
                required override convenience init(no1: Int)  {
                    self.init(no1:no1, no2:0)
                }
            }
            let res = mainClass(no1: 20)
            let show = subClass(no1: 30, no2: 50)

            print("res is: \(res.no1)")
            print("res is: \(show.no1)")
            print("res is: \(show.no2)")
        }
        
        //swift特有：继承协议自动实现方法
        do {
            class A : NSObject, ExFuncable {
                
            }
            
            let str = A.func1(str: "tom")
            print("str --------> \(str)")
            
            let a = A.init()
            a.func2()
        }
    }
}

// 协议
protocol ExFuncable {
    // 具体实现写到extension内
}

// 加载nib
extension ExFuncable where Self : NSObject {
    static func func1(str:String) -> String {
        print("hello func1")
        return "hi " + str
    }
    
    func func2(){
        print("hello func2")
    }
}
