//
//  ClassTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class ClassTest: NSObject {

    class func test(){
        
        do {//===
            
            class SampleClass: NSObject {
                let myProperty: String
                init(s: String) {
                    myProperty = s
                }
            }

            let spClass1 = SampleClass(s: "Hello")
            let spClass2 = SampleClass(s: "Hello")

            if spClass1 === spClass2 {// false
                print("引用相同的类实例 \(spClass1)")
            }

            if spClass1 !== spClass2 {// true
                print("引用不相同的类实例 \(spClass2)")
            }
        }
        
        do {//getter setter
            let demo1 = ClassDemo1.init()
            demo1.name = "Tom"
            print(demo1.name)
            print(demo1.title)
        }
        
        do {//override getter setter
            let demo2 = ClassDemo2.init()
            demo2.name = "Rose"
            print(demo2.name)
        }
        
        do {//重写方法
            class SuperClass {
                func show() {
                    print("这是超类 SuperClass")
                }
            }

            class SubClass: SuperClass  {
                override func show() {
                    print("这是子类 SubClass")
                }
            }

            let superClass = SuperClass()
            superClass.show()

            let subClass = SubClass()
            subClass.show()
        }
        
        do {//重写属性
            class Circle {
                var radius = 12.5
                var area: String {
                    return "矩形半径 \(radius) "
                }
            }

            // 继承超类 Circle
            class Rectangle: Circle {
                var print = 7
                override var area: String {
                    return super.area + " ，但现在被重写为 \(print)"
                }
            }

            let rect = Rectangle()
            rect.radius = 25.0
            rect.print = 3
            print("Radius \(rect.area)")
        }
        
        do {//重写属性观察器
            class Circle {
                var radius = 12.5
                var area: String {
                    return "矩形半径为 \(radius) "
                }
            }

            class Rectangle: Circle {
                var print = 7
                override var area: String {
                    return super.area + " ，但现在被重写为 \(print)"
                }
            }

            let rect = Rectangle()
            rect.radius = 25.0
            rect.print = 3
            print("半径: \(rect.area)")

            class Square: Rectangle {
                override var radius: Double {
                    didSet {
                        print = Int(radius/5.0)+1
                    }
                }
            }

            let sq = Square()
            sq.radius = 100.0
            print("半径: \(sq.area)")
            
            //final 防止重写
        }
        
        do {//指定构造器实例
            class mainClass {
                var no1 : Int // 局部存储变量
                init(no1 : Int) {
                    self.no1 = no1 // 初始化
                }
            }
            class subClass : mainClass {
                var no2 : Int // 新的子类存储变量
                init(no1 : Int, no2 : Int) {
                    self.no2 = no2 // 初始化
                    super.init(no1:no1) // 初始化超类
                }
            }

            let res = mainClass(no1: 10)
            let res2 = subClass(no1: 10, no2: 20)

            print("res 为: \(res.no1)")
            print("res2 为: \(res2.no1)")
            print("res2 为: \(res2.no2)")
        }
        
        do {//便利构造器实例 convenience
            class mainClass {
                var no1 : Int // 局部存储变量
                init(no1 : Int) {
                    self.no1 = no1 // 初始化
                }
            }

            class subClass : mainClass {
                var no2 : Int
                init(no1 : Int, no2 : Int) {
                    self.no2 = no2
                    super.init(no1:no1)
                }
                // 便利方法只需要一个参数
                override convenience init(no1: Int)  {
                    /**
                     swift为了保证安全，有了严格的初始化方法，Swift 中不加修饰的 init 方法都需要在方法中保证所有非 Optional 的实例变量被赋值初始化，那么我们自己想要写个构造方法的时候把当前类所有非optional的实例变量被赋值初始化，那就变得非常麻烦了，所有这时候convenience方法就显得很方便了，这类方法是 Swift 初始化方法中的 “二等公民”，只作为补充和提供使用上的方便。convenience方法中必须调用self.init来保证非optional的实例变量被赋值初始化。
                     */
                    self.init(no1:no1, no2:999)
                }
            }
            let res = mainClass(no1: 20)
            let res2 = subClass(no1: 30)

            print("res 为: \(res.no1)")
            print("res2 为: \(res2.no1)")
            print("res2 为: \(res2.no2)")
        }
        
        do {//指定构造器和便利构造器实例
            class MainClass {
                var name: String
                
                init(name: String) {
                    self.name = name
                }
                
                convenience init() {
                    self.init(name: "[匿名]")
                }
            }
            let main = MainClass(name: "Runoob")
            print("MainClass 名字为: \(main.name)")

            let main2 = MainClass()
            print("没有对应名字: \(main2.name)")

            class SubClass: MainClass {
                var count: Int
                init(name: String, count: Int) {
                    self.count = count
                    super.init(name: name)
                }
                
                override convenience init(name: String) {
                    self.init(name: name, count: 1)
                }
            }

            let sub = SubClass(name: "Runoob")
            print("MainClass 名字为: \(sub.name), count 变量: \(sub.count)")

            let sub2 = SubClass(name: "Runoob", count: 3)
            print("count 变量: \(sub2.count)")
        }
        
        //覆盖一个可失败构造器
        do {
            class Planet {
                var name: String
                
                init(name: String) {
                    self.name = name
                }
                
                convenience init() {
                    self.init(name: "[No Planets]")
                }
            }
            let plName = Planet(name: "Mercury")
            print("行星的名字是: \(plName.name)")

            let noplName = Planet()
            print("没有这个名字的行星: \(noplName.name)")
        }
        
        //可失败构造器 init!
        do {
            struct StudRecord {
                let stname: String
                
                init!(stname: String) {
                    if stname.isEmpty {return nil }
                    self.stname = stname
                }
            }

            let stmark = StudRecord(stname: "Runoob")
            if let name = stmark {
                print("指定了学生名")
            }

            let blankname = StudRecord(stname: "")
            if blankname == nil {
                print("学生名为空")
            }
        }
        
        //访问控制（fileprivate，private，internal，public，open）
        do {
            /**
             5种修饰符访问权限排序
             从高到低排序如下：
             open >public > interal > fileprivate >private
             */
            class A {
                fileprivate func test(){//如果用private修饰，B不能访问
                    print("this is func !")
                }
            }
            class B:A {
                func show(){
                    test()
                }
            }
            
            /**
             1，private
             private 访问级别所修饰的属性或者方法只能在当前类里访问。
             2，fileprivate
             fileprivate 访问级别所修饰的属性或者方法在当前的 Swift 源文件里可以访问。（比如上面样例把 private 改成 fileprivate 就不会报错了）
             3，internal（默认访问级别，internal修饰符可写可不写）
             internal 访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
             如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
             如果是 App 代码，也是在整个 App 代码，也是在整个 App 内部可以访问。
             4，public
             可以被任何人访问。但其他 module 中不可以被 override 和继承，而在 module 内可以被 override 和继承。

             5，open
             可以被任何人使用，包括 override 和继承。

             */
        }
        
    }
}


class ClassDemo1 : NSObject {
    //属性的读写方法
    private var _name: String?
    var name: String? {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    //存储型属性 & 计算型属性
//    var title: String {
//        get {
//            return "Mr " + (name ?? "")
//        }
//    }
    //简写
    var title: String {
        return "Mr " + (name ?? "")
    }
}

class ClassDemo2 : ClassDemo1 {
    override var name: String? {
        get {
            return (super.name ?? "") + "2"
        }
        set {
            super.name = (newValue ?? "") + "1"
        }
        //属性观察器
//        willSet{
//            print("willSet = \(newValue)")
//        }
//        didSet{
//            print("didSet = \(oldValue)")
//        }
    }
}
