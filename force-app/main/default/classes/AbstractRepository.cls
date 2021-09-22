/**
 * @author ercarval - topi
 */
public abstract class AbstractRepository {
    
    virtual
    public List<SObject> save (SObject entity) {
        return save( new List<SObject> {entity} );
    }

    virtual
    public List<SObject> save (List<SObject> entities) {

        upsert entities;

        return entities;
    }

    virtual
    public List<SObject> saveRelated (List<SObject> entities
                                        , String masterRecordId
                                        , String relatedFieldName) {
        if (true) {
            throw new RepositoryException ('Não vai rolar nao');            
        }                                            

        for (SObject entity : entities) {
            entity.put(relatedFieldName , masterRecordId);
        }

        return save(entities);
    }    

    virtual
    public void remove (List<SObject> entities) {
        delete entities;
    }

    
}
