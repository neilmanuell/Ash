package ash.fsm
{
import ash.core.Entity;

/**
 * Used by the EntityStateMachine class to create the mappings of components directly on the Entity via a fluent interface.
 */
internal class EntityComponentMapping
{

    /**
     * Used internally, the constructor creates a component mapping directly on the Entity
     *
     * @param entity The Entity on which to map components
     * @param type The component type for the mapping
     */
    public function EntityComponentMapping( entity:Entity, type:Class )
    {
        this.entity = entity;
        componentType = type;
    }

    private var componentType:Class;
    private var entity:Entity;

    /**
     * Creates a mapping for the component type to a specific component instance.
     *
     * @param component The component instance to use for the mapping
     * @return This ComponentMapping, so more modifications can be applied
     */
    public function withInstance( component:* ):EntityComponentMapping
    {
        entity.add( component, componentType );
        return this;
    }

    /**
     * Creates another EntityComponentMapping wrapping the same Entity, so a fluent interface
     * can be used when configuring EntityStateMachine
     *
     * @param type The type of component to add a mapping to the state for
     * @return The new ComponentMapping for that type
     */
    public function add( type:Class ):EntityComponentMapping
    {
        return new EntityComponentMapping( entity, type );
    }
}
}
