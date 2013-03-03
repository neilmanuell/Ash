package ash.fsm
{
import flash.utils.Dictionary;

/**
 * Represents a state for an EntityStateMachine. The state contains any number of ComponentProviders which
 * are used to add components to the entity when this state is entered.
 */
public class EntityState
{
    /**
     * @private
     */
    internal var providers:Dictionary = new Dictionary();
    internal var retainedProviders:Dictionary = new Dictionary();

    /**
     * Add a new ComponentMapping to this state. The mapping is a utility class that is used to
     * map a component type to the provider that provides the component.
     *
     * @param type The type of component to be mapped
     * @return The component mapping to use when setting the provider for the component
     */
    public function add( type:Class ):StateComponentMapping
    {
        return new StateComponentMapping( this, type );
    }

    /**
     * Get the ComponentProvider for a particular component type.
     *
     * @param type The type of component to get the provider for
     * @return The ComponentProvider
     */
    public function get( type:Class ):IComponentProvider
    {
        return providers[ type ];
    }

    /**
     * To determine whether this state has a provider for a specific component type.
     *
     * @param type The type of component to look for a provider for
     * @return true if there is a provider for the given type, false otherwise
     */
    public function has( type:Class ):Boolean
    {
        return providers[ type ] != null;
    }

    /**
     * Specifies the types of component providers to be retained from the previous
     * state. This allows for lazier creation of states which share most components
     *
     * @param args The type of component to be retained
     * @return The EntityState to enable method chaining
     */
    public function retain( ...args ):EntityState
    {
        for each (var c:Class in args){
            retainedProviders[c] = true;
        }

        return this;
    }


}
}
