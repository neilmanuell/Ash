package ash.fsm
{
import ash.core.Entity;

internal class EntityComponentMapping
{
    public function EntityComponentMapping( entity:Entity, type:Class )
    {
        this.entity = entity;
        componentType = type;
    }

    private var componentType:Class;
    private var entity:Entity;

    public function withInstance( component:* ):EntityComponentMapping
    {
        entity.add( component, componentType );
        return this;
    }

    public function add( type:Class ):EntityComponentMapping
    {
        return new EntityComponentMapping( entity, type );
    }
}
}
