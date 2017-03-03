package house

class PersonController {
    //list persons in Person database
    def index() {
        if(session['subId']) {
            def persons = Person.list()
            String houseId = session['houseId']
            //search database for subId as personId
            def list = PersonHouse.executeQuery("SELECT p.personId "+
                    "FROM PersonHouse p " +
                    "WHERE p.houseId = '${houseId}' ")

            //search Person table for firstName based on subId from list
            LinkedList<String> nameList = new LinkedList<String>()
            def person = Person.list()

            for(int i = 0; i < list.size(); i++){
                String nameSubId = list[i]
                def retPerson = Person.executeQuery("SELECT p.firstName, p.email, p.subId " +
                        "FROM Person p " +
                        "WHERE p.subId = '${nameSubId}'"
                )
                nameList.add(retPerson)

            }
            [nameList:nameList]
        }
        else{
            def persons = Person.list()
            [person: persons]

        }
    }

    //returns authentication data
    def results() {
        if (params.retId != null) {
            String subId = params.retId
            String[] list = subId.split(',')
            redirect(action: 'myHouse', controller: 'house', params: params)
        } else {
            redirect(action: 'createperson')
        }
    }

    //create new person based on google Id. Data sent from .../index.gsp
    def createperson() {
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
    //save new Person based on google Id. Data sent from createperson() PersonController
    def saveperson() {
        def person = new Person(params)
        def list = Person.list()
        //check if person is already in data base
        if (person.subId in list.subId) {
            render "Person ${person.email} is in the database"
        } else {
            person.save()           //add person to Person Table
            session['subId'] = person.subId         //create a user session
            session['firstName'] = person.firstName
            redirect(action: 'createhouse', controller: 'house')
            /*def person1 = Person.executeQuery(
                    "SELECT p.firstName, p.lastName, p.sub_id " +
                            "FROM Person p " +
                            "WHERE p.sub_id = ${person.sub_id} ")
            LinkedList<String> list = new LinkedList<String>()
            String[] p = person1[0]
            for (int i = 0; i < p.length; i++) {
                String z = p[i]
                list.add(z)
            }
            [lists: list]*/
        }
    }


    def authenticate() {
        //get user google OAuth information
        def auth = params.retId

        try {
            String[] list = auth.split(',')
            String authId = list[0]
            def person = Person.executeQuery(
                    "SELECT p.firstName, p.lastName, p.subId " +
                            "FROM Person p  " +
                            "WHERE p.subId = '${authId}' ")

            String[] p = person[0]

            if (!(authId in p)) {
                //person is not in database
                redirect(action: 'index', controller: 'house',
                        params: [message: "Please Create or Join a House", person: auth])
            } else {
                chain(action: 'myHouse', controller: 'house', model: [object: p])

                }
            }
            catch (Exception ex) {
            render "You are not signed into your Google Account. Please sign-in to google to proceed"
        }
    }
    def delete(){

    }
    //removes person from house
    def remove(){
        if(session['subId']){
            def emailToDelete = params.email

            def verify = Person.executeQuery("SELECT p.email, p.subId FROM Person p " +
                    "WHERE p.email = '${emailToDelete}' ")

            if(verify.isEmpty()){
                render "Email does not match with database, please try again"
            }else{
                String[] list = verify[0]
                if((session['subId'] == list[1]) && (emailToDelete == list[0])) {
                    try {
                        PersonHouse.executeUpdate("DELETE PersonHouse p WHERE p.personId = '${session['subId']}' ")
                        String num = session['houseId']
                        session.invalidate()
                        render "You have been removed from house number: '${num}' "
                    } catch (Exception e) {
                        render e
                    }

                }else{
                    render "failed"
                }
            }
        }
    }


}


