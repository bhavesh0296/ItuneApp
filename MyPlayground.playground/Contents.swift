import UIKit

//print("Hello World")
/*
func ThirdGreatest(strArr: [String]) -> String{
  var longest = "";
  var second = "";
  var third = "";
    for idx in 0..<strArr.count {
        let current: String = strArr[idx];
    if (current.count > longest.count) {
      third = second;
      second = longest;
      longest = current;
    } else if (current.count > second.count) {
      third = second;
      second = current;
    } else if (current.count > third.count) {
      third = current;
    }
  }
  return third;
}
*/


var text = "Noel - sees Leon"
var text1 = "A war at Tarawa!"
var text2 = "Anne, I vote more cars race Rome-to-Vienna"
var text3 = "Sample my text"

func PalindromeTwo(str: String) -> String {

    let inputText = str

    let lowerCharacterSet: String = "abcdefghijuklmnopqra"
    let upperCharacterSet: String = "ABCGEFGHIJKLMNOPQURST"

    let filterInput = String(inputText.filter {
        lowerCharacterSet.contains($0) || upperCharacterSet.contains($0)
    })

    let revFilterInput = String(filterInput.reversed())

    if filterInput.caseInsensitiveCompare(revFilterInput) == .orderedSame {
        return "true"
    } else {
        return "false"
    }
}

print(PalindromeTwo(str: text))
print(PalindromeTwo(str: text1))
print(PalindromeTwo(str: text2))
print(PalindromeTwo(str: text3))


func completion(with handler: @escaping (Result<String, Error>) -> Void ) {

    // logic to process Data: whether logic or fetching from Serives layer or database layer

    // if success
    //handler(.success("Success"))

    // if failure
    // handler(.failure(error))
}
