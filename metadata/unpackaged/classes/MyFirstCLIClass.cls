public  class MyFirstCLIClass {
    public MyFirstCLIClass() {

    }

@AuraEnabled
    public static String createCandidate(){

System.debug('Iam in MyFirstCLiClass.cls');

return 'succes';
    }

    
}