package house
/**
 * Created by gtohill on 16/02/17.
 */
class BootStrap {
    def init = { servletContext ->
        //ADD HOUSE
        House testHouse = new House(houseName: '1stHouse', houseId: '1').save()


        //Add person

        Person testPerson1 = new Person(firstName:'Gary', lastName:'Tohill', subId:'107726694172578448865', email:'johnhend1974@gmail.com').save()
        Person testPerson2 = new Person(firstName: 'Rupi', lastName: 'Bains', subId: '11256632556454563', email:'rupi@gmail.com').save()
        Person testPerson3 = new Person(firstName: 'Mark', lastName: 'Johnson', subId: '11002002022004', email:'mark@gmail.com').save()
        /*new Person(firstName: 'Waylan', lastName: 'Smithers', sub_id: '115', houseId: '001').save()
        new Person(firstName: 'Bart', lastName: 'Simpson', sub_id: '116', houseId: '002').save()
        new Person(firstName: 'Homer', lastName: 'Simpson', sub_id: '117', houseId: '002').save()
        new Person(firstName: 'Marge', lastName: 'Simpson', sub_id: '118', houseId: '002').save()
        new Person(firstName: 'Lisa', lastName: 'Simpson', sub_id: '119', houseId: '002').save()*/


        //add house and person to PersonHouse table
        PersonHouse testPersonHouse1 = new PersonHouse(personId: testPerson1.subId, houseId:testHouse.houseId).save()
        PersonHouse testPersonHouse2 = new PersonHouse(personId:testPerson2.subId, houseId:testHouse.houseId).save()
        PersonHouse testPersonHouse3 = new PersonHouse(personId: testPerson3.subId, houseId:testHouse.houseId).save()
    }

    def destroy = {
    }
}
