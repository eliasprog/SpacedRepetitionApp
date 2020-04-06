import Foundation

class Scripts {
    // variaveis
    static let cardDAO = CardDAO()
    static let dateFormatter = DateFormatter()

    /**
     * Script que retorna o numero de cards a serem estudados no dia.
     */
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
    
    static func stringToday() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let nowString = dateFormatter.string(from: now)
        
        return nowString
    }

     /**
     * Script para atualizar os cards não estudados anteriormento
     * para serem estudados no dia atual. 
     */
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

    /**
     * Script para verificar se uma data é o dia atual.
     */
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

    /**
     * Script para incrementar uma data.
     */
    static func incrementDate(data: String, val: Int ) -> String {

        dateFormatter.dateFormat = "dd-MM-yyyy"

        var dataToChange = dateFormatter.date(from: data)
        
        dataToChange!.addTimeInterval(TimeInterval(val * 86400))

        let dataToReturn = dateFormatter.string(from: dataToChange!)

        return dataToReturn

    }
}
