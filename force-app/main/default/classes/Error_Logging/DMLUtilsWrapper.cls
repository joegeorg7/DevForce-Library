public inherited sharing class DMLUtilsWrapper {
    
    public List<Database.Error>           databaseErrorList;
    public List<Database.SaveResult>      saveResultList;
    public List<Database.DeleteResult>    deleteResultList;
    public List<Database.UndeleteResult>  undeleteResultList;
    public List<Database.UpsertResult>    upsertResultList;

        public DMLUtilsWrapper(List<Database.SaveResult> saveResultList,     List<Database.Error> databaseErrorList) {
                this.saveResultList    = saveResultList;
                this.databaseErrorList = databaseErrorList;
        }
        public DMLUtilsWrapper(List<Database.DeleteResult> deleteResultList, List<Database.Error> databaseErrorList) {
                this.saveResultList    = saveResultList;
                this.databaseErrorList = databaseErrorList;
        }
        public DMLUtilsWrapper(List<Database.UndeleteResult> undeleteResultList, List<Database.Error> databaseErrorList) {
                this.undeleteResultList = undeleteResultList;
                this.databaseErrorList  = databaseErrorList;
        }
        public DMLUtilsWrapper(List<Database.UpsertResult> upsertResultList, List<Database.Error> databaseErrorList) {
                this.upsertResultList  = upsertResultList;
                this.databaseErrorList = databaseErrorList;
        }

}
