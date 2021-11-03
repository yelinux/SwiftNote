//
//  ArcTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class ArcTest: NSObject {

    class func test(){
        
        do {//ARC 实例
            class Person {
                let name: String
                init(name: String) {
                    self.name = name
                    print("\(name) 开始初始化")
                }
                deinit {
                    print("\(name) 被析构")
                }
            }

            // 值会被自动初始化为nil，目前还不会引用到Person类的实例
            var reference1: Person?
            var reference2: Person?
            var reference3: Person?

            // 创建Person类的新实例
            reference1 = Person(name: "Runoob")


            //赋值给其他两个变量，该实例又会多出两个强引用
            reference2 = reference1
            reference3 = reference1

            //断开第一个强引用
            reference1 = nil
            //断开第二个强引用
            reference2 = nil
            //断开第三个强引用，并调用析构函数
            reference3 = nil
        }
        
        do {//类实例之间的循环强引用
            class Person {
                let name: String
                init(name: String) { self.name = name }
                var apartment: Apartment?
                deinit { print("\(name) 被析构") }
            }

            class Apartment {
                let number: Int
                init(number: Int) { self.number = number }
                var tenant: Person?
                deinit { print("Apartment #\(number) 被析构") }
            }

            // 两个变量都被初始化为nil
            var runoob: Person?
            var number73: Apartment?

            // 赋值
            runoob = Person(name: "Runoob")
            number73 = Apartment(number: 73)

            // 意感叹号是用来展开和访问可选变量 runoob 和 number73 中的实例
            // 循环强引用被创建
            runoob!.apartment = number73
            number73!.tenant = runoob

            // 断开 runoob 和 number73 变量所持有的强引用时，引用计数并不会降为 0，实例也不会被 ARC 销毁
            // 注意，当你把这两个变量设为nil时，没有任何一个析构函数被调用。
            // 强引用循环阻止了Person和Apartment类实例的销毁，并在你的应用程序中造成了内存泄漏
            runoob = nil
            number73 = nil
        }
        
        do {//弱引用实例
            class Module {
                let name: String
                init(name: String) { self.name = name }
                var sub: SubModule?
                deinit { print("\(name) 主模块") }
            }

            class SubModule {
                let number: Int
                
                init(number: Int) { self.number = number }
                
                weak var topic: Module?
                
                deinit { print("子模块 topic 数为 \(number)") }
            }

            var toc: Module?
            var list: SubModule?
            toc = Module(name: "ARC")
            list = SubModule(number: 4)
            toc!.sub = list
            list!.topic = toc

            toc = nil
            list = nil
        }
        
        do {//无主引用实例
            class Student {
                let name: String
                var section: Marks?
                
                init(name: String) {
                    self.name = name
                }
                
                deinit { print("\(name)") }
            }
            class Marks {
                let marks: Int
                unowned let stname: Student
                
                init(marks: Int, stname: Student) {
                    self.marks = marks
                    self.stname = stname
                }
                
                deinit { print("学生的分数为 \(marks)") }
            }

            var module: Student?
            module = Student(name: "ARC")
            module!.section = Marks(marks: 98, stname: module!)
            module = nil
        }
        
        /**
         弱引用和无主引用
         当闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。

         相反的，当捕获引用有时可能会是nil时，将闭包内的捕获定义为弱引用。

         如果捕获的引用绝对不会置为nil，应该用无主引用，而不是弱引用。
         */
        do {
            class HTMLElement {
                
                let name: String
                let text: String?
                
                lazy var asHTML: () -> String = {
                    [unowned self] in
                    if let text = self.text {
                        return "<\(self.name)>\(text)</\(self.name)>"
                    } else {
                        return "<\(self.name) />"
                    }
                }
                
                init(name: String, text: String? = nil) {
                    self.name = name
                    self.text = text
                }
                
                deinit {
                    print("\(name) 被析构")
                }
                
            }

            //创建并打印HTMLElement实例
            var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
            print(paragraph!.asHTML())

            // HTMLElement实例将会被销毁，并能看到它的析构函数打印出的消息
            paragraph = nil
            
            /**
             weak 和 unowned 的额外理解：
             
             protocol ModelObjectDelegate: class {
                 
             }
             class ModelObject {
                 weak var delegate: ModelObjectDelegate?
             }
             
             倘若你使用 unowned，它不允许设为可选类型。因为一个 unowned 属性不能为可选类型，那么它必须在 init 方法中初始化值：
             
             protocol ModelObjectDelegate: class {
                 
             }
             class ModelObject {
                 //译者注：swift要求变量一定要有初始值
                 //        可选类型默认初始值为nil
                 unowned var delegate: ModelObjectDelegate
                 init(delegate:ModelObjectDelegate) {
                     self.delegate = delegate
                 }
             }
             */
        }
        
    }
}
