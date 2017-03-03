package house
/**
 * Created by gtohill on 16/02/17.
 */
class Person {

    String  firstName
    String  lastName
    String  subId
    String  email

    static constraints = {
        subId size: 2..50, unique: true
        //email email: true, blank:false
    }

}
