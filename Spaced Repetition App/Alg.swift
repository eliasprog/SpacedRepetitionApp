import Foundation

struct Alg {

    static func classificate(nextStudyDay: Int, val: Int) -> Int {

        switch (val) {
            case 0:
                return nextStudyDay
            case 1:
                return nextStudyDay + 1
            case 2:
                return (nextStudyDay + 1) * 2
            default:
                return 0
        }

    }

}