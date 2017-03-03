package house

/**
 * Created by gtohill on 26/02/17.
 */
class PersonHouse {
    String personId
    String houseId



    static constraints = {
        personId blank:false
        houseId blank:false
    }
}
