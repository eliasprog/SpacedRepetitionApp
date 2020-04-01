import Foundation

class Scripts {

    static let cardDAO = CardDAO()
    static let dateFormatter = DateFormatter()
    

    static func getStudyCards() -> Int {

        var i = 0
        let cards = cardDAO.listarCards()

        for card in cards {
            if Scripts.isToday(dateString: card.nextStudyDay) {
                i += 1
            }
        }
        
        return i
    }

    static func updateCardsToStudy() {
        let now = Date()
        let cards = cardDAO.listarCards()

        dateFormatter.dateFormat = "dd-MM-yyyy"

        for card in cards {
            
            let nowString = dateFormatter.string(from: now)

            let nextStudyDay = dateFormatter.date(from: card.nextStudyDay)
            let nowSemHora = dateFormatter.date(from: nowString)

            if nextStudyDay!.compare(nowSemHora!) == .orderedAscending  {
                card.nextStudyDay = dateFormatter.string(from: nowSemHora!)
            }
        }

        cardDAO.saveCards(cards: cards)
    }

    static func isToday(dateString: String) -> Bool {
        
        let now = Date() //agora
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let nowString = dateFormatter.string(from: now)

        let nextStudyDay = dateFormatter.date(from: dateString)
        let nowSemHora = dateFormatter.date(from: nowString)

        if nextStudyDay!.compare(nowSemHora!) == .orderedSame {
            return true
        }
        
        return false

    }

    static func incrementDate(data: String, val: Int ) -> String {

        dateFormatter.dateFormat = "dd-MM-yyyy"

        var dataToChange = dateFormatter.date(from: data)
        
        dataToChange!.addTimeInterval(TimeInterval(val))

        let dataToReturn = dateFormatter.string(from: dataToChange!)

        return dataToReturn

    }
}