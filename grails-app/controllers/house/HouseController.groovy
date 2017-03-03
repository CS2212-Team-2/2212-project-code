package house

class HouseController {

    def index() {
        //check if user has valid session
        if(session['subId']) {
            def mess = params['message']
            def person = params['person']
            String[] p = person.split(',')
            Person per = new Person()
            per.subId = p[0]
            per.firstName = p[2]
            [message: mess, person: per]
        }
        else{
            redirect(action:'/')
        }
    }
    //direct method from controller: person, action:saveperson().  Method creates a new house
    def createhouse(){
        if(session['subId']) {
            def count = (House.count() + 1).toString()
            [idNumber: count]
        }else{
            redirect(url:'/')
        }
    }

    //redirect method from login - controller takes person to their house
    def myHouse() {
        if(session['subId']) {
            def persons = Person.list()
            String houseId = session['houseId']
            //search database for subId as personId
            def list = PersonHouse.executeQuery("SELECT p.personId "+
                    "FROM PersonHouse p " +
                    "WHERE p.houseId = '${houseId}' ")
            //remove user from list
            String[] findSubId = new String[list.size()-1]
            int k =0
            String pid = session['subId']
            for(int i = 0; i <list.size(); i++){
                String id = list[i]
                if(pid != id){
                    findSubId[k] = id
                    k++
                }
            }

            //search Person table for firstName based on subId from list
            LinkedList<String> nameList = new LinkedList<String>()
            def person = Person.list()

            for(int i = 0; i < findSubId.size(); i++){
                String nameSubId = findSubId[i]
                def retPerson = Person.executeQuery("SELECT p.firstName, p.email, p.subId " +
                        "FROM Person p " +
                        "WHERE p.subId = '${nameSubId}'"
                )
                nameList.add(retPerson)

            }
            def name = Person.executeQuery("SELECT p.firstName " +
                    "FROM Person p " +
                    "WHERE p.subId = '${session['subId']}'")

            String firstName = name[0]

            [persons:nameList, user:firstName]
        }
        else{
            def persons = Person.list()
            [person: persons]

        }

    }
    //from createhouse.gsp
    def save(){
        if(session['subId']) {
            def house = new House(params)
            house.save()                             //save house to House table
            PersonHouse ph = new PersonHouse(personId: session['subId'], houseId:house.id)
            ph.save()                               //save personhouse to PersonHouse Table
            session['houseId'] = house.id
            session['houseName'] = house.houseName


            redirect(action:'index', controller:'EmailSender')
        }else{
            redirect(url:'/')
        }
    }

    def addroommate(){
        if(session['subId']) {
            [message: params['message']]
        }else{

        }
    }

    //method sends email to roommates added by house creator
    def sendLink(){
        render "Success"
        if(session['subId']) {
            def items = params
            //send email to roommates
            def message = "Hello ${session['firstName']}! Your house # is ${session['houseId']}"
            redirect(action:'addroommate')
        }else{
            redirect(url:'/')
        }
    }
    //CONSIDER DELETING
    def personsave(){
        def person = new Person(params)
        person.save()
        render (view:"save.gsp")
    }

    //----this block of methods belong together
    //this is the controller for the page that referred user will use to join house
    def joinhouse(){

    }
    //this controller is to register user to a referred house
    def joinform(){
        def googleProfile = params.googleProfile
        if(!googleProfile.equals(',,,')) {
            String[] p = googleProfile.split(',')
            session['firstName'] = p[0]
            session['lastName'] = p[1]
            session['subId'] = p[2]
            session['email'] = p[3]

            [person: session]
        }else{
            def message ="IMPORTANT You need to log into google to access this app"
            redirect (uri:'/', params:[message:"IMPORTANT You need to log into google to access this app"])
        }
    }

    //saves new user to person table
    def saveform(){
        def userInformation = params
        String houseId = params.houseId
        String firstName = params.firstName
        String lastName = params.lastName
        String subId = params.subId
        String email = params.email
        //add to person table
        def person = new Person(firstName:firstName, lastName:lastName, subId:subId, email:email).save()
        //add person and house id to personHouse table
        def personHouse = new PersonHouse(personId:subId, houseId:houseId).save()
        session.invalidate()
        redirect(uri:'/', params:[message:"Thank you for joining HouseMates! Please login below."])
    }
    //----block ends

    def houselist(){
        //use for getting list of all houses
        def list = House.list()
        render "House id: ${list.id}"
        render ",  House Name: ${list.houseName}"
    }
    def count(){
        def housecount = House.count()
        render housecount
    }
}
