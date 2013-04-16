package ash.fsm
{
import ash.core.Entity;

import asunit.framework.IAsync;

import org.hamcrest.assertThat;
import org.hamcrest.object.isTrue;

public class AddComponentDirectlyTests
{
    [Inject]
    public var async:IAsync;
    private var fsm:EntityStateMachine;
    private var entity:Entity;

    [Before]
    public function createState():void
    {
        entity = new Entity();
        fsm = new EntityStateMachine( entity );
        trace( ":KJH:KJH" );
    }

    [After]
    public function clearState():void
    {
        entity = null;
        fsm = null;
    }

    [Test]
    public function addingComponentWithTypeAddsDirectlyToEntity():void
    {
        fsm.add( MockComponent ).withInstance( new MockComponent );
        assertThat( entity.has( MockComponent ), isTrue() );
    }

    [Test]
    public function addingComponentWithSuperTypeAddsDirectlyToEntity():void
    {
        fsm.add( MockComponent ).withInstance( new MockComponent2 );
        assertThat( entity.has( MockComponent ), isTrue() );
    }

}
}

class MockComponent
{
    public var value:int;
}

class MockComponent2 extends MockComponent
{

}