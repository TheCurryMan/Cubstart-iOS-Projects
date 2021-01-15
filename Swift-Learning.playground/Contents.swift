import UIKit

//var str:String = "Hello, playground"
//
//
//var age = 19 // variable
//let name = "Avi" // constant
//
//if name == "Avi" { // if condition
//    print("Welcome, \(name)")
//}
//
//var numbers = [1,2,3,4,5]
//
//for num in numbers {
//    print("The number is \(num)")
//}
//
func multiplyTwoNumbers(a:Int, b:Int) -> Int {
    return a * b
}

multiplyTwoNumbers(a: 5, b: 10)

func facebookLoginAuth(name: String, age: Int, westCoast: Bool) {
    if (age <= 13 && !westCoast) {
        print("Too young for Facebook")
    } else {
        print("Welcome to Facebook, \(name)")
    }
}

facebookLoginAuth(name: "Bob", age: 12, westCoast: true)
