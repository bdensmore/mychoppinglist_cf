/**
* I am a new handler
*/
component{
	property name="ormService" inject="entityService";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {create='POST'};

	function preHandler( event, rc, prc, action, eventArguments ){
    }
    /*
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	*/

	function create(event,rc,prc){
        prc.errors = "";
        var user = ormService.new( "User",
                        {
                            user_name = rc.user_name,
                            password = rc.password
                        }
                    );

        validation = validateModel( user );

        if ( !validation.hasErrors() ) {
			ormService.save( user );
        } else {

        	runEvent(
				event = "main.validate",
				eventArguments = {

					validation = validation,
					eventToRun = "users.new"

				},
				persist = "user_id"
			);

       }

        event.setView("users/create");
	}

    function list( event, rc, prc ) {
        var user = ormService.getAll( "User" );
        prc.user = user;
    }

    function edit( event, rc, prc ) {
        prc.formAction = "users.update";
        prc.errorView = "";
		prc.buttonTitle = "Edit User";

        var user = ormService.get ( "User", rc.user_id );
        prc.user_name = user.getUser_Name();
        prc.password = user.getPassword();

		if ( flash.exists( "errors" ) ) {
			prc.errorView = renderView( view = "_templates/form_errors" );
		}
    }

    function update( event, rc, prc ) {
		prc.errors = "";
		var user = ormService.findWhere( "User", {id = rc.user_id} );
		user.setUser_Name( rc.user_name );
		user.setPassword( rc.password);
		ormClearSession();

        validation = validateModel( user );

        if ( !validation.hasErrors() ) {
			ormService.save( user );
        } else {

        	runEvent(
				event = "main.validate",
				eventArguments = {
					validation = validation,
					eventToRun = "users.edit"
				},
				persist = "user_id"
			);
       }
    }

    function new( event, rc, prc ) {
        prc.errorView = "";
        prc.user_name = "";
        prc.password = "";
        prc.formAction = "users.create";

        if ( flash.exists( "errors" ) ) {
            prc.errorView = renderView( view = "_templates/form_errors" );
        }

    }


}
