import Foundation

struct Alg {

    static func classificate(val: Int) -> Int {

        let secondsInDay = 86400

        switch (val) {

            case 1:
                return secondsInDay

            case 2:
                return (secondsInDay * 2)

            default:
                return 0
                
        }

    }

}