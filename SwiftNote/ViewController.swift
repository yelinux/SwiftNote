//
//  ViewController.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ifLetTest()
        
        ifTest()
        
        switchTest()
        
        forInTest()
        
        whileTest()
        
        repeatWhileTest()
        
        StringChildTest.test()
        
        ArrayTest.test()
        
        DictTest.test()
        
        FuncTest.test()
        
        ClosuresTest.test()
        
        EnumTest.test()
        
        StructTest.test()
        
        ClassTest.test()
        
        ArcTest.test()
        
        ProtocolTest.test()
    }
    
    func ifLetTest(){
        var myString:String?

        myString = "Hello, Swift!"

        if let yourString = myString {
           print("你的字符串值为 - \(yourString)")
        }else{
           print("你的字符串没有值")
        }
    }

    func ifTest(){
        var varA:Int = 100;
        /* 检测布尔条件 */
        if varA == 20 {
            /* 如果条件为 true 执行以下语句 */
            print("varA 的值为 20");
        } else if varA == 50 {
            /* 如果条件为 true 执行以下语句 */
            print("varA 的值为 50");
        } else {
            /* 如果以上条件都为 false 执行以下语句 */
            print("没有匹配条件");
        }
        print("varA 变量的值为 \(varA)");
    }

    func switchTest(){
        var index = 10

        switch index {
           case 100  :
              print( "index 的值为 100")
              fallthrough   //如果在一个case执行完后，继续执行下面的case，需要使用fallthrough(贯穿)关键字。
           case 10,15  :
              print( "index 的值为 10 或 15")
              fallthrough   //如果在一个case执行完后，继续执行下面的case，需要使用fallthrough(贯穿)关键字。
           case 5  :
              print( "index 的值为 5")
           default :
              print( "默认 case")
        }
    }
    
    func forInTest(){
        for index in 1...5 {
            print("\(index) 乘于 5 为：\(index * 5)")
        }
        
        var someInts:[Int] = [10, 20, 30]
        for index in someInts {
           print( "index 的值为 \(index)")
        }
    }
    
    func whileTest(){
        var index = 10

        while index < 20
        {
           print( "index 的值为 \(index)")
           index = index + 1
        }
    }
    
    func repeatWhileTest(){
        var index = 15

        repeat{
            print( "index 的值为 \(index)")
            index = index + 1
        }while index < 20
    }
    

}

