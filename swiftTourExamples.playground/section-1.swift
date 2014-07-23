//The Swift Programming Language: Solutions to Experiments
// June 2014, www.swiftcast.tv


// Experiment 1 : Create a constant with an explicit type Float and a value of 4
let explicitFloat: Float = 4.00

// Experiment 2: Try removing the conversion to String from the last line. What error do you get?
let label = "The width is"
let width = 94

// error: Could not find an overload for '+' that accepts supplied arguments

// This error occurs because width is of implicit type of Int, so it cannnot be concatenated with the label constant, which is of implicit type of String.

// Experiment 3: Use \() to include a floating-point calculation in a string and to include someone's name in a greeting

// 3a: Floating point calculation
let revenue: Float = 160.0
let cost: Float = 70.0
let profit: String = "Today my lemonade stand made \(revenue-cost) dollars of profit"

// 3b: Use someone's name in a greeting
let personsName: String = "Josh"

let greetJosh = "Hi \(personsName)"

// Experiment 4: Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil

// 4a: Change optionalName to nil
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

optionalName = nil

if let name = optionalName {
    greeting = "Hello, \(name)"
}

// 4b: Add an else clause that sets a different greeting if optionalName is nil
if let name = optionalName {
    greeting = "Hello, \(name)"
}
else {
    greeting = "Hello stranger"
}

// Experiment 5: Try removing the default case. What errors do you get?

let vegetable = "red pepper"

switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in this soup"
}

// error: switch must be exhaustive, consider adding a default case

// If we declare the vegetableComment constant before the switch, there is no need for default because its default value has already been declared.


// Experiment 6: Add another variable to keep track of which kind of number was the largest, as well as what that largest number was

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind: String = ""

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}

largest
largestKind

// Experiment 7: Remove the day parameter. Add a parameter to include today's lunch in the greeting
func greet(name: String, todaysLunch: String) -> String {
    return "Hello \(name), today's lunch is \(todaysLunch)."
}

greet("Bob", "Turkey Sandwich")

// Experiment 8: Write a function that calculates the average of its arguments.
func average (numbers: Int...) -> Int {
    var sum = 0
    
    for number in numbers {
        sum += number
    }
    
    return sum/numbers.count
}

average(2, 10)

// Experiment 9: Rewrite closure to return zero for all odd numbers
var numbers = [20, 19, 7, 12]

numbers.map({
    (number: Int) -> Int in
        if number % 2 == 0 {
            return number
        }
        else {
            return 0
        }
    })

// Experiment 10: Add a constant property with let, and add another method that takes an argument
class Shape {
    var numberOfSides = 0
    let dimension = "2d"
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func notSoSimpleDescription(area:Int) -> String {
        return "This is a \(dimension) shape with an area of \(area) inches"
    }
}

let myShape = Shape()
myShape.notSoSimpleDescription(5)

// Experiment 11: Make another subclass of NamedShape called Circle that takes radius and a name as arguments to its initializer. Implement an area and describe method for the Circle class
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    // The initializer method is the entry point to our class. Upon creating an instance, this method will be called, which requires us to pass the arguments it expects on instantiation.
    init(name: String) {
        // Name is a local variable, meaning it's only available via the context of this method. We can assign it to an instance variable with the call to self.name = name. This allows us to call .name on our instance of NamedShape class to retrieve the value.
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Circle: NamedShape {
    var radius: Double
    
    init (name: String, radius: Double) {
        self.radius = radius
        
        super.init(name: name)
        
        self.name = name
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)"
    }
    
    func describe() -> String {
        return "A circle with a radius of \(radius)"
    }
    
    func area() -> Double {
        return 3.14159265 * radius * radius
    }
}

let myCircle = Circle(name: "Example circle", radius: 6.0)

myCircle.name
myCircle.area()
myCircle.describe()

// Experiment 12: Write a function that compares two Rank values by comparing their raw values
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}

let ace = Rank.Ace
let two = Rank.Two
let aceRawValue = ace.toRaw()

func compare(rank1: Rank, rank2: Rank) -> String {
    var higher: Rank = rank1
    
    if rank2.toRaw() > rank1.toRaw() {
        var higher = rank2
    }
    
    return "The higher of the two is \(higher.simpleDescription())"
}

compare(ace, two)

// Experiment 13: Add a color method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
enum Suit: Int {
    case Spades = 1
    case Hearts, Diamonds, Clubs

    func simpleDescription() -> String {
        // When we pass self to switch, self is in the context of the enum. Here meaning Suit. Passing self allows us to access the properties of the enum with the dot notation and doesn't require us to have to use Suit.Spades.
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
        
    }

    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}

let heartsDescription = Suit.Hearts.simpleDescription()
let heartsColor = Suit.Hearts.color()

// Experiment 14: Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit
class Card {
    var rank: Rank
    var suit: Suit
    
    init(cardRank: Rank, cardSuit: Suit) {
        self.rank = cardRank
        self.suit = cardSuit
    }
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    // To get a full deck we need to loop through all the ranks, assign each suit and put those into an array. The rank has a int raw value so we can use that.
    func Deck() -> String {
        var stringTogether = ""
        
        for i in 0..14 {
            if let convertedRank = Rank.fromRaw(i) {
                self.rank = convertedRank
                
                for y in 0..5 {
                    if let convertedSuit = Suit.fromRaw(y) {
                        self.suit = convertedSuit
                        stringTogether = "\(stringTogether) \(self.simpleDescription())"
                    }
                }
                
            }
        }

        return stringTogether
    }
}

let threeOfSpades = Card(cardRank: .Three, cardSuit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
threeOfSpades.Deck()


// Experiment 15: Add a third case to the ServerResponse protocol
enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case ThirdCase(String)
}

// Experiment 16: Write an enumeration that conforms to this protocol
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

class ConformingClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var carModel: String  = "The Toyota Corolla"
    
    func adjust() {
        carModel += " is the best car ever"
    }
}

let conformingClass = ConformingClass()
conformingClass.adjust()

let whichCarIsBest = conformingClass.carModel

// Experiment 17: Write an extension to the Double type that adds an absolute value property

extension Double {
    var absoluteValue: Double {
        return abs(self)
    }
}

let exampleDouble: Double = -40.0
let exampleAbsoluteValue = exampleDouble.absoluteValue

// Experiment 18: Modify the anyCommonElements function to make a function that returns an array of the elements that any two sequences have in common.

func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    
    return false
}

anyCommonElements([1, 2, 3], [3])

func whichCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Array<T.GeneratorType.Element> {
    var toReturn = Array<T.GeneratorType.Element>()
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                toReturn.append(lhsItem)
            }
        }
    }
    
    return toReturn
}

whichCommonElements([1, 2, 3], [3, 2])

// ...function to make a function...

func funcToGetCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> ( () -> [T.GeneratorType.Element] )
{
    var commonElements = Array<T.GeneratorType.Element>()
    for lhsItem in lhs
    {
        for rhsItem in rhs
        {
            if lhsItem == rhsItem
            {
                commonElements += lhsItem
            }
        }
    }
    
    func getCommonElements() -> [T.GeneratorType.Element]
    {
        return commonElements
    }
    return getCommonElements
}

let aFunc = funcToGetCommonElements([1, 2, 3], [3])
aFunc()




