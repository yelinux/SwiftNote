//
//  StructTest.swift
//  SwiftNote
//
//  Created by chenyehong on 2021/11/3.
//

import UIKit

class StructTest: NSObject {

    class func test(){
        
        do{
            struct studentMarks {
               var mark1 = 100
               var mark2 = 78
               var mark3 = 98
            }
            let marks = studentMarks()
            print("Mark1 是 \(marks.mark1)")
            print("Mark2 是 \(marks.mark2)")
            print("Mark3 是 \(marks.mark3)")
        }
        
        do {
            struct MarksStruct {
               var mark: Int

               init(mark: Int) {
                  self.mark = mark
               }
            }
            var aStruct = MarksStruct(mark: 98)
            var bStruct = aStruct // aStruct 和 bStruct 是使用相同值的结构体！
            bStruct.mark = 97
            print(aStruct.mark) // 98
            print(bStruct.mark) // 97
        }
        
        do {
            struct markStruct{
                var mark1: Int
                var mark2: Int
                var mark3: Int
                
                init(mark1: Int, mark2: Int, mark3: Int){
                    self.mark1 = mark1
                    self.mark2 = mark2
                    self.mark3 = mark3
                }
            }

            print("优异成绩:")
            var marks = markStruct(mark1: 98, mark2: 96, mark3:100)
            print(marks.mark1)
            print(marks.mark2)
            print(marks.mark3)

            print("糟糕成绩:")
            var fail = markStruct(mark1: 34, mark2: 42, mark3: 13)
            print(fail.mark1)
            print(fail.mark2)
            print(fail.mark3)
        }
    }
}
