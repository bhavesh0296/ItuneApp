import UIKit

struct Music {
    let id = UUID()
    let name = "Beat it"
}

let music1 = Music()
let music2 = music1

print(music1)
print(music2)
